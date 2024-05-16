class UserModel {
  final String name;
  final String email;
  final String password;
  final String phoneNo;
  final String address;
  final String dob;
  final String gender;
  final String bio;

  UserModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.phoneNo,
      required this.address,
      required this.dob,
      required this.gender,
      required this.bio});
}
