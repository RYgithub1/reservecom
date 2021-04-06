import 'package:flutter/material.dart';

@override
class AccommodationType extends StatelessWidget {
  final String accommodationTypeText;
  final ImageIcon accommodationTypeIcon;
  AccommodationType({
    @required this.accommodationTypeText,
    @required this.accommodationTypeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: Column(
        children: <Widget>[
          accommodationTypeIcon,
          SizedBox(height: 4),
          Text(
            accommodationTypeText,
            style: TextStyle(fontSize: 12, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
