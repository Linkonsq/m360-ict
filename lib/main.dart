import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_ict/screens/splash_screen.dart';

// Define primary color constant
const Color kPrimaryColor = Color(0xFF47BA80);

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
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'M360 ICT',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
            primaryColor: kPrimaryColor,
            useMaterial3: true,
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
