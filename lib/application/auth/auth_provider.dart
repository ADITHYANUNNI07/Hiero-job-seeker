// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hiero_job_seeker/domain/core/constant.dart';
import 'package:hiero_job_seeker/infrastructure/models/usermodels.dart';

class AuthRepositoryProvider with ChangeNotifier {
  final Dio dio = Dio();
  String signupEndpoint = '/job-seeker/signup';
  Future<String> signup(UserModel jobSekeerModel) async {
    try {
      final response = await dio.post(
        '$baseUrl$signupEndpoint',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
          },
        ),
        data: jobSekeerModel.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Signup successful!');
        final data = response.data;
        final token = data['data']['Token'];

        print(data);

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
}
