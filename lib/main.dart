import 'package:courier_client_app/navigation/bottomNavigation.dart';
import 'package:courier_client_app/screens/screens.dart';
import 'package:courier_client_app/services/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:courier_client_app/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';
import 'firebase_options.dart';

// utils
import 'package:courier_client_app/utils/utils.dart';

// providers
import 'package:courier_client_app/provider/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // setting-up environment
  Endpoints.setEnvironment(Environment.development);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userLoggedIn = false;

  getLoggedInState() async {
    await Helper.getData<String>(Constants.user).then((value) {
      setState(() {
        userLoggedIn = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    getLoggedInState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Courier App",
          themeMode: ThemeMode.system,
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          routes: {
            Routes.onboarding: (context) => const OnboardingScreen(),
            Routes.loginScreen: (context) => const LoginScreen(),
            Routes.homeScreen: (context) => const HomeScreen(),
            Routes.profileScreen: (context) => const ProfileScreen(),
            Routes.contactDataScreen: (context) => ContactDataScreen(),
            Routes.bottomNavigation: (context) => const AppBottomNavigation(),
            Routes.createOrder: (context) => const CreateOrderScreen(),
            // Routes.checkoutScreen: (context) =>  CheckoutScreen()
          },
          //initialRoute: Routes.bottomNavigation,
          // home: const CheckoutScreen()
          home: userLoggedIn == true
              ? const AppBottomNavigation()
              : const LoginScreen()),
    );
  }
}
