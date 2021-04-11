import 'package:flutter/material.dart';

import '../../../data/facility.dart';



class FacilitiesAreChips extends StatelessWidget {
  final Facility _fac;
  FacilitiesAreChips(this._fac);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: _fac.isSelected
          ? Colors.blue
          : Colors.grey[200],
      child: Container(
        width: 96,
        // height: 40,
        alignment: Alignment.center,
        margin: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              _fac.facilityIconData,
              color: _fac.isSelected
                  ? Colors.white
                  : Colors.black,
              size: 16,
            ),
            SizedBox(width: 4),
            Text(
              _fac.facilityText,
              style: TextStyle(
                fontSize: 12,
                color: _fac.isSelected
                    ? Colors.white
                    : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
