import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unipisos/models/anuncio.dart';

import '../../constants.dart';

class Details extends StatelessWidget{

  Anuncio anuncio;

  Details({required this.anuncio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(anuncio.titulo),
        backgroundColor: HexColor(appBarColor),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network('http://192.168.0.26:8000${anuncio.imagenes[0]}',),
          Text(
            anuncio.titulo,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(anuncio.descripcion),
        ],
      ),
    );
  }
  
}