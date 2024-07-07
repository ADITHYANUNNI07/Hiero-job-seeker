// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hiero_job_seeker/core/config/api_config.dart';
import 'package:hiero_job_seeker/infrastructure/helper/sharedpreference.dart';
import 'package:hiero_job_seeker/infrastructure/models/usermodels.dart';

class AuthRepositoryProvider with ChangeNotifier {
  final Dio dio = Dio();
  String signupEndpoint = '/job-seeker/signup';
  String loginEndpoint = '/job-seeker/login';

  Future<String> signup(UserModel jobSekeerModel) async {
    try {
      final response = await dio.post(
        '${AppDevConfig.baseURL}$signupEndpoint',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
          },
        ),
        data: jobSekeerModel.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data;
        final token = data['data']['Token'];
        SharedPreferenceClass().saveAccessTokenStatus(token);
        return 'success';
      } else {
        String errorMessage = '';
        if (response.data['error'] == 'user already exist, sign in') {
          errorMessage = response.data['error'];
        } else {
          errorMessage = response.data['message'];
        }
        print(errorMessage);
        print('Signup failed with status code: ${response.statusCode}');
        return errorMessage;
      }
    } catch (e) {
      print('Error during signup: $e');
      throw Exception('Signup failed: $e');
    }
  }

  Future<String> login(UserModel usermodel) async {
    try {
      final response = await dio.post('${AppDevConfig.baseURL}$loginEndpoint',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'accept': 'application/json',
            },
          ),
          data: usermodel.toJson());
      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Login successful!');
        final data = response.data;
        final token = data['data']['Token'];
        print('token:$token');
        SharedPreferenceClass().saveAccessTokenStatus(token);
        return 'success';
      } else {
        String errorMessage = '';
        if (response.data['error'] == 'user already exist, sign in') {
          errorMessage = response.data['error'];
        } else {
          errorMessage = response.data['message'];
        }
        print(
            'Login failed $errorMessage with status code: ${response.statusCode}');
        return errorMessage;
      }
    } catch (e) {
      print('Error during login: $e');
      throw Exception('Login failed: $e');
    }
  }
}
