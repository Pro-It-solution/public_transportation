// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_app00/constants/localization.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;
import '../model/m_car_number.dart';
import 'controller_image.dart';

class CFruitsalad extends ChangeNotifier {
  MCarNumber salad = MCarNumber();
  String? setErrorMessage;

  /// const variable
  static const String collectionsID = 'carNumber';

  /// [collectionReference] path when storage data
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(collectionsID);

  Future<bool> upload(BuildContext context) async {
    try {
      // start loading

      // check create user or not
      // task upload image user
      if (context.mounted) {
        ControllerImage controllerImageUser =
            Provider.of<ControllerImage>(context, listen: false);

        // change image salad
        salad.setImageUrl(await controllerImageUser.uploadImage(
          'fruit salad ',
        ));
        salad.id = DateTime.now().millisecondsSinceEpoch.toString();
        // upload data to cloud database
        DocumentReference documentReference =
            await collectionReference.add(salad.toMap());
        resetData(context);

        // check add news in cloud database
        if (documentReference.id.isEmpty) {
          setErrorMessage = ConstantLocalization.nodata.tr();
          return false;
        } else {
          // reset Data
          if (context.mounted) resetData(context);
          return true;
        }
      }
    } catch (error) {
      // stop loading
      // update user when error register account
      setErrorMessage = error.toString();
      developer.log(error.toString());

      return false;
    }
    return true;
  }

  /// [resetData] delete all data and reset ui upload
  void resetData(BuildContext context) {
    // new object
    salad = MCarNumber();

    // call provider image article
    ControllerImage controllerImage =
        Provider.of<ControllerImage>(context, listen: false);

    controllerImage.resetImage();
  }

  Stream<List<MCarNumber>> get getAllsalad {
    return collectionReference.snapshots().map(_fruitsFromSnapshots);
  }

  // get data as map and return list type of MCarNumber
  List<MCarNumber> _fruitsFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return MCarNumber.fromMap(data);
    }).toList();
  }
}
