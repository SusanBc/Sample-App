import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:omwaynews/core/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static Future<ApiResponse> loginUser(
      {required Map<String, dynamic> data}) async {
    try {
      final response = await http.post(
          Uri.parse("https://nesog.omwaytechnologies.com/api/auth/login"),
          body: data);
      final jsonDecoded = json.decode(response.body);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("token", jsonDecoded["token"]);
      print("The token is ${sharedPreferences.getString("token")}");
      return ApiResponse(
          data: response.body, error: false, message: response.toString());
    } on HttpException catch (e) {
      return ApiResponse(
        error: true,
        message: e.message,
      );
    }
  }

  static Future<ApiResponse> registerUser(
      {required Map<String, dynamic> data}) async {
    try {
      final response = await http.post(
        Uri.parse("https://nesog.omwaytechnologies.com/api/auth/adduser"),
        body: data,
      );
      return ApiResponse(
          data: response.body, error: false, message: response.toString());
    } on HttpException catch (e) {
      print(e.message);
      return ApiResponse(
        error: true,
        message: e.message,
      );
    } catch (e) {
      return ApiResponse(
        error: true,
        message: "Something went Wrong",
      );
    }
  }
}
