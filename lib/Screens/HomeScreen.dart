import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleui/Data/Model/UserProfile.dart';
import 'package:sampleui/GetX/Controllers/PhotoController.dart';
import 'package:sampleui/Screens/SearchScreen.dart';
import 'package:sampleui/Services/ImageServices/ImageCropper.dart';
import 'package:sampleui/Widgets/ImageWidget.dart';
import 'package:sizer/sizer.dart';
import '../Data/Constants.dart';

class HomeScreen extends StatelessWidget {
  final _photoController = Get.put(PhotoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample UI'), centerTitle: true, actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => Get.to(SearchScreen()),
        )
      ]),
      body: GetBuilder<PhotoController>(
          id: Constants.GETXUPDATEKEY,
          init: PhotoController(),
          builder: (_) {
            return GridView.builder(
                itemCount: _.photoList.length,
                controller: _.scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (ctx, index) {
                  UserProfile profile = _.photoList[index];
                  return ImageWidget.gridViewImageView(profile: profile);
                });
          }),
    );
  }
}
