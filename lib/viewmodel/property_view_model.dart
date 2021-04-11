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

  List<String> _facilityNameDefault = [
    'Dining room', 'Bathroom', 'TV room', 'Bedroom', 'Kitchen', 'Drawing room',
    'Toilet', 'Basin', 'Gym', 'Spa', 'Parking',
  ];




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
      // parsedList.forEach((prop) {
      //   print('comm01: id: ' + '${prop.id}' + 'title: ' + '${prop.propertyDetails.title}');
      // });

      /// [... Filter ...]
      final List<Property> filterdParsedList = List<Property>();          
      parsedList.forEach((prop) {  /// prop1, prop2, prop3,,,
        /// [------------]
        if (_ratingValue <= prop.rating ) {
          filterdParsedList.add(prop);   /// [かつ -> 共通]
        }
        /// [------------]
        double doublePropRentalPrice = double.parse(prop.rentalPrice.substring(1));
        if (_rangeValues.start <= doublePropRentalPrice && doublePropRentalPrice <= _rangeValues.end) {
        }
        /// [------------]
        List<String> _facilityNameClicked = [];                    /// [初期化？]
        for (int _numClicked = 0; _numClicked < _facilitiesAreValues.length; _numClicked++){
          if (_facilitiesAreValues[_numClicked] == true) {
            _facilityNameClicked.add(_facilityNameDefault[_numClicked]);  
          }
        }
        print('comm790: $_facilityNameClicked');

        List<String> _propFacilityName = [];   /// [APIの各property、に含むfacility格納]    
        prop.facilities.forEach((propFacility) {
          _propFacilityName.add(propFacility.name);  
        });
        print('comm661: $_propFacilityName');

        // const found = _propFacilityName.some(r => _facilityNameClicked.includes(r))
        // _propFacilityName.
        
        List<bool> _containFacilityBool = [];
        // for (int _clickedLength = 0; _clickedLength < _facilityNameClicked.length; _clickedLength++){
        //  クリックした配列３つ長さ、
          // _propFacilityName
          // _propFacilityName.forEach((facilityName) {
        _facilityNameClicked.forEach((_clickedLength) {
          if (_propFacilityName.contains(_facilityNameClicked[int.parse(_clickedLength)])) {
            //  各々propに含む_propFacilityNameファシリティの配列.contains (各々含むか"""Bathroom, TV room, Gym''')
            //  これを、各々のprop分 forEachで確認する
            // filterdParsedList.add(prop);
            _containFacilityBool.add(true);
          } else {
            // 1つでも含まなければ、filteredParsedListに含まない
            _containFacilityBool.add(false);
          }
        });
        // }
        if (_containFacilityBool.contains(false)) {
          // filterdParsedList対象外
        } else {
          filterdParsedList.add(prop);
        }
        print('comm662: filterdParsedList: $filterdParsedList');
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
      _properties.addAll(filterdParsedList);
      // _properties.forEach((prop) {
      //   print('comm07: id: ' + '${prop.id}' + 'title: ' + '${prop.propertyDetails.title}');
      // });
      _isLoading = false;

    } catch (err) {
      print('comm: err: $err');
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
  Future<void> getPriceRange(RangeValues priceRangeValues) async {
    _rangeValues = priceRangeValues;
    print('comm551: rangeValues: $_rangeValues');
  }

  Future<void> getRating(int indexPlusOne) async {
    _ratingValue = indexPlusOne;
    print('comm550: ratingValue: $_ratingValue');
  }

  Future<void> getFacilitiesAre(Facility facil, int facilIndex) async {
    _facilitiesAreValues[facilIndex] = facil.isSelected;
    print('comm552: facilitiesAreValue: ${_facilitiesAreValues[facilIndex]}');
  }

  Future<void> initializeFilter() async {
    _rangeValues = RangeValues(100.0, 7100.0);
    _ratingValue = 1;
    _facilitiesAreValues = [
      false, false, false, false, false, false,
      false, false, false, false, false,
    ];
  }
}
