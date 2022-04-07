import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:unipisos/constants.dart';
import 'package:unipisos/models/login_response.dart';

class AuthService with ChangeNotifier{

  User? user;

  final _storage = const FlutterSecureStorage();

  bool _authenticated = false;

  bool get authenticated => _authenticated;
  set authenticated(bool value){
    _authenticated = value;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async{

    _authenticated = true;

    final data = {'username':username, 'password':password};

    print(jsonEncode(data));

    final url = Uri.parse(loginURL);

    final response = await http.post(url, headers: { 'Content-Type': 'application/json' }, body: jsonEncode(data));

    print(response.body);

    if (response.statusCode == 200){
      final loginResponse =  LoginResponse.fromJson(json.decode(response.body));
      
      await _saveToken(loginResponse.token!);
      return true;
    }else{
      return false;
    }
  }

  Future<bool> register(String nombre, String apellido, String username, String email, String password) async{
    final data = {
      'first_name':nombre,
      'last_name':apellido,
      'username': username,
      'email':email,
      'password':password,
      'password2':password
    };

    final url = Uri.parse(registerURL);

    final response = await http.post(url, headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if(response.statusCode==201){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> isLoggedIn() async {

    final token = await _storage.read(key: 'token') ?? '';

    final uri = Uri.parse(refreshToken);
    final response = await http.post(uri, 
      headers: { 
        'Content-Type': 'application/json',
        'Authorization': token
      }
    );

    if ( response.statusCode == 200 ) {
      final loginResponse = LoginResponse.fromJson(json.decode(response.body));
      user = loginResponse.user;
      await _saveToken(loginResponse.token!);
      return true;
    } else {
      _logout();
      return false;
    }

  }

  static Future<String?> getToken() async{
    const _storage = FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async{
    const _storage = FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future _saveToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future _logout() async{
    _authenticated = false;
    await _storage.delete(key: 'token');
  }

}