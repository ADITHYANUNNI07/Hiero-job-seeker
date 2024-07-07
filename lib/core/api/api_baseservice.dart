import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hiero_job_seeker/core/config/api_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseApiService {
  final dio = Dio();

  Future<Response?> postApiCall(
    String? idToken,
    String apiUrl, {
    dynamic body,
    String? contentType,
  }) async {
    try {
      debugPrint('api : ${AppDevConfig.baseURL + apiUrl} body: $body');
      Response response = await dio.post(AppDevConfig.baseURL + apiUrl,
          data: body,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $idToken'
          }));
      logApiResponse(response);
      return response;
    } catch (e) {
      if (e is DioException) {
        handleApiError('Post', e);
        return e.response;
      } else {
        debugPrint('Get Request Error: $e');
        return null;
      }
    }
  }

  Future<Response?> getApiCall(
    String? firebaseToken,
    String apiUrl, {
    dynamic body,
    String? contentType,
  }) async {
    try {
      final headers = {'Authorization': 'Bearer $firebaseToken'};

      debugPrint('URL ${AppDevConfig.baseURL}$apiUrl ');

      Response response = await dio.get(
        AppDevConfig.baseURL + apiUrl,
        options: firebaseToken == null
            ? null
            : Options(
                headers: headers,
              ),
      );
      //  logApiResponse(response);
      return response;
    } catch (e) {
      if (e is DioException) {
        handleApiError('Get', e);
        return e.response;
      } else {
        debugPrint('Get Request Error: $e');
        return null;
      }
    }
  }

  Future<Response?> patchApiCall(
    String idToken,
    String apiUrl, {
    dynamic body,
    String? contentType,
  }) async {
    try {
      // debugPrint('$idToken');
      // debugPrint('fcm token : $idToken');
      debugPrint("url : ${AppDevConfig.baseURL + apiUrl}");
      Response response = await dio.patch(
        AppDevConfig.baseURL + apiUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $idToken',
          },
        ),
        data: body,
      );
      // logApiResponse(response);
      return response;
    } catch (e) {
      if (e is DioException) {
        handleApiError('Patch', e);
      }
      debugPrint('Patch Request Error: $e');
      return null;
    }
  }

  Future<Response?> uploadProfilePictureCall(
    String? idToken,
    String apiUrl, {
    dynamic body,
    String? contentType,
    XFile? imageXfile,
  }) async {
    try {
      // debugPrint('$idToken');

      final formData = FormData.fromMap({
        'field_name_for_image': MultipartFile.fromFileSync(
          imageXfile?.path ?? "",
          filename: imageXfile?.name,
        ),
      });
      Response response = await dio.post(
        AppDevConfig.baseURL + apiUrl,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $idToken',
          },
        ),
        data: formData,
      );
      if (response.statusCode == 200) {
        // Handle successful upload
        print('Image uploaded successfully!');
      } else {
        // Handle upload error
        print('Error uploading image: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      if (e is DioException) {
        handleApiError('Upload', e);
      }
      debugPrint('Patch Request Error: $e');
      return null;
    }
  }

  Future<Response?> putApiCall(
    String idToken,
    String apiUrl, {
    dynamic body,
    String? contentType,
  }) async {
    try {
      // debugPrint('$idToken');
      // debugPrint('fcm token : $idToken');
      Response response = await dio.put(
        AppDevConfig.baseURL + apiUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $idToken',
          },
        ),
        data: body,
      );
      // logApiResponse(response);
      return response;
    } catch (e) {
      if (e is DioException) {
        handleApiError('Put', e);
        debugPrint("ERROR : ${e.response!.data}");
        debugPrint("ERROR : ${e.response!.headers}");
        debugPrint("ERROR : ${e.message}");
      } else {
        debugPrint('PUT Request Error: $e');
      }
      return null;
    }
  }

  Future<Response?> deleteApiCall(
      String firebaseToken, String apiUrl, int id) async {
    try {
      debugPrint(AppDevConfig.baseURL + apiUrl);
      Response response = await dio.delete(
        AppDevConfig.baseURL + apiUrl,
        queryParameters: {
          'id': id,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $firebaseToken'},
        ),
      );
      // logApiResponse(response);
      return response;
    } catch (e) {
      if (e is DioException) {
        handleApiError('delete', e);
      }
      debugPrint('Delete Request Error: $e');
      return null;
    }
  }
}

void handleApiError(String source, DioException error) {
  debugPrint(' $source : Request Error: ${error.response}');
  if (error.type == DioExceptionType.connectionTimeout ||
      error.type == DioExceptionType.receiveTimeout ||
      error.type == DioExceptionType.sendTimeout ||
      error.type == DioExceptionType.connectionError) {
    Fluttertoast.showToast(msg: "No Internet Connection");
  }
}

logApiResponse(Response? response) {
  if (response != null) {
    debugPrint('Response statuscode : ${response.statusCode}');
    debugPrint('request option : ${response.requestOptions.data}');
    debugPrint('Response data: ${response.data}');
  }
}
