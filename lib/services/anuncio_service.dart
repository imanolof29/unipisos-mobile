import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:unipisos/constants.dart';
import 'package:unipisos/models/anuncio.dart';
import 'package:unipisos/services/auth_service.dart';
import 'package:http/http.dart' as http;

class AnuncioService with ChangeNotifier{

  Future<List<Anuncio>> fetchAnuncios(String url) async{
    final response = await http.get(Uri.parse(url), headers: { 
      'Content-Type': 'application/json', 
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ await AuthService.getToken()}'
      }
    );
    
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(response.body);
      return jsonResponse.map((anuncios) => Anuncio.fromJson(anuncios)).toList();
    } else if(response.statusCode >= 400){
      notifyListeners();
      throw const HttpException("No se han podido cargar los anuncios");
    }else{
      notifyListeners();
      throw Exception("Error");
    }
  }

}