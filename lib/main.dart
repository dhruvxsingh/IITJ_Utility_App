import 'package:designcredits/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:designcredits/features/app/splash_screen/splash_screen.dart';
import 'package:designcredits/features/user_auth/presentation/pages/login_page.dart';
import 'package:designcredits/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:designcredits/welcome.dart';
import 'firebase_options.dart';

Future main() async {
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
      title: 'IITJ Utility App',
      routes: {
        '/': (context) => SplashScreen(
              child: Welcome(),
            ),
        '/Welcome': (context) => Welcome(),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) => Dashboard(),
      },
      // home: Text('hii'),
    );
  }
}
