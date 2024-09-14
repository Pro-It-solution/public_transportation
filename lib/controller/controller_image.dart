import 'dart:developer' as developer;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_app00/controller/controller_ocr.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'controller_upload_car_number.dart';

class ControllerImage extends ChangeNotifier {
  /// [image] goal is save image user
  XFile? image;

  /// [selectImage] choice image from gallery
  Future<void> selectImage(BuildContext context) async {
    try {
      developer.log('select image');
      final ImagePicker picker = ImagePicker();

      // Get image from camera
      image = await picker.pickImage(source: ImageSource.camera);
      developer.log('after selection: ${image!.path}');

      if (image != null && context.mounted) {
        developer.log('in if statment: ${image!.path}');

        // Ensure the context is mounted before popping
        await OcrImage(context, image!.path);
      } else {
        developer.log('No image selected');
      }
    } catch (e, stackTrace) {
      developer.log('Error selecting image: $e',
          error: e, stackTrace: stackTrace);
    }
  }

  /// [cropImage] open edit image
  Future<void> cropImage(BuildContext context) async {
    if (image != null) {
      developer.log('in crop  $image');

      CroppedFile? croppedFile =
          await ImageCropper().cropImage(sourcePath: image!.path);

      if (croppedFile != null) {
        // convert XFile
        developer.log('after crop $image');

        image = XFile(croppedFile.path);
        await OcrImage(context, croppedFile.path);
      }
    }
  }

  OcrImage(BuildContext context, String path) async {
    if (image == null) return;

    try {
      developer.log('in ocr $image');

      final InputImage inputImage = InputImage.fromFilePath(path);

      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.japanese);

      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      String text = recognizedText.text;
      developer.log("outer text$text");

      developer.log("in ocr image");

      developer.log("after save image");

      // Perform OCR using flutter_tesseract_ocr

      // Always close the text detector to avoid resource leaks

      // Update OCR and Car Number Providers
      ControllerOCR cOCR = Provider.of<ControllerOCR>(context, listen: false);
      CUploadCar carnumber = Provider.of<CUploadCar>(context, listen: false);
      cOCR.setOCR(text);
      carnumber.salad.setcarNumber(text);
      notifyListeners();
    } catch (e) {
      // Log the error
      developer.log('Error processing image: $e', error: e);
      // Optionally, show a user-friendly error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error processing image: $e')),
      );
    }
  }

  /// [getImageUser] check user image have or not
  /// image picker return File
  // /// is not return Network image default
  // ImageProvider getImageUser(bool isAuth) {
  //   if (image != null) {
  //     return FileImage(File(image!.path));
  //   } else {
  //     if (isAuth) {
  //       return const NetworkImage(MSadalPictureListItem.userImage);
  //     } else {
  //       return const NetworkImage(MSadalPictureListItem.empty);
  //     }
  //   }
  // }

  /// [uploadImage] upload image user in firebase storage
  ///  when choice upload this image or not upload default image save just one
  ///  return image user when complete upload image
  Future<String?> uploadImage(String pathFolder) async {
    try {
      // handel image user selected or not
      if (image != null) {
        // name image path : download/mohamed.png
        String nameImage = p.basename(image!.path);

        // info image user upload
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child('$pathFolder/$nameImage')
            .putData(await image!.readAsBytes());

        // down upload image user
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});

        // download image user
        String urlImage = await taskSnapshot.ref.getDownloadURL();

        // return image upload
        return urlImage;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  /// reset image
  void resetImage() {
    image = null;
    notifyListeners();
  }
}
