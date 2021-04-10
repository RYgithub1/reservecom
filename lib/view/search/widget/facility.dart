import 'package:flutter/material.dart';

import 'facility_chip.dart';


class Facility extends StatefulWidget {
  Facility({Key key}) : super(key: key);

  @override
  _FacilityState createState() => _FacilityState();
}


class _FacilityState extends State<Facility> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      children: <Widget>[
        FacilityChip(
          facilityIconData: Icons.restaurant,
          facilityText: 'Dining room',
          facilityClicked: false,
        ),
        FacilityChip(
          facilityIconData: Icons.bathtub_outlined,
          facilityText: 'Bathroom',
          facilityClicked: false,
        ),
        FacilityChip(
          facilityIconData: Icons.tv,
          facilityText: 'TV room',
          facilityClicked: true,
        ),
        FacilityChip(
          facilityIconData: Icons.king_bed_outlined,
          facilityText: 'Bedroom',
          facilityClicked: true,
        ),
        FacilityChip(
          facilityIconData: Icons.kitchen,
          facilityText: 'Kitchen',
          facilityClicked: false,
        ),
        FacilityChip(
          facilityIconData: Icons.person_pin_outlined,
          facilityText: 'Drawing room',
          facilityClicked: true,
        ),
        FacilityChip(
          facilityIconData: Icons.person_outline,
          facilityText: 'Toilet',
          facilityClicked: false,
        ),
        FacilityChip(
          facilityIconData: Icons.wash_outlined,
          facilityText: 'Basin',
          facilityClicked: false,
        ),
        FacilityChip(
          facilityIconData: Icons.sports_handball,
          facilityText: 'Gym',
          facilityClicked: false,
        ),
        FacilityChip(
          facilityIconData: Icons.spa_outlined,
          facilityText: 'Spa',
          facilityClicked: false,
        ),
        FacilityChip(
          facilityIconData: Icons.local_parking,
          facilityText: 'Parking',
          facilityClicked: false,
        ),
      ],
    );
  }
}
