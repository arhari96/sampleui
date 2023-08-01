import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sampleui/Data/Model/UserProfile.dart';

class ImageCropperServices {
  Future cropImageFromUrl({required UserProfile profile}) async {
    // Download Image
    var response = await Dio().get(profile.urls.full, options: Options(responseType: ResponseType.bytes));
    //get temp path
    final directory = await getExternalStorageDirectory();
    final String dir = directory!.absolute.path;
    final String imagePath = "$dir/image.jpg";

    final File imageFile = File(imagePath);
    //change response to image
    imageFile.writeAsBytesSync(response.data);
   
    try {
      // crop the image
      await ImageCropper().cropImage(
        sourcePath: imagePath,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Sample UI',
              toolbarColor: Colors.deepPurple,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      ).then((value) async {
        await ImageGallerySaver.saveFile(value!.path, isReturnPathOfIOS: true);
      });
    } catch (e) {
      print(e);
    }
  }
}
