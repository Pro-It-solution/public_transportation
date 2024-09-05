import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import '../constants/localization.dart';
import '../model/user_account.dart';
import 'controller_image.dart';

class ControllerAuth extends ChangeNotifier {
  /// [dataUser] create object for save data user
  ModelAccountUser dataUser = ModelAccountUser();
  Map<String, dynamic>? userData;

  /// [currentPass ] status isConfirm pass
  String currentPass = '';

  /// [changeCurrentPass] update current pass
  void changeCurrentPass(String? value) {
    currentPass = value ?? '';
    notifyListeners();
  }

  /// [resetAuth] reset provider
  void resetAuth() {
    // empty object (data)
    dataUser = ModelAccountUser();

    // reset pass current
    currentPass = '';
    notifyListeners();
  }

  // ------------------[Firebase]------------------
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool loading = false;
  String errorMessage = '';

  /// [changeLoading] change value loading
  set changeLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  /// [setErrorMessage] handle error auth
  set setErrorMessage(String value) {
    errorMessage = value;
    notifyListeners();
  }

  /// [register] create account on firebase when successful  return `true`  otherwise `false`
  Future<bool> register(BuildContext context) async {
    try {
      // start loading
      changeLoading = true;

      UserCredential userCredential =
          await firebaseAuth.signInWithPhoneNumber(
              : dataUser.phone!, password: dataUser.pass!);

      // check create user or not
      if (userCredential.user != null) {
        // task upload image user
        if (context.mounted) {
          ControllerImage controllerAuthImageUser =
              Provider.of<ControllerImage>(context, listen: false);

          // change image user
          userCredential.user
              ?.updatePhotoURL(await controllerAuthImageUser.uploadImage(
                    'userImage',
                  ));
        }

        // change user name
        userCredential.user?.updateDisplayName((dataUser.userName!));

        // stop loading
        changeLoading = false;
        return true;
      } else {
        // stop loading
        changeLoading = false;
        return false;
      }
    }
    //  on SocketException {
    //   // stop loading
    //   changeLoading = false;
    //   // update user when error register account
    //   setErrorMessage = tr(MLanguages.noconnect.tr());
    //   return false;
    // } on FirebaseAuthException catch (error) {
    //   // stop loading
    //   changeLoading = false;
    //   // update user when error register account
    //   setErrorMessage = error.message ?? 'error firebase ';

    //   return false;
    // }
    catch (error) {
      // stop loading
      changeLoading = false;
      // update user when error register account
      setErrorMessage = error.toString();
      developer.log(error.toString());
      developer.log(dataUser.userName ?? '3');
      developer.log(dataUser.toString());

      return false;
    }
  }

  /// [login] login account on firebase when successful  return `true`  otherwise `false`
  Future<bool> login(BuildContext context) async {
    try {
      // start loading
      changeLoading = true;

      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: dataUser.email!, password: dataUser.pass!);

      // check create user or not
      if (userCredential.user != null) {
        // stop loading
        changeLoading = false;
        return true;
      } else {
        // stop loading
        changeLoading = false;
        return false;
      }
    }
    //  on SocketException {
    //   // stop loading
    //   changeLoading = false;
    //   // update user when error register account
    //   setErrorMessage = tr(MLanguages.noconnect.tr());
    //   return false;
    // } on FirebaseAuthException catch (error) {
    //   // stop loading
    //   changeLoading = false;
    //   // update user when error register account
    //   setErrorMessage = error.message ?? 'error firebase ';
    //   return false;
    // }
    catch (error) {
      // stop loading
      changeLoading = false;
      // update user when error register account
      setErrorMessage = error.toString();
      developer.log(error.toString());
      developer.log(userName);
      developer.log(dataUser.toString());
      return false;
    }
  }

  /// [signInWithFacebook] Facebooklogin account on firebase when successful  return `true`  otherwise `false`
  // Future<bool> signInWithFacebook(BuildContext context) async {
  //   try {
  //     // start loading
  //     changeLoading = true;
  //     // Trigger the sign-in flow
  //     final LoginResult loginResult = await FacebookAuth.instance.login();

  //     // Create a credential from the access token
  //     final OAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //     // Once signed in, return the UserCredential
  //     FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //     return true;
  //   } catch (error) {
  //     // stop loading
  //     changeLoading = false;
  //     // update user when error register account
  //     setErrorMessage = error.toString();
  //     developer.log(error.toString());
  //     developer.log(await userEmail);
  //     developer.log(await userName);
  //     developer.log(dataUser.toString());
  //     return false;
  //   }
  // }

  // /// [resetPass] send email to user for create new password
  // Future<void> resetPass() async {
  //   try {
  //     // start loading
  //     changeLoading = true;
  //     await firebaseAuth.sendPasswordResetEmail(email: dataUser.email!);
  //     // stop loading
  //     changeLoading = false;
  //   } on SocketException {
  //     // stop loading
  //     changeLoading = false;
  //     // update user when error register account
  //     setErrorMessage = tr(MLanguages.noconnect.tr());
  //   } on FirebaseAuthException catch (error) {
  //     // stop loading
  //     changeLoading = false;
  //     // update user when error register account
  //     setErrorMessage = error.message!;
  //   } catch (error) {
  //     // stop loading
  //     changeLoading = false;
  //     // update user when error register account
  //     setErrorMessage = error.toString();
  //     developer.log(error.toString());
  //     developer.log(userEmail);
  //     developer.log(userName);
  //     developer.log(dataUser.toString());
  //   }
  // }

//   /// [isFacebook] to check is facbok or not
//   Future<bool> isFacebook() async {
//     final AccessToken? accessToken = await FacebookAuth.instance.accessToken;
// // or FacebookAuth.i.accessToken
//     if (accessToken != null) {
//       userData = await FacebookAuth.instance.getUserData();

//       // user is logged
//       return true;
//     }
//     return false;
//   }

//   /// [signInWithGoogle] sign in your account in google
//   Future<bool> signInWithGoogle() async {
//     try {
//       changeLoading = true;

//       // Trigger the authentication flow
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       if (googleUser == null) {
//         return false;
//       }
//       // Obtain the auth details from the request
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       // Create a new credential
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       changeLoading = false;

//       // Once signed in, return the UserCredential
//       return true;
//     } catch (error) {
//       changeLoading = false;

//       setErrorMessage = error.toString();
//       return false;
//     }
//   }

  /// [signOut] logout user account
  void signOut() async {
    try {
      changeLoading = true;
      // final GoogleSignIn googleUser = GoogleSignIn();

      // Obtain the auth details from the request

      await firebaseAuth.signOut();
      // await googleUser.disconnect();
      changeLoading = false;
    } on SocketException {
      // stop loading
      changeLoading = false;
      // update user when error register account
      setErrorMessage = tr(ConstantLocalization.noconnect.tr());
    } on FirebaseAuthException catch (error) {
      // stop loading
      changeLoading = false;
      // update user when error register account
      setErrorMessage = error.message!;
    } catch (error) {
      // stop loading
      changeLoading = false;
      // update user when error register account
      setErrorMessage = error.toString();
    }
  }

  // ---------- user -------
  Stream<User?> get userState => firebaseAuth.authStateChanges();

  /// [userName] same displayName
  String get userName {
    return firebaseAuth.currentUser?.displayName ?? 'user test';
  }

  /// [userEmail]
  String get userPhone {
    return firebaseAuth.currentUser?.phoneNumber ?? '077xxxxxxx';

    // return (await facebookData)['email'];
  }

  /// [userPhoto]
}
