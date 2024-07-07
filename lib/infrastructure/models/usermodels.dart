class UserModel {
  final String? firstName;
  final String? lastName;
  final String email;
  final String password;
  final String? phoneNo;
  final String? address;
  final String? dob;
  final String? gender;
  final String? bio;

  UserModel(
      {this.firstName,
      this.lastName,
      required this.email,
      required this.password,
      this.phoneNo,
      this.address,
      this.dob,
      this.gender,
      this.bio});
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "first_name": firstName,
      "last_name": lastName,
      "phone_number": phoneNo,
      "date_of_birth": dob,
      "gender": gender,
    };
  }
}
