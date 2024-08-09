import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class authprovider with ChangeNotifier {
    String? _token;
  String? _userId;
  String? _address;
  String? _privatekey;
 bool _isLoading = false;

  bool  get isLoading => _isLoading;


  Future<void> register(String _name,String _email,String _password) async {
    // Replace with your backend URL
    final url = Uri.parse('https://flash-usdt-2.onrender.com/api/auth/register');
    _isLoading=true;
    notifyListeners();
    
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': _name,
          'email': _email,
          'password': _password,
        }),
      );
 _isLoading=true;
    notifyListeners();
      if (response.statusCode == 200) {
        // Handle success
 final data = json.decode(response.body);
        _token = data['token'];
        final payload = decodeJWT(_token!);
        _userId = data['user']['userId'];
        _address = data['user']['address'];
         _privatekey = data['user']['privateKey'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _token!);
        await prefs.setString('userId', _userId!);
        await prefs.setString('userType', _address!);
        await prefs.setString('userType', _privatekey!);


        print('Registration successful.........................');
        // Optionally, navigate to another screen or show a success message
      } else {
        // Handle failure
        print('Registration failed: ${response.reasonPhrase}...............................');
        // Optionally, show an error message to the user
      throw Exception('Failed to register');
      }
    } catch (e) {
      print('An error occurred: $e.......................................');
      throw Exception('Failed to register');
      // Optionally, show an error message to the user
    }
  }
  
  decodeJWT(String s) {}

 String _email = '';
  String _password = '';

  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> login() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('https://your-backend-api.com/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _email,
          'password': _password,
        }),
      );

      if (response.statusCode == 200) {
        // Handle successful login
        print('Login successful');
      } else {
        // Handle error response
        print('Login failed');
      }
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }





  
}