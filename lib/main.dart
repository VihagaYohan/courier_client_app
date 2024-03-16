import 'package:courier_client_app/navigation/bottomNavigation.dart';
import 'package:courier_client_app/screens/authentication/login_screen.dart';
import 'package:courier_client_app/screens/authentication/onboarding_screen.dart';
import 'package:courier_client_app/screens/home/home_screen.dart';
import 'package:courier_client_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:courier_client_app/utils/theme/theme.dart';
import 'package:courier_client_app/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        Routes.onboarding: (context) => OnboardingScreen(),
        Routes.loginScreen: (context) => LoginScreen(),
        Routes.homeScreen: (context) => HomeScreen(),
        Routes.profileScreen: (context) => ProfileScreen(),
        Routes.bottomNavigation: (context) => AppBottomNavigation()
      },
      initialRoute: Routes.bottomNavigation,
    );
  }
}
