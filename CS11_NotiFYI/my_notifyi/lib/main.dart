import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_notifyi/admin_login.dart';
import 'package:my_notifyi/firebase_options.dart';
import 'package:my_notifyi/login.dart';
import 'package:my_notifyi/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'NotiFYI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/adminlogin': (context) => Adminlogin()
        });
  }

  // @override
  // // ignore: no_logic_in_create_state
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
}
