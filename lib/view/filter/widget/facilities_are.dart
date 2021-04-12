import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/facility.dart';
import '../../../viewmodel/property_view_model.dart';
import 'facilities_are_chips.dart';


class FacilitiesAre extends StatefulWidget {
  @override
  _FacilitiesAreState createState() => _FacilitiesAreState();
}


class _FacilitiesAreState extends State<FacilitiesAre> {
  List<Facility> facil = List<Facility>();

  @override
  void initState() {
    super.initState();
    facil.add(Facility('Dining room', Icons.restaurant, false));
    facil.add(Facility('Bathroom', Icons.bathtub_outlined, false));
    facil.add(Facility('TV room', Icons.tv, false));
    facil.add(Facility('Bedroom', Icons.king_bed_outlined, false));
    facil.add(Facility('Kitchen', Icons.kitchen, false));
    facil.add(Facility('Drawing room', Icons.person_pin_outlined, false));
    facil.add(Facility('Toilet', Icons.person_outline, false));
    facil.add(Facility('Basin', Icons.wash_outlined, false));
    facil.add(Facility('Gym', Icons.sports_handball, false));
    facil.add(Facility('Spa', Icons.spa_outlined, false));
    facil.add(Facility('Parking', Icons.local_parking, false));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 400,
      height: 140,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // childAspectRatio: (100.0 / 40.0),    // GridView縦横比の変更
          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 5),
        ),
        itemCount: facil.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                if (facil[index].isSelected == false) {
                  facil[index].isSelected = true;
                } else {
                  facil[index].isSelected = false;
                }
              });
              getFacilitiesAre(facil[index], index);
            },
            child: FacilitiesAreChips(facil[index]),
          );
        }
      ),
    );
  }


  Future<void> getFacilitiesAre(Facility _facil, int _facilIndex) async {
    final _propertyViewModel = Provider.of<PropertyViewModel>(context, listen: false);
    _propertyViewModel.getFacilitiesAre(_facil, _facilIndex);
  }
}
