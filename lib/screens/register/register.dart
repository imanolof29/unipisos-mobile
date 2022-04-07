import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:unipisos/components/auth_field.dart';
import 'package:unipisos/constants.dart';
import 'package:unipisos/screens/login/login.dart';
import 'package:unipisos/services/auth_service.dart';

class Register extends StatefulWidget{
  _RegisterState createState()=> _RegisterState();
}

class _RegisterState extends State<Register>{

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usuarioController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: globalFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthField(
                  icon: Icons.person,
                  placeholder: "Nombre",
                  controller: firstNameController,
                  keyboardType: TextInputType.text,
                  isPassword: false,
                ),
                const SizedBox(height: 40),
                AuthField(
                  icon: Icons.person,
                  placeholder: "Apellido",
                  controller: lastNameController,
                  keyboardType: TextInputType.text,
                  isPassword: false,
                ),
                const SizedBox(height: 40),
                AuthField(
                  icon: Icons.person,
                  placeholder: "Usuario",
                  controller: usuarioController,
                  keyboardType: TextInputType.text,
                  isPassword: false,
                ),
                const SizedBox(height: 40),
                AuthField(
                  icon: Icons.mail,
                  placeholder: "Email",
                  controller: emailController,
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
                    onPressed:()async{
                      FocusScope.of(context).unfocus();
                      final loginData = await authService.register(
                        firstNameController.text,
                        lastNameController.text,
                        usernameController.text,
                        emailController.text,
                        passwordController.text
                      );
                      if(loginData){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                      }else{
                        print("error");
                      }
                    },
                    child: const Text("REGISTRARSE"),
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: const Text("¿Ya tienes cuenta? Inicia sesion"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}