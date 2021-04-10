import 'package:flutter/material.dart';


class RatingChip extends StatefulWidget {
  final String raitingText;
  RatingChip({@required this.raitingText});
  @override
  _RatingChipState createState() => _RatingChipState();
}



class _RatingChipState extends State<RatingChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[300],
          ),
          child: Row(
            children: <Widget>[
              const Icon(Icons.star, color: Colors.yellow, size: 16),
              SizedBox(width: 4),
              Text(
                widget.raitingText,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        );
  }
}