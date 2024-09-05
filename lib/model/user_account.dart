
class ModelAccountUser {
  //setter and getter for user account
  String? phoneNumber;
  String? photo;
  String? userName;

  void setphoneNumber(String? value) => phoneNumber = value;

  void setphoto(String? value) => photo = value;

  void setUserName(String? value) => userName = value;

  @override
  String toString() =>
      'ModelAccountUser(phoneNumber: $phoneNumber, photo: $photo, userName: $userName)';
}
