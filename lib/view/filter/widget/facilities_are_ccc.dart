import 'package:flutter/material.dart';


class FacilitiesAreCcc extends StatefulWidget {
  final IconData facilityIconData;
  final String facilityText;
  final bool facilityClicked;
  FacilitiesAreCcc({
    @required this.facilityIconData,
    @required this.facilityText,
    @required this.facilityClicked,
  });
  @override
  _FacilitiesAreCccState createState() => _FacilitiesAreCccState();
}


class _FacilitiesAreCccState extends State<FacilitiesAreCcc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: widget.facilityClicked == false
            ? Colors.grey[200]
            : Colors.blue,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            widget.facilityIconData,
            size: 16,
            color: widget.facilityClicked == false
                ? Colors.black
                : Colors.white,
          ),
          const SizedBox(width: 4),
          Text(
            widget.facilityText,
            style: widget.facilityClicked == false
                ? TextStyle(fontSize: 12, color: Colors.black)
                : TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
