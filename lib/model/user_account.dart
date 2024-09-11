import 'package:new_app00/constants/names.dart';

class ModelAccountUser {
  //setter and getter for user account
  String? phoneNumber;
  String? nationality;
  String? userName;
  ModelAccountUser();
  void setphoneNumber(String? value) => phoneNumber = value;

  void setnationality(String? value) => nationality = value;

  void setUserName(String? value) => userName = value;
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ConstantNames.username: phoneNumber,
      ConstantNames.username: userName,
      ConstantNames.id: nationality
    };
  }

  // read data format map  save on attribute
  ModelAccountUser.fromMap(Map<String, dynamic> map) {
    nationality = map[ConstantNames.id];
    phoneNumber = map[ConstantNames.username];
    userName = map[ConstantNames.username];
  }
  @override
  String toString() =>
      'ModelAccountUser(phoneNumber: $phoneNumber, nationality: $nationality, userName: $userName)';
}
