import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unipisos/constants.dart';
import 'package:unipisos/models/anuncio.dart';
import 'package:unipisos/screens/login/login.dart';
import 'package:unipisos/services/anuncio_service.dart';
import 'package:unipisos/services/auth_service.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState()=>_ProfileState();
}

class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final anuncioService = AnuncioService();
    final user = authService.user!;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.firstName ?? 'Sin Nombre'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(authService.user?.username?? "Usuario"),
            ElevatedButton(onPressed: (){
              AuthService.deleteToken();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
              
            }, child: const Text("Logout")),
            Expanded(
              child: FutureBuilder<List<Anuncio>>(
                future: anuncioService.fetchAnuncios(myAnunciosURL),
                builder: (context, snapshot){
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      Anuncio anuncio = snapshot.data![index];
                      return Text(anuncio.titulo);
                    }
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}