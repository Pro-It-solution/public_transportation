import 'package:flutter/material.dart';
import 'package:new_app00/model/m_ocr.dart';

class ControllerOCR extends ChangeNotifier {
  MOCR ocr = MOCR();
  void setOCR(String text) {
    String input = text.replaceAll(RegExp(r'\D'), '');
    ocr.setCarNumber(input);
    notifyListeners();
  }
}
