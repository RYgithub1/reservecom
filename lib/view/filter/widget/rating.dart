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
        RatingChip(ratingText: '1', ratingClicked: true),
        RatingChip(ratingText: '2', ratingClicked: false),
        RatingChip(ratingText: '3', ratingClicked: false),
        RatingChip(ratingText: '4', ratingClicked: true),
        RatingChip(ratingText: '5', ratingClicked: true),
      ],
    );
  }
}
