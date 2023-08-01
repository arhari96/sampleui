import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleui/Data/Constants.dart';
import 'package:sampleui/Data/Model/UserProfile.dart';
import 'package:sampleui/Services/ApiServices/ImageApiServices.dart';

class PhotoController extends GetxController {
  int page = 1;
  List<UserProfile> photoList = [];
  List<UserProfile> searchPhotoList = [];
  ScrollController scrollController = ScrollController();
  @override
  void onInit() async {
    scrollController.addListener(scrollListener);
    photoList = await ImageApiServices.getImageData(
      page: page,
    );
    update([Constants.GETXUPDATEKEY]);

    // TODO: implement onInit
    super.onInit();
  }

  void scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      fetchPhotos();
    }
  }

  void searchPhotos({required String query}) async {
    page = page + 1;
    update([Constants.GETXUPDATEKEY]);
    var _list = await ImageApiServices.searchImage(page: page, query: query);

    update([Constants.GETXSEARCHUPDATEKEY]);
    searchPhotoList = _list;
    update([Constants.GETXSEARCHUPDATEKEY]);
  }

  void fetchPhotos() async {
    page = page + 1;
    update([Constants.GETXUPDATEKEY]);
    var _list = await ImageApiServices.getImageData(
      page: page,
    );

    update([Constants.GETXUPDATEKEY]);
    photoList.addAll(_list);
    update([Constants.GETXUPDATEKEY]);
  }
}
