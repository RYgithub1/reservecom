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
  List<Property> get properties => [..._properties];    // [..._properties] vs _properties

  bool _isBookedDone = false;  // VMだと共通化 -> 個別ModelClassのValuable
  bool get isBookedDone => _isBookedDone;

  List<bool> _markedPropertyBools = [  /// dafaultValue  [---]
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
    'Dining room', 'Bathroom', 'TV room', 'Bedroom', 'Kitchen',
    'Drawing room', 'Toilet', 'Basin', 'Gym', 'Spa', 'Parking',
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

      /// [========== Filter ==========]    /// [---]
      final List<Property> filterdParsedList = List<Property>();
      parsedList.forEach((prop) {    // prop1, prop2, prop3,,,
        /// [下準備開始（Facility用） ~~~~~~]
        /// [Facility: 1] APIデータ/各property/facilities格納用
        List<String> _propFacilityName = [];
        prop.facilities.forEach((propFacility) {
          _propFacilityName.add(propFacility.name);
        });
        /// [Facility: 2] PropertyScreen/選択したFacility格納用
        List<String> _facilityNameClicked = [];
        for (int _numClicked = 0; _numClicked < _facilitiesAreValues.length; _numClicked++){
          if (_facilitiesAreValues[_numClicked] == true) {
            _facilityNameClicked.add(_facilityNameDefault[_numClicked]);
          }
        }
        /// [Facility: 1 <-> 2] 選択したFacilityがAPI/各property/facilitiesに含まれているか判定
        List<bool> _containFacilityBool = [];
        _facilityNameClicked.forEach((_clickedOne) {
          if (_propFacilityName.contains(_clickedOne)) {
            _containFacilityBool.add(true);
          } else {
            _containFacilityBool.add(false);    // 含まれていない項目ならfalse
          }
        });
        /// [~~~~~~ 下準備終了（Facility用）]
        /// [下準備開始（PriceRange用） ~~~~~~]
        double doublePropRentalPrice = double.parse(prop.rentalPrice.substring(1));
        /// [~~~~~~ 下準備終了（PriceRange用）]
        /// [... 実際にFilter ...]
        if (_ratingValue <= prop.rating    /// [Rating] Can select only one
            && _rangeValues.start <= doublePropRentalPrice    /// [PriceRange] Min price
            && doublePropRentalPrice <= _rangeValues.end    /// [PriceRange] Max price
            && !_containFacilityBool.contains(false)    /// [Facility] 選択したFacilityが、APIのpropに全てある(true)なら、filteredParsedList対象
        ) {
          print('comm861: filterdParsedList対象propあり');
          filterdParsedList.add(prop);    // 共通（[].add重複でerror注意）
        } else {
          print('comm863: filterdParsedList対象propなし');
        }
        print('comm240: filterdParsedList.length: ${filterdParsedList.length}');
      });

      _properties.clear();   /// [---]
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


  Future<void> getFutureValue() async {  /// [name]  [---]
    notifyListeners();    /// [---]
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
