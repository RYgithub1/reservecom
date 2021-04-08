import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../data/mark.dart';
import '../data/property.dart';
import '../data/user.dart';
import 'api_manager.dart';
import 'database_manager.dart';



class PropertyRepository {
  final DatabaseManager _databaseManager = DatabaseManager();

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
  Future<void> markIt(Property property, User currentUser) async {
    final _mark = Mark(
      markId: int.parse('${Uuid().v1()}'),
      propertyId: property.id,
      markUserId: currentUser.userId,
      markDateTime: DateTime.now(),
    );
    await _databaseManager.markIt(_mark);
  }
}
