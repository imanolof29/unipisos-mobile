import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unipisos/components/auth_field.dart';
import 'package:unipisos/constants.dart';
import 'package:unipisos/screens/home/home.dart';
import 'package:unipisos/screens/profile/profile.dart';
import 'package:unipisos/screens/register/register.dart';
import 'package:unipisos/services/auth_service.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState()=> _LoginState();
}

class _LoginState extends State<Login>{

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SafeArea(
        child:Form(
            key: globalFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthField(
                  icon: Icons.person,
                  placeholder: "Username",
                  controller: usernameController,
                  keyboardType: TextInputType.text,
                  isPassword: false,
                ),
                const SizedBox(height: 40),
                AuthField(
                  icon: Icons.lock,
                  placeholder: "Password",
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  isPassword: true,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height:50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: HexColor(verdePrimary),
                    ),
                    onPressed: authService.authenticated
                    ?() => {
                      print("no hace nada")
                    }
                    :() async {
                      FocusScope.of(context).unfocus();
                      final loginData = await authService.login(usernameController.text, passwordController.text);
                      if(loginData){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()));
                      }else{
                        showCupertinoDialog(context: context, builder: ( _ ) => CupertinoAlertDialog(
                          title: const Text('Error en el login'),
                          content: const Text('Introduce bien tus credenciales'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                            isDefaultAction: true,
                            child: const Text('OK'),
                            onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ));
                      }
                    },
                    child: const Text("LOGIN"),
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register())),
                  child: const Text("¿No tienes cuenta? Registrate"),
                ),
              ],
            ),
          ),
      ),
    );
  }
}