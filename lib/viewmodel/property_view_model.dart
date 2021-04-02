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
    /*
    Future fetchPrefetchers() async {
      dynamic cities = await ProfileStaticContentRepo().fetchPrefectures();
      List<dynamic> list = json.decode(cities.toString())['results'];
      List<City> parsedList = List<City>.from(list.map((e) => City.fromJson(e)));
      _cities.clear();
      _cities.addAll(parsedList);
    }
    */


    try {
      // Get API data: $response or ${response.data}
      final response = await PropertyRepository.getPropertyInfo();
      print('comm190: $response');
      print('comm200: ${response.data}');

      // List<dynamic> responseList = json.decode(response.toString())['results'];
      // Change from [{}] to {}
      List<dynamic> decodedList = json.decode(response.toString());
      print('comm300: ${decodedList.first}');
      print('comm300v1: ${decodedList.last}');
      final List<Property> parsedList = List<Property>.from(decodedList.map((e) => Property.fromJson(e)));
      print('comm301: ${parsedList.first}');
      print('comm301v1: ${parsedList.last}');

      // final List<Property> parsedList = List<Property>.from(
      //   response.data.map(
      //   // response.map(
      //     (propertyJson) => Property.fromJson(propertyJson),
      //   ),
      // );
      // print('comm20000: ${response.data}');
      print('comm201: ${parsedList.length}');
      // print('comm202: $parsedList');
      print('comm202: ${parsedList[0].ownerName}');
      parsedList.forEach((prop) => print(prop.ownerName + ':' + prop.ownerPhoneNumber));

      print('comm800: $_properties');
      _properties.clear();
      print('comm801: $_properties');
      _properties.addAll(parsedList);  
      print('comm802: $_properties');
      print('comm803: ${_properties.first}');
      _properties.forEach((prop) => print(prop.ownerName + ':' + prop.ownerPhoneNumber));



    } catch (err) {
      rethrow;
    } finally {
      print('comm: getPropertyInfo(): finally');
    }
  }
}
