import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Data/Constants.dart';
import '../Data/Model/UserProfile.dart';
import '../GetX/Controllers/PhotoController.dart';
import '../Widgets/ImageWidget.dart';

class SearchScreen extends StatelessWidget {
  final controller = Get.find<PhotoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: TextField(
          onChanged: (v) => controller.searchPhotos(query: v),
        ),
      ),
      body: GetBuilder<PhotoController>(
          id: Constants.GETXSEARCHUPDATEKEY,
          init: PhotoController(),
          builder: (_) {
            if (_.searchPhotoList.isEmpty || _.searchPhotoList.length == 0 || _.searchPhotoList == null) {
              return Center(
                child: Text('No Record Found'),
              );
            }
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
