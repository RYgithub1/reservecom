import 'package:dio/dio.dart';

import 'api_manager.dart';

class PropertyRepository {
  // final ApiManager apiManager = locator<ApiManager>();    
  final ApiManager apiManager = ApiManager();

  // static final String propertyEndPoint = '';
  final String fakeApiEndPoint = '/649717ecd807a64ad5a7075f24e71770/raw/934b32ab741e1ac38640041273bb534009224e0e/property_api';

  Future<Response> fetchAppliedJobHistory() async {
    return apiManager.dio.get(
      // propertyEndPoint,
      fakeApiEndPoint,
      options: RequestOptions(baseUrl: 'https://gist.githubusercontent.com/manas-raj-shrestha')
    );
  }
}