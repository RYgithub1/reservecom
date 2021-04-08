import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/property.dart';
import '../model/property_repository.dart';



class PropertyViewModel extends ChangeNotifier {
  final PropertyRepository _propertyRepository = PropertyRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<Property> _properties = [];
  List<Property> get properties => [..._properties];
  // List<Property> get properties => _properties;

  bool _isBookedDone = false;  // VMだと共通化 -> 個別ModelClassのValuable
  bool get isBookedDone => _isBookedDone;

  // final List<bool> _markedPropertyBools = [
  List<bool> _markedPropertyBools = [
    false, false, false, false,
    false, false, false, false,
  ];
  List<bool> get markedPropertyBools => _markedPropertyBools;


  /// [Property Screen --------------------------]
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
      // notifyListeners();
    }


    /// [MarkedProperty]
    // await getMarkedProperty(_properties);
    _properties.forEach((prop) async {
      _markedPropertyBools[(prop.id - 1)] = await _propertyRepository.getMarkedProperty(prop);
      // await Future.delayed(Duration(seconds: 1));
      // Future.delayed(Duration(seconds: 1));
      // notifyListeners();
    });
    notifyListeners();
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



  /// [Bookmark ------------------------]
  Future<void> markIt(Property property) async {
    if (property.isMarked == null) {
      property.isMarked = _markedPropertyBools[(property.id - 1)];  // if null -> 最初は初期値false
    }

    property.isMarked = await _propertyRepository.markIt(property);  // 一発目false送りtrue
    _markedPropertyBools[(property.id - 1)] = property.isMarked;  /// _markedPropertyBools該当がtrue
    notifyListeners();
  }


  Future<void> unmarkIt(Property property) async {
    property.isMarked = await _propertyRepository.unmarkIt(property);
    _markedPropertyBools[(property.id - 1)] = property.isMarked;
    notifyListeners();
  }




  // Future<void> getMarkedProperty(List<Property> properties) async {
  //   properties.forEach((prop) async {
  //     _markedPropertyBools[(prop.id - 1)] = await _propertyRepository.getMarkedProperty(prop);
  //   });
  //   notifyListeners();
  // }

  Future<void> removeMarkedProperty() async {
    await _propertyRepository.removeMarkedProperty();
    _markedPropertyBools = [
      false, false, false, false,
      false, false, false, false,
    ];
    notifyListeners();
  }
}
