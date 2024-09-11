// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_app00/constants/localization.dart';
import 'package:new_app00/model/user_account.dart';
import 'dart:developer' as developer;

class CUserInfo extends ChangeNotifier {
  ModelAccountUser accountUser = ModelAccountUser();
  String? setErrorMessage;

  /// const variable
  static const String collectionsID = 'accountUser';

  /// [collectionReference] path when storage data
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(collectionsID);

  Future<bool> upload(BuildContext context, ModelAccountUser user) async {
    try {
      // start loading

      // check create user or not
      // task upload image user
      if (context.mounted) {
        // change image salad

        // upload data to cloud database
        developer.log(user.toString());
        DocumentReference documentReference =
            await collectionReference.add(user.toMap());
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
    accountUser = ModelAccountUser();
  }
}
