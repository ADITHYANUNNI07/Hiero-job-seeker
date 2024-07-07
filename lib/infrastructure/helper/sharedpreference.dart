import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceClass extends ChangeNotifier {
  static const String accessTokenKey = "ACCESSTOKEN";
  static const String userUIDKey = "USERUID";

  String? _accessToken;
  String? _userUid;

  String? get accessToken => _accessToken;
  String? get userUid => _userUid;

  Future<void> saveAccessTokenStatus(String accessToken) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setString(accessTokenKey, accessToken);
    _accessToken = accessToken;
    notifyListeners();
  }

  Future<void> saveUserIdStatus(String userUid) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setString(userUIDKey, userUid);
    _userUid = userUid;
    notifyListeners();
  }

  Future<void> getAccessTokenStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    _accessToken = sf.getString(accessTokenKey);
    print('token:$_accessToken');
    notifyListeners();
  }

  Future<void> getUserIdStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    _userUid = sf.getString(userUIDKey);
    notifyListeners();
  }
}
