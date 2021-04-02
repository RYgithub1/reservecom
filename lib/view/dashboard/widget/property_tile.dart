import 'package:flutter/material.dart';

import '../../property/property_screen.dart';
import 'property_tile_left.dart';
import 'property_tile_right.dart';

/// Widget [PropertyTile] : The PropertyTile is used for Dashboard Screen
class PropertyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return PropertyScreen();
            },
          ));
        },
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: PropertyTileLeft(),
            ),
            Flexible(
              flex: 2,
              child: PropertyTileRight(),
            ),
          ],
        ),
      ),
    );
  }
}
