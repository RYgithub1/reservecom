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

  bool _isBookedDone = false;  // VMだと共通化 -> 個別ModelClassのValuable
  bool get isBookedDone => _isBookedDone;


  Future<void> getPropertyInfo() async {
    _isLoading = true;
    try {
      final response = await PropertyRepository.getPropertyInfo();
      List<dynamic> decodedList = json.decode(response.toString());  // [{}] to {}
      final List<Property> parsedList = List<Property>.from(
        decodedList.map((emon) => Property.fromJson(emon)),  // Map<String, dynamic> emon
      );
      parsedList.forEach((prop) {
        print('comm01: ' + prop.ownerName + ':' + prop.ownerPhoneNumber);
      });

      _properties.clear();
      _properties.addAll(parsedList);
      _properties.forEach((prop) {
        print('comm02: ' + prop.ownerName + ':' + prop.ownerPhoneNumber);
      });
      _isLoading = false;

    } catch (err) {
      rethrow;
    } finally {
      print('comm: getPropertyInfo(): finally');
      notifyListeners();
    }
  }


  Future<void> getFutureValue() async {
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    _isBookedDone = true;
    notifyListeners();
  }


  void initializeIsBookedDone() {
    _isBookedDone = false;
  }
}
