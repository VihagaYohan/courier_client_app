import 'package:courier_client_app/navigation/bottomNavigation.dart';
import 'package:courier_client_app/screens/authentication/login_screen.dart';
import 'package:courier_client_app/screens/authentication/onboarding_screen.dart';
import 'package:courier_client_app/screens/home/home_screen.dart';
import 'package:courier_client_app/screens/profile/contact_data_screen.dart';
import 'package:courier_client_app/screens/screens.dart';
import 'package:courier_client_app/services/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:courier_client_app/utils/theme/theme.dart';
import 'package:courier_client_app/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

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

  // runApp(const MyApp());
  runApp(GetMaterialApp(home: MyApp()));
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
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
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
            Routes.contactDataScreen: (context) => ContactDataScreen(),
            Routes.bottomNavigation: (context) => AppBottomNavigation(),
            Routes.createOrder: (context) => CreateOrderScreen()
          },
          //initialRoute: Routes.bottomNavigation,
          home: LoginScreen()
          /* home: userLoggedIn == true
              ? const AppBottomNavigation()
              : const LoginScreen() */
          ),
    );

    // home: const LoginScreen());
  }
}
