import 'dart:developer';
import 'package:hiero_job_seeker/core/api/api_baseservice.dart';
import 'package:hiero_job_seeker/core/config/api_endpoints.dart';
import 'package:hiero_job_seeker/infrastructure/models/jobmodel.dart';

class PostRepository {
  final baseApiService = BaseApiService();
  Future<dynamic> getAllJob(String accessToken) async {
    final response = await baseApiService.getApiCall(
        accessToken, ApiEndpoints.getAllJobEndpoint);
    if (response != null) {
      print(response.data['data']);
      if (response.data['status_code'] == 201 ||
          response.data['status_code'] == 200) {
        log(response.data['data'].toString());
        return response.data['data']
            .map((map) => JobModel.fromJson(map))
            .toList();
      } else {
        String errorMessage = '';
        if (response.data['error'] == 'user already exist, sign in') {
          errorMessage = response.data['error'];
        } else {
          errorMessage = response.data['message'];
        }
        print(errorMessage);
        print('Get Job failed with status code: ${response.statusCode}');
        return response.data['error'];
      }
    } else {
      return 'Sorry, Server is not reachable 🥲';
    }
  }
}
