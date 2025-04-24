import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  }
}
