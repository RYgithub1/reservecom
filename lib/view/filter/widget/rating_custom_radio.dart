import 'package:flutter/material.dart';

import '../../../data/rate.dart';


class RatingCustomRadio extends StatelessWidget {
  final Rate _rate;
  RatingCustomRadio(this._rate);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: _rate.isSelected
          ? Colors.blue
          : Colors.grey[200],
      child: Container(
        width: 40,
        alignment: Alignment.center,
        margin: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow, size: 16),
            Text(
              _rate.ratingText,
              style: TextStyle(
                fontSize: 12,
                color: _rate.isSelected
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
