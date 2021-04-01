
import 'package:flutter/material.dart';

/// Widget [PropertyTileRight] : The PropertyTileRight is used for Property Tile
class PropertyTileRight extends StatelessWidget {
  // final Article article;
  // const PropertyTileRight({this.article});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Duplex Apartment',
          style: textTheme.subtitle1.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Stockton New Hampshire',
          style: textTheme.bodyText1.copyWith(
            color: Colors.grey
          ),
        ),
        SizedBox(height: 4),
        Row(
          children: <Widget>[
            Row(
                children: <Widget>[
                  Icon(Icons.star, color: Colors.yellow),
                  Text(
                    '4.8',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '(256 Reviews)',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
          ],
        ),
        SizedBox(height: 4),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Icon(Icons.king_bed_outlined, color: Colors.grey),
                  Text(
                    '5',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Icon(Icons.bathtub_outlined, color: Colors.grey),
                  Text(
                    '2',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Icon(Icons.local_laundry_service_outlined, color: Colors.grey),
                  Text(
                    '1',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.grey, fontSize: 20),
            children: <TextSpan>[
              TextSpan(
                text: '\$1,495',
                style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ' /mo',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        )
      ],
    );
  }
}
