import 'package:flutter/material.dart';

import 'price_range_graph.dart';
import 'sort_by_constraint.dart';

class SearchBottomSheet extends StatefulWidget {
  // SearchBottomSheet({Key key}) : super(key: key);
  @override
  _SearchBottomSheetState createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: <Widget>[
          SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Sort by',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SortByConstraint(),
            ],
          ),

          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Price range',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              PriceRangeGraph(),
            ],
          ),

          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Rating',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '1',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '2',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '3',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '4',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '5',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Facility',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 6,
                children: <Widget>[
                  Chip(
                    label: Text('Dining room'),
                    autofocus: true,
                    avatar: CircleAvatar(
                      child: Icon(Icons.restaurant),
                      backgroundColor: Colors.grey[100],
                    ),
                  ),
                  Chip(
                    label: Text('Bathroom'),
                    autofocus: true,
                    avatar: CircleAvatar(
                      child: Icon(Icons.bathtub_outlined),
                      backgroundColor: Colors.grey[100],
                    ),
                  ),
                  Chip(
                    label: Text('TV room'),
                    autofocus: true,
                    avatar: CircleAvatar(
                      child: Icon(Icons.tv),
                      backgroundColor: Colors.grey[100],
                    ),
                  ),
                  Chip(
                    label: Text('Bedroom'),
                    autofocus: true,
                    avatar: CircleAvatar(
                      child: Icon(Icons.king_bed_outlined),
                      backgroundColor: Colors.grey[100],
                    ),
                  ),
                  Chip(
                    label: Text('Kitchen'),
                    autofocus: true,
                    avatar: CircleAvatar(
                      child: Icon(Icons.kitchen),
                      backgroundColor: Colors.grey[100],
                    ),
                  ),
                  Chip(
                    label: Text('Drawing room'),
                    autofocus: true,
                    avatar: CircleAvatar(
                      child: Icon(Icons.person_pin_outlined),
                      backgroundColor: Colors.grey[100],
                    ),
                  ),
                  Chip(
                    label: Text('Toilet'),
                    autofocus: true,
                    avatar: CircleAvatar(
                      child: Icon(Icons.person_outline),
                      backgroundColor: Colors.grey[100],
                    ),
                  ),
                  Chip(
                    label: Text('Basin'),
                    autofocus: true,
                    avatar: CircleAvatar(
                      child: Icon(Icons.wash_outlined),
                      backgroundColor: Colors.grey[100],
                    ),
                  ),
                  Chip(
                    label: Text('Gym'),
                    autofocus: true,
                    avatar: CircleAvatar(
                      child: Icon(Icons.sports_handball),
                      backgroundColor: Colors.grey[100],
                    ),
                  ),
                  Chip(
                    label: Text('Spa'),
                    autofocus: true,
                    avatar: CircleAvatar(
                      child: Icon(Icons.spa_outlined),
                      backgroundColor: Colors.grey[100],
                    ),
                  ),
                  Chip(
                    label: Text('Parking'),
                    autofocus: true,
                    avatar: CircleAvatar(
                      child: Icon(Icons.local_parking),
                      backgroundColor: Colors.grey[100],
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  'Apply & Search',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {  
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
