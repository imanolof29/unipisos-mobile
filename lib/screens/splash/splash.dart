import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:unipisos/constants.dart';
import 'package:unipisos/screens/home/home.dart';
import 'package:unipisos/screens/login/login.dart';
import 'package:unipisos/services/auth_service.dart';

class Splash extends StatefulWidget{
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>{

  @override
  void initState(){
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async{
    await Future.delayed(const Duration(milliseconds:1000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(appBarColor),
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot){
          return Center(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'uni',
                style: TextStyle(
                  fontFamily: 'Rhodium Libre',
                  fontSize: 50,
                  color: HexColor(negroGris),
                ),
              ),
              Text(
                'pisos',
                style: TextStyle(
                  fontFamily: 'Rhodium Libre',
                  fontSize: 50,
                  color: HexColor(verdePrimary)
                ),
              ),
              Text(
                '.com',
                style: TextStyle(
                  fontFamily: 'Rhodium Libre',
                  fontSize: 50,
                  color: HexColor(blanco)
                ),
              )
            ],
          ),
        );
      }
    ),
  );
  }
  Future checkLoginState( BuildContext context ) async {

    final authService = Provider.of<AuthService>(context, listen: false);

    final autenticado = await authService.isLoggedIn();

    if ( autenticado ) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}

class Loading extends StatelessWidget{
  
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(appBarColor),
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot){
          return Center(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'uni',
                style: TextStyle(
                  fontFamily: 'Rhodium Libre',
                  fontSize: 50,
                  color: HexColor(negroGris),
                ),
              ),
              Text(
                'pisos',
                style: TextStyle(
                  fontFamily: 'Rhodium Libre',
                  fontSize: 50,
                  color: HexColor(verdePrimary)
                ),
              ),
              Text(
                '.com',
                style: TextStyle(
                  fontFamily: 'Rhodium Libre',
                  fontSize: 50,
                  color: HexColor(blanco)
                ),
              )
            ],
          ),
        );
      }
    ),
  );
  }
  Future checkLoginState( BuildContext context ) async {

    final authService = Provider.of<AuthService>(context, listen: false);

    final autenticado = await authService.isLoggedIn();

    if ( autenticado ) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}