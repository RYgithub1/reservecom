import 'package:flutter/material.dart';

import 'rating_chip.dart';


class Rating extends StatefulWidget {
  Rating({Key key}) : super(key: key);
  @override
  _RatingState createState() => _RatingState();
}


class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RatingChip(raitingText: '1'),
        RatingChip(raitingText: '2'),
        RatingChip(raitingText: '3'),
        RatingChip(raitingText: '4'),
        RatingChip(raitingText: '5'),
      ],
    );
  }
}
