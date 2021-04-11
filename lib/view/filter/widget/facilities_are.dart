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
      height: 40,
      child: ListView.builder(      /// [later: オブジェクトの折返し]
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: facil.length,
        itemBuilder: (context, index) {
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
        },
      ),
    );
  }


  Future<void> getFacilitiesAre(Facility _facil, int _facilIndex) async {
    final _propertyViewModel = Provider.of<PropertyViewModel>(context, listen: false);
    _propertyViewModel.getFacilitiesAre(_facil, _facilIndex);
  }
}

//     return Wrap(
//       spacing: 6,
//       children: <Widget>[
//         FacilityChip(
//           facilityIconData: Icons.restaurant,
//           facilityText: 'Dining room',
//           facilityClicked: false,
//         ),
//         FacilityChip(
//           facilityIconData: Icons.bathtub_outlined,
//           facilityText: 'Bathroom',
//           facilityClicked: false,
//         ),
//         FacilityChip(
//           facilityIconData: Icons.tv,
//           facilityText: 'TV room',
//           facilityClicked: true,
//         ),
//         FacilityChip(
//           facilityIconData: Icons.king_bed_outlined,
//           facilityText: 'Bedroom',
//           facilityClicked: true,
//         ),
//         FacilityChip(
//           facilityIconData: Icons.kitchen,
//           facilityText: 'Kitchen',
//           facilityClicked: false,
//         ),
//         FacilityChip(
//           facilityIconData: Icons.person_pin_outlined,
//           facilityText: 'Drawing room',
//           facilityClicked: true,
//         ),
//         FacilityChip(
//           facilityIconData: Icons.person_outline,
//           facilityText: 'Toilet',
//           facilityClicked: false,
//         ),
//         FacilityChip(
//           facilityIconData: Icons.wash_outlined,
//           facilityText: 'Basin',
//           facilityClicked: false,
//         ),
//         FacilityChip(
//           facilityIconData: Icons.sports_handball,
//           facilityText: 'Gym',
//           facilityClicked: false,
//         ),
//         FacilityChip(
//           facilityIconData: Icons.spa_outlined,
//           facilityText: 'Spa',
//           facilityClicked: false,
//         ),
//         FacilityChip(
//           facilityIconData: Icons.local_parking,
//           facilityText: 'Parking',
//           facilityClicked: false,
//         ),
//       ],
//     );
//   }
// }
