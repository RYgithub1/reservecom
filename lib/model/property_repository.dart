import 'package:dio/dio.dart';
import 'package:reservecom/routing/service_locator.dart';

import 'api_manager.dart';

class PropertyRepository {
  // final ApiManager apiManager = locator<ApiManager>();
  static final ApiManager apiManager = ApiManager();

  static final String propertyEndPoint = '/649717ecd807a64ad5a7075f24e71770/raw/934b32ab741e1ac38640041273bb534009224e0e/property_api';

  static Future<Response> getPropertyInfo() async {
    return apiManager.dio.get(
      propertyEndPoint,
      options: RequestOptions(baseUrl: 'https://gist.githubusercontent.com/manas-raj-shrestha')
    );
  }
}
