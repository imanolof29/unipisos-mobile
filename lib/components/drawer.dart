import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unipisos/screens/home/home.dart';
import 'package:unipisos/screens/profile/profile.dart';


import '../constants.dart';

class AppDrawer extends StatelessWidget{
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: HexColor(appBarColor),
            ),
            child: const Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}