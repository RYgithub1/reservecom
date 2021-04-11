import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/rate.dart';
import '../../../viewmodel/property_view_model.dart';
import 'rating_custom_radio.dart';


class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}



class _RatingState extends State<Rating> {
  List<Rate> rates = List<Rate>();

  @override
  void initState() {
    super.initState();
    rates.add(Rate('1', false));
    rates.add(Rate('2', false));
    rates.add(Rate('3', false));
    rates.add(Rate('4', false));
    rates.add(Rate('5', false));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 400,
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: rates.length,
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                rates.forEach((ra) => ra.isSelected = false);
                rates[index].isSelected = true;
              });
              getRating(index);
            },
            child: RatingCustomRadio(rates[index]),
          );
        },
      ),
    );
  }


  Future<void> getRating(int index) async {
    final _propertyViewModel = Provider.of<PropertyViewModel>(context, listen: false);
    _propertyViewModel.getRating((index + 1));
  }
}
