import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m360_ict/screens/home_screen.dart';
import 'package:m360_ict/screens/signin_screen.dart';
import 'package:m360_ict/screens/signup_screen.dart';
import 'package:m360_ict/screens/splash_screen.dart';
import 'package:m360_ict/services/auth_service.dart';

// Define primary color constant
const Color kPrimaryColor = Color(0xFF47BA80);
const Color kTitleTextColor = Color(0xFF1E1E1E);
const Color kBoldTextColor = Color(0xFF000000);
const Color kGreyTextColor = Color(0xFF838383);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'M360 ICT',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
            primaryColor: kPrimaryColor,
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => AuthWrapper(),
            '/login': (context) => SignInScreen(),
            '/register': (context) => SignUpScreen(),
            '/home': (context) => HomeScreen(),
          },
        );
      },
    );
  }

  // return MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   title: 'M360 ICT',
  //   theme: ThemeData(
  //     colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
  //     primaryColor: kPrimaryColor,
  //     useMaterial3: true,
  //   ),
  //   home: const SplashScreen(),
  // );
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final AuthService _auth = AuthService();
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => _showSplash = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSplash) {
      return SplashScreen();
    }

    return StreamBuilder<User?>(
      stream: _auth.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return SignInScreen();
          }
          return HomeScreen();
        }
        return SplashScreen();
      },
    );
  }
}
