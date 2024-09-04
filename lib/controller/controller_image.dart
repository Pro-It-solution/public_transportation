import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class ControllerImage extends ChangeNotifier {
  /// [image] goal is save image user
  XFile? image;

  /// [selectImage] choice image from gallery
  Future<void> selectImage(BuildContext context, bool isGallery) async {
    // create object from picker
    final ImagePicker picker = ImagePicker();

    // way get image user (gallery)
    image = await picker.pickImage(
      source: isGallery ? ImageSource.gallery : ImageSource.camera,
    );

    if (image != null && context.mounted) {
      Navigator.pop(context);
      cropImage();
    }
  }

  /// [cropImage] open edit image
  Future<void> cropImage() async {
    if (image != null) {
      CroppedFile? croppedFile =
          await ImageCropper().cropImage(sourcePath: image!.path);

      if (croppedFile != null) {
        // convert XFile
        image = XFile(croppedFile.path);
      }

      notifyListeners();
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
