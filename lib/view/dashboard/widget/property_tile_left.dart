import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/property.dart';
import '../../../viewmodel/property_view_model.dart';


/// Widget [PropertyTileLeft] : The PropertyTileLeft is used for Property Tile
class PropertyTileLeft extends StatelessWidget {
  final Property property;
  PropertyTileLeft({@required this.property});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 128,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              property.propertyDetails.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Consumer<PropertyViewModel>(
          builder: (_, _propertyViewModel, child) {
            return Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white.withOpacity(0.5),
              ),
              child: _propertyViewModel.markedPropertyBools[(property.id - 1)] == false
                  ? const Icon(Icons.bookmark_border, size: 16, color: Colors.white)
                  : const Icon(Icons.bookmark, size: 16, color: Colors.orange),
            );
          }
        ),
      ],
    );
  }
}
