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
        FacilityChip(facilityIcon: Icon(Icons.restaurant, size: 16), facilityText: 'Dining room'),
        FacilityChip(facilityIcon: Icon(Icons.bathtub_outlined, size: 16), facilityText: 'Bathroom'),
        FacilityChip(facilityIcon: Icon(Icons.tv, size: 16), facilityText: 'TV room'),
        FacilityChip(facilityIcon: Icon(Icons.king_bed_outlined, size: 16), facilityText: 'Bedroom'),
        FacilityChip(facilityIcon: Icon(Icons.kitchen, size: 16), facilityText: 'Kitchen'),
        FacilityChip(facilityIcon: Icon(Icons.person_pin_outlined, size: 16), facilityText: 'Drawing room'),
        FacilityChip(facilityIcon: Icon(Icons.person_outline, size: 16), facilityText: 'Toilet'),
        FacilityChip(facilityIcon: Icon(Icons.wash_outlined, size: 16), facilityText: 'Basin'),
        FacilityChip(facilityIcon: Icon(Icons.sports_handball, size: 16), facilityText: 'Gym'),
        FacilityChip(facilityIcon: Icon(Icons.spa_outlined, size: 16), facilityText: 'Spa'),
        FacilityChip(facilityIcon: Icon(Icons.local_parking, size: 16), facilityText: 'Parking'),
      ],
    );
  }
}
