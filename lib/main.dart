import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:imaginarium/firebase_options.dart';
import 'package:imaginarium/src/features/authentication/screens/login_screen.dart';
// import 'package:imaginarium/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,
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
      home: LoginPage(),
    );
  }

}

