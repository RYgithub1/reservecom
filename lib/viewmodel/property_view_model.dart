import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reservecom/data/facility.dart';

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

  List<bool> _markedPropertyBools = [
    false, false, false, false,
    false, false, false, false,
  ];
  List<bool> get markedPropertyBools => _markedPropertyBools;

  int _ratingValue = 1;
  int get ratingValue => _ratingValue;
  RangeValues _rangeValues = RangeValues(100.0, 7100.0);
  RangeValues get rangeValues => _rangeValues;
  List<bool> _facilitiesAreValues = [
    false, false, false, false, false, false,
    false, false, false, false, false,
  ];
  List<bool> get facilitiesAreValues => _facilitiesAreValues;



  /// [Property Screen --------------------------]
  Future<void> getPropertyInfo() async {
    /// [ > PropertyInfo ]
    _isLoading = true;
    try {
      final Response<dynamic> response = await PropertyRepository.getPropertyInfo();
      List<dynamic> decodedList = json.decode(response.toString());  // [{}] to {}
      final List<Property> parsedList = List<Property>.from(
        decodedList.map((emon) => Property.fromJson(emon)),  // Map<String, dynamic> emon
      );

      final List<Property> filterdParsedList = List<Property>();   
      parsedList.forEach((prop) {
        // print('comm01: ' + prop.ownerName + ':' + prop.ownerPhoneNumber);
        // print('comm02: ' + prop.propertyDetails.title);
        print('comm03: ' + prop.rentalPrice);
        print('comm04: ' + '${prop.rating}');
        print('comm05: ' + '${prop.facilities.length}');

        /// prop1, prop2, prop3,,,
        if (_ratingValue <= prop.rating ) {
          filterdParsedList.add(prop);
        }
        // filterdParsedList
      });
       
      // List<Property> jobList;
      // var filteredList = List<Property>.from(
      //   [
      //     jobList.where((Property e) {
      //       return
      //         e.rental_price > user_min_selected_salary
      //         &&
      //         e.rental_price < user_max_selected_salary
      //     })
      //   ]
      // )

      _properties.clear();
      // _properties.addAll(parsedList);
      _properties.addAll(filterdParsedList);
      _properties.forEach((prop) {
        // print('comm06: ' + prop.ownerName + ':' + prop.ownerPhoneNumber);
        // print('comm07: ' + prop.propertyDetails.title);
        print('comm08: ' + prop.rentalPrice);
        print('comm09: ' + '${prop.rating}');
        print('comm10: ' + '${prop.facilities.length}');
      });
      _isLoading = false;

    } catch (err) {
      rethrow;
    } finally {
      print('comm: Finish getPropertyInfo(): finally');
    }

    /// [ > MarkedProperty ]
    _properties.forEach((prop) async {
      _markedPropertyBools[(prop.id - 1)] = await _propertyRepository.getMarkedProperty(prop);
      notifyListeners();
    });
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
      property.isMarked = _markedPropertyBools[(property.id - 1)];  // if null -> 初期値false
    }
    property.isMarked = await _propertyRepository.markIt(property);  // 一発目false送り,true返る
    _markedPropertyBools[(property.id - 1)] = property.isMarked;  /// _markedPropertyBoolsがtrue
    notifyListeners();
  }


  Future<void> unmarkIt(Property property) async {
    property.isMarked = await _propertyRepository.unmarkIt(property);
    _markedPropertyBools[(property.id - 1)] = property.isMarked;
    notifyListeners();
  }


  Future<void> removeMarkedProperty() async {
    await _propertyRepository.removeMarkedProperty();
    _markedPropertyBools = [
      false, false, false, false,
      false, false, false, false,
    ];
    notifyListeners();
  }



  /// [Filter ------------------------]
  Future<void> getRating(int indexPlusOne) async {
    _ratingValue = indexPlusOne;
    print('comm550: ratingValue: $_ratingValue');
  }

  Future<void> getPriceRange(RangeValues rangeValues) async {
    _rangeValues = rangeValues;
    print('comm551: rangeValues: $_rangeValues');
  }

  Future<void> getFacilitiesAre(Facility _facil, int _facilIndex) async {
    _facilitiesAreValues[_facilIndex] = _facil.isSelected;
    print('comm552: facilitiesAreValue: ${_facilitiesAreValues[_facilIndex]}');
  }

  Future<void> initializeFilter() async {
    _ratingValue = 1;
    _rangeValues = RangeValues(100.0, 7100.0);
    _facilitiesAreValues = [
      false, false, false, false, false, false,
      false, false, false, false, false,
    ];
  }
}
