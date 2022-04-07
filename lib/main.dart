import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unipisos/screens/home/home.dart';
import 'package:unipisos/screens/login/login.dart';
import 'package:unipisos/screens/profile/profile.dart';
import 'package:unipisos/screens/register/register.dart';
import 'package:unipisos/screens/splash/splash.dart';
import 'package:unipisos/services/auth_service.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService() ),
      ],
      child: MaterialApp(
        title: 'unipisos',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Login(),
      ),
    );
  }
}