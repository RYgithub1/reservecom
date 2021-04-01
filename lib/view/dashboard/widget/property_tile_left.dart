import 'package:flutter/material.dart';

/// Widget [PropertyTileLeft] : The PropertyTileLeft is used for Property Tile
class PropertyTileLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        Container(
          child: Image.asset(
            'assets/images/stevejobs.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0.3),
          ),
          child: Icon(
            Icons.bookmark,
            size: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
