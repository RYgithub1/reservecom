import 'package:flutter/material.dart';

import '../../property/property_screen.dart';
import 'property_tile_left.dart';
import 'property_tile_right.dart';

/// Widget [PropertyTile] : The PropertyTile is used for Dashboard Screen
class PropertyTile extends StatelessWidget {
  /// [Click処理も渡す]
  // final Article article;
  // final ValueChanged onArticleClick;
  // const PropertyTile({this.article, this.onArticleClick});
  // const PropertyTile({this.onArticleClick});
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
        // onTap: () => onArticleClick(article),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => PropertyScreen(),
          ));
        },
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: PropertyTileLeft(),
            ),
            Expanded(
              flex: 2,
              child: PropertyTileRight(),
            ),
          ],
        ),
      ),
    );
  }
}
