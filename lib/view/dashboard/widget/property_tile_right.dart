
import 'package:flutter/material.dart';

import '../../../data/property.dart';

/// Widget [PropertyTileRight] : The PropertyTileRight is used for Property Tile
class PropertyTileRight extends StatelessWidget {
  final Property property;
  PropertyTileRight({@required this.property});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 8, right: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            property.propertyDetails.title,
            style: textTheme.subtitle1.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            property.city,
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
                      property.rating.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '(' + '${property.id*127}' + ' Reviews)',
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
                      property.propertyDetails.bedCount.toString(),
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
                      property.propertyDetails.bathroomCount.toString(),
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
                      property.propertyDetails.laundryCount.toString(),
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
                  text: property.rentalPrice,
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
      ),
    );
  }
}
