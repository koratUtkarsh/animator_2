import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Screen/BMI_Screen/Provider/home_provider.dart';
import 'Screen/BMI_Screen/View/home_screen.dart';
import 'Screen/BMI_Screen/View/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(ChangeNotifierProvider(
    create: (context) => HomeProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        'Home': (context) => HomeScreen(),
      },
    ),
  ));
}