import '../constants/names.dart';

class MCarNumber {
  String? _nationality;
  String? _carNumber;
  String? _phone;

  get getID => _nationality;

  void setID(String? value) => _nationality = value;
  MCarNumber();

  void setuserPhone(userPhone) => _phone = userPhone;

  get getcarNumber => _carNumber;

  void setcarNumber(carNumber) => _carNumber = carNumber;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ConstantNames.carNumber: _carNumber,
      ConstantNames.id: _nationality,
      ConstantNames.phoneNumber: _phone
    };
  }

  // read data format map  save on attribute
  MCarNumber.fromMap(Map<String, dynamic> map) {
    _nationality = map[ConstantNames.id];
    _carNumber = map[ConstantNames.carNumber];
  }

  @override
  String toString() {
    return 'MCarNumber(_nationality: $_nationality, _carNumber: $_carNumber,  _nationality: $_nationality)';
  }
}
