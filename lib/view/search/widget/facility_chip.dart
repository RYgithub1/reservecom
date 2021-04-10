import 'package:flutter/material.dart';


class FacilityChip extends StatefulWidget {
  final Icon facilityIcon;
  final String facilityText;
  FacilityChip({
    @required this.facilityIcon,
    @required this.facilityText,
  });
  @override
  _FacilityChipState createState() => _FacilityChipState();
}



class _FacilityChipState extends State<FacilityChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[300],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              widget.facilityIcon,
              SizedBox(width: 4),
              Text(
                widget.facilityText,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        );
  }
}