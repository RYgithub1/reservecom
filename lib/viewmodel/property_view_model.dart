import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/property.dart';
import '../model/property_repository.dart';

class PropertyViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<Property> _properties = [];
  List<Property> get properties => [..._properties];
  // List<Property> get properties => _properties;

  Future<void> getPropertyInfo() async {
    try {
      // Get API data: $response or ${response.data}
      final response = await PropertyRepository.getPropertyInfo();

      // Change from [{}] to {}
      List<dynamic> decodedList = json.decode(response.toString());
      final List<Property> parsedList = List<Property>.from(
        decodedList.map((e) => Property.fromJson(e)),
      );
      parsedList.forEach((prop) {
        print('comm01: ' + prop.ownerName + ':' + prop.ownerPhoneNumber);
      });

      _properties.clear();
      _properties.addAll(parsedList);
      _properties.forEach((prop) {
        print('comm02: ' + prop.ownerName + ':' + prop.ownerPhoneNumber);
      });

    } catch (err) {
      rethrow;
    } finally {
      print('comm: getPropertyInfo(): finally');
    }
  }
}
