import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m360_ict/screens/splash_screen.dart';

// Define primary color constant
const Color kPrimaryColor = Color(0xFF47BA80);
const Color kTitleTextColor = Color(0xFF1E1E1E);
const Color kBoldTextColor = Color(0xFF000000);
const Color kGreyTextColor = Color(0xFF838383);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
          home: const SplashScreen(),
        );
      },
      child: const SplashScreen(),
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
