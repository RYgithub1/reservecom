import 'package:flutter/material.dart';

import '../../../data/property.dart';

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
          child: Image.network(
            property.propertyDetails.image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0.5),
          ),
          child: const Icon(
            Icons.bookmark,
            size: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
