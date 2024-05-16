// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignUpProviderModel with ChangeNotifier {
  bool? _isFirstNameValid;
  bool? _isEmailValid;
  bool? _isPasswordValid;
  bool? _isPhoneValid;
  bool? _isAddressValid;
  bool? _isDOBValid;
  bool? _isBioValid;
  double _selectedSalary = 0.0;
  bool? get isFirstNameValid => _isFirstNameValid;
  bool? get isEmailValid => _isEmailValid;
  bool? get isPasswordValid => _isPasswordValid;
  bool? get isPhoneNumberValid => _isPhoneValid;
  bool? get isAddressValid => _isAddressValid;
  bool? get isDOBvalid => _isDOBValid;
  bool? get isBioValid => _isBioValid;

  double get selectedSalary => _selectedSalary;

  void setSelectedSalary(double salary) {
    _selectedSalary = salary;
    notifyListeners();
  }

  void validateFirstName(String firstName) {
    if (firstName.isNotEmpty &&
        !firstName.contains(RegExp(r'[0-9]')) &&
        !firstName.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]')) &&
        firstName.length > 3) {
      _isFirstNameValid = true;
    } else {
      _isFirstNameValid = false;
    }
    notifyListeners();
  }

  void validateEmail(String email) {
    _isEmailValid = EmailValidator.validate(email.trim());
    notifyListeners();
  }

  void validatePassword(String password) {
    _isPasswordValid =
        RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password.trim());
    notifyListeners();
  }

  void validatePhoneNumber(String phoneNumber) {
    RegExp phoneNumberRegex = RegExp(r'^[0-9]{10}$');

    _isPhoneValid = phoneNumberRegex.hasMatch(phoneNumber.trim());
    notifyListeners();
  }

  void validateAddress(String address) {
    if (address.trim().length > 6 &&
        !address.contains(RegExp(r'[!@#\$%^&*().?":{}|<>]'))) {
      _isAddressValid = true;
    } else {
      _isAddressValid = false;
    }
    notifyListeners();
  }

  void validateDOB(String dob) {
    if (dob.isEmpty) {
      _isDOBValid = false;
    } else {
      _isDOBValid = true;
    }
    notifyListeners();
  }

  void validateBio(String bio) {
    if (bio.trim().length > 6 &&
        !bio.contains(RegExp(r'[!@#\$%^&*().?":{}|<>]'))) {
      _isBioValid = true;
    } else {
      _isBioValid = false;
    }
    notifyListeners();
  }
}

enum Gender { Nil, Male, Female, Other }

class GenderProvider extends ChangeNotifier {
  Gender _selectedGender = Gender.Nil;

  Gender get selectedGender => _selectedGender;

  void setSelectedGender(Gender gender, TextEditingController controller) {
    _selectedGender = gender;
    controller.text = gender.toString();
    notifyListeners();
  }
}

class JobFilterProvider extends ChangeNotifier {
  bool workFromHome = false;
  bool location = false;
  bool hybrid = false;

  void setWorkFromHome(bool value) {
    workFromHome = value;
    notifyListeners();
  }

  void setLocation(bool value) {
    location = value;
    notifyListeners();
  }

  void setHybrid(bool value) {
    hybrid = value;
    notifyListeners();
  }
}
