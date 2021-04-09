import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/property.dart';
import 'api_manager.dart';



class PropertyRepository {
  /// [API ------------------------------------]
  static final ApiManager apiManager = ApiManager();

  static final String propertyEndPoint = '/649717ecd807a64ad5a7075f24e71770/raw/934b32ab741e1ac38640041273bb534009224e0e/property_api';

  static Future<Response> getPropertyInfo() async {
    return apiManager.dio.get(
      propertyEndPoint,
      options: RequestOptions(baseUrl: 'https://gist.githubusercontent.com/manas-raj-shrestha')
    );
  }



  /// [BookMark ------------------------------------]
  Future<bool> markIt(Property property) async {
    if (property.isMarked == false) {
      property.isMarked = true;
    } else {
      property.isMarked = false;
    }

    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('${property.id}', property.isMarked);
    return property.isMarked;
  }


  Future<bool> unmarkIt(Property property) async {
    if (property.isMarked == false) {
      property.isMarked = true;
    } else {
      property.isMarked = false;
    }

    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('${property.id}', property.isMarked);
    return property.isMarked;
  }


  Future<bool> getMarkedProperty(Property prop) async {
    final int _num = prop.id;
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool('$_num') ?? false;
  }


  Future<void> removeMarkedProperty() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    for (int _propertyId = 0; _propertyId < 8; _propertyId++){
      _prefs.remove('$_propertyId');
    }
  }



  /// [Search ------------------------------------]
  Future<List<Property>> searchProperty(String query) async {
    final Response<dynamic> response = await getPropertyInfo();

    List<dynamic> decodedList = json.decode(response.toString());  // [{}] to {}
    final List<Property> parsedList = List<Property>.from(
      decodedList.map((emon) => Property.fromJson(emon)),  // Map<String, dynamic> emon
    );
    if (parsedList.length == 0) return [];

    var _searchedProperties = List<Property>();

    if (query.isNotEmpty) {
      _searchedProperties.clear();

      parsedList.forEach((prop) {
        // print('comm700: title: ' + prop.propertyDetails.title);
        // print('comm701: description: ' + prop.propertyDetails.description);
        prop.propertyDetails.title.contains(query)  // prop1のtitle/desc -> prop2のtitle/desc
            ? _searchedProperties.add(prop)
            : prop.propertyDetails.description.contains(query)
                ? _searchedProperties.add(prop)
                : Container();
      });
    }

    // print('comm: type1: ${parsedList.runtimeType}');
    // print('comm: type2: ${parsedList[0].runtimeType}');
    // print('comm: type3: ${parsedList[0].propertyDetails.title.runtimeType}');
    // print('comm: type4: ${parsedList[0].propertyDetails.description.runtimeType}');

      // _properties.clear();
      // _properties.addAll(parsedList);
      // _properties.forEach((prop) {
      //   print('comm02: ' + prop.ownerName + ':' + prop.ownerPhoneNumber);
      // });
      /// [  query    ]
    return _searchedProperties;
  }
}
