import 'package:flutter/material.dart';
import 'package:unipisos/screens/home/home.dart';
import 'package:unipisos/screens/profile/profile.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': ( _ ) => Home(),
  'perfil': ( _ ) => Profile()
};