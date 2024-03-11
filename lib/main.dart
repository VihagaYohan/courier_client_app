import 'package:courier_client_app/screens/authentication/login_screen.dart';
import 'package:courier_client_app/screens/authentication/onboarding_screen.dart';
import 'package:courier_client_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:courier_client_app/utils/theme/theme.dart';
import 'package:courier_client_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Courier App",
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      routes: {
        Routes.onboarding: (context) => const OnBoardingScreen(),
        Routes.loginScreen: (context) => const LoginScreen(),
        Routes.homeScreen: (context) => const HomeScreen()
      },
      initialRoute: Routes.onboarding,
    );
  }
}
