import 'package:flutter/material.dart';

import '../dashboard/dashboard_screen.dart';
import 'widget/facilities_are.dart';
import 'widget/price_range.dart';
import 'widget/rating.dart';
import 'widget/sort_by.dart';


class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}


class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),

          /// [--- SortBy() ---]
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text('Sort by', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SortBy(),
            ],
          ),
          const SizedBox(height: 12),

          /// [--- PriceRange() ---]
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text('Price range', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              PriceRange(),
            ],
          ),
          const SizedBox(height: 12),

          /// [--- Rating() ---]
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text('Rating', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Rating(),
            ],
          ),
          const SizedBox(height: 12),

          /// [--- Facility() ---]
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Facility', style: TextStyle(fontWeight: FontWeight.bold)),
              FacilitiesAre(),
            ],
          ),
          const SizedBox(height: 4),

          /// [--- FlatButton() ---]
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              child: FlatButton(
                child: Text('Apply & Search', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => DashboardScreen(),
                  ));
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
