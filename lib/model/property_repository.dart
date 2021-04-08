import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/property.dart';
import 'api_manager.dart';



class PropertyRepository {
  /// [API ------------------------------------]
  // final ApiManager apiManager = locator<ApiManager>();
  static final ApiManager apiManager = ApiManager();

  static final String propertyEndPoint = '/649717ecd807a64ad5a7075f24e71770/raw/934b32ab741e1ac38640041273bb534009224e0e/property_api';

  static Future<Response> getPropertyInfo() async {
    return apiManager.dio.get(
      propertyEndPoint,
      options: RequestOptions(baseUrl: 'https://gist.githubusercontent.com/manas-raj-shrestha')
    );
  }


  /// [BookMark ------------------------------------]
  Future<bool> markIt(Property property) async {
    if (property.isMarked == false) {
      property.isMarked = true;
    } else {
      property.isMarked = false;
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('${property.id}', property.isMarked); /// 一発目true挿入、登録
    return property.isMarked;    /// 一発目true返す
  }



  Future<bool> unmarkIt(Property property) async {
    if (property.isMarked == false) {
      property.isMarked = true;
    } else {
      property.isMarked = false;
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('${property.id}', property.isMarked);
    return property.isMarked;
  }
}
