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

  bool _isBooked = false;
  bool get isBooked => _isBooked;
  bool _isBookedDone = false;
  bool get isBookedDone => _isBookedDone;


  Future<void> getPropertyInfo() async {
    _isLoading = true;
    try {
      final response = await PropertyRepository.getPropertyInfo();
      List<dynamic> decodedList = json.decode(response.toString());  // [{}] to {}
      final List<Property> parsedList = List<Property>.from(
        decodedList.map((emon) => Property.fromJson(emon)),  // e: Parameter type: 'Map<String, dynamic>'
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


  Future<String> getFutureValue() async {
    _isBooked = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));

    try {
      _isBookedDone = true;
      return Future.value('Booked');

      /// [snapshot.hasDataがfalse]
      // return Future.value(null);

      /// [snapshot.hadErrorがtrue]
      // throw Exception('Failed to book');

    } catch (error) {
      return Future.error(error);
    } finally {
      print('comm: getFutureValue(): finally');
      notifyListeners();
    }
  }
}
