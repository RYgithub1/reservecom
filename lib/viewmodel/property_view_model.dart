import 'package:flutter/material.dart';

import '../data/property.dart';
import '../model/property_repository.dart';


class PropertyViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading =>  _isLoading;

  final List<Property> _properties = [];
  List<Property> get properties => [..._properties];



  Future<void> getPropertyInfo() async {
    try {
      final response = await PropertyRepository.getPropertyInfo();
      print('${response.data}');

      final List<Property> _propertyList
          = List<Property>.from(
              response.data.map((propertyItemJobJson) => Property.fromJson(propertyItemJobJson)),
          );
      _properties.clear();
      _properties.addAll(_propertyList);

    } catch (err) {
      rethrow;
    } finally {
      print('comm: finally');
    }
  }
}
