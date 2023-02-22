import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learn_1/login_screen.dart';
import 'package:learn_1/nonet_screen.dart';
import 'package:connectivity_widget/connectivity_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Room Controller',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ConnectivityWidget(
          builder: (context, isOnline) {
            if (isOnline == true) {
              return LoginScreen();
            } else {
              return NoNetScreen();
            }
          },
        ));
  }
}
//Mark@Store