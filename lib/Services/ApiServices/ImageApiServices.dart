import 'package:sampleui/Data/Constants.dart';
import 'package:sampleui/Data/Model/UserProfile.dart';
import 'package:dio/dio.dart';

class ImageApiServices {
  static Future<List<UserProfile>> getImageData({
    required int page,
  }) async {
    Response _response;
    _response = await Dio().get('${Constants.Url}/photos/', queryParameters: {'page': page, 'per_page': 8, 'client_id': Constants.ACCESSKEY});
    if (_response.statusCode == 200) {
      return userProfileFromJson(_response.data);
    } else {
      return [];
    }
  }

  static Future<List<UserProfile>> searchImage({required int page, required String query}) async {
    Response _response;
    _response = await Dio()
        .get('${Constants.Url}/search/photos/', queryParameters: {'page': page, 'per_page': 8, 'client_id': Constants.ACCESSKEY, 'query': query});
    int _total = _response.data['total'];
    if (_total > 0) {
      return userProfileFromJson(_response.data['results']);
    } else {
      return [];
    }
  }
}
