import 'package:flutter/material.dart';

class AuthField extends StatelessWidget{

  final IconData icon;
  final String placeholder;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;

  const AuthField({
    Key? key,
    required this.icon,
    required this.placeholder,
    required this.controller,
    required this.keyboardType,
    required this.isPassword
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 5),
            blurRadius: 5
          )
        ]
      ),
      child: TextField(
        controller: controller,
        autocorrect: false,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: placeholder
        ),
      ),
    );
  }
}