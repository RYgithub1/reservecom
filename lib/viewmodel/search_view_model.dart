import 'package:flutter/material.dart';

import '../data/property.dart';
import '../model/property_repository.dart';



class SearchViewModel extends ChangeNotifier {
  final PropertyRepository _propertyRepository = PropertyRepository();

  List<Property> _searchedProperties = [];  // query一致Property格納
  List<Property> get searchedProperties => _searchedProperties;


  Future<void> searchProperty(String query) async {
    _searchedProperties = await _propertyRepository.searchProperty(query);
    notifyListeners();
  }
}