class UserModel {
  String? userid;
  String? email;
  String? firstName;
  String? lastName;
  UserModel(
      {required this.email,
      required this.userid,
      required this.firstName,
      required this.lastName});
  UserModel.fromFireStore(Map<String, dynamic> data) {
    userid = data["userid"];
    email = data["email"];
    firstName = data["firstName"];
    lastName = data["lastName"];
  }
  Map<String, dynamic> toFirestore() {
    return {
      "userid": userid,
      "email": email,
      "firstName": firstName,
      "lastName": lastName
    };
  }
}
