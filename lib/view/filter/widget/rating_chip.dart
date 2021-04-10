import 'package:flutter/material.dart';


class RatingChip extends StatefulWidget {
  final String ratingText;
  final bool ratingClicked;
  RatingChip({
    @required this.ratingText,
    @required this.ratingClicked,
  });
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
            color: widget.ratingClicked == false
                ? Colors.grey[300]
                : Colors.blue,
          ),
          child: Row(
            children: <Widget>[
              const Icon(Icons.star, color: Colors.yellow, size: 16),
              SizedBox(width: 4),
              Text(
                widget.ratingText,
                style: widget.ratingClicked == false
                    ? TextStyle(fontSize: 12, color: Colors.black)
                    : TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        );
  }
}