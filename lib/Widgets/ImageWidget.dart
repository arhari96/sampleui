import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleui/Data/Model/UserProfile.dart';
import 'package:sizer/sizer.dart';

import '../Data/Constants.dart';
import '../Services/ImageServices/ImageCropper.dart';

class ImageWidget{
  static Widget gridViewImageView({required UserProfile profile}){
     return Container(
                    margin: EdgeInsets.all(3.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: HexColor(profile.color),
                      image: DecorationImage(image: NetworkImage(profile.urls.thumb), fit: BoxFit.cover),
                    ),
                    height: 10.h,
                    width: 20.w,
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(Icons.download),
                      onPressed: () async {
                        await ImageCropperServices().cropImageFromUrl(profile: profile);
                        Get.snackbar('Success!!', 'Image Saved to Gallery', backgroundColor: Colors.purple, colorText: Colors.white);
                      },
                    ),
                  );
               
  }
}