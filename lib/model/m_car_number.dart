
import '../constants/names.dart';

class MCarNumber {
  String? _userPhone;
  String? _carNumber;
  String? _image;
  String? _id;

  get getID => _id;

  set id(String? value) => _id = value;
  MCarNumber();

  void setuserPhone(userPhone) => _userPhone = userPhone;

  get getcarNumber => _carNumber;

  void setcarNumber(carNumber) => _carNumber = carNumber;

  get getImageUrl => _image;

  void setImageUrl(imageurl) => _image = imageurl;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ConstantNames.username: _userPhone,
      ConstantNames.carNumber: _carNumber,
      ConstantNames.image: _image,
      ConstantNames.id: _id
    };
  }

  // read data format map  save on attribute
  MCarNumber.fromMap(Map<String, dynamic> map) {
    _id = map[ConstantNames.id];
    _userPhone = map[ConstantNames.username];
    _carNumber = map[ConstantNames.carNumber];
    _image = map[ConstantNames.image];
  }

  @override
  String toString() {
    return 'MCarNumber(_userPhone: $_userPhone, _carNumber: $_carNumber, _image: $_image, _id: $_id)';
  }
}
