import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodel/property_view_model.dart';


class PriceRange extends StatefulWidget {
  @override
  _PriceRangeState createState() => _PriceRangeState();
}



class _PriceRangeState extends State<PriceRange> {
  var _startRange = '';
  var _endRange = '';
  var _rangeValues = RangeValues(100.0, 7100.0);

  void _updateLabels(RangeValues values) {
    _startRange = '${_rangeValues.start.round()}';
    _endRange = '${_rangeValues.end.round()}';
  }

  @override
  void initState() {
    super.initState();
    _updateLabels(_rangeValues);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: 52,
              width: double.infinity,
              color: Colors.grey[100],
              child: Center(child: Text('')),
            ),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: Colors.blue,
                showValueIndicator: ShowValueIndicator.onlyForContinuous,
                trackHeight: 1,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
              ),
              child: RangeSlider(
                labels: RangeLabels(_startRange, _endRange),
                values: _rangeValues,
                min: 100,
                max: 7100,
                divisions: 70,
                onChanged: (values) {
                  _rangeValues = values;
                  setState(() => _updateLabels(values));
                  getPriceRange(values);
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '\$$_startRange - \$$_endRange',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  children: <TextSpan>[
                    TextSpan(text: 'Average prices : '),
                    TextSpan(
                      text: '\$1,150',
                      style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }


  Future<void> getPriceRange(RangeValues _priceRangeValues) async {
    final _propertyViewModel = Provider.of<PropertyViewModel>(context, listen: false);
    _propertyViewModel.getPriceRange(_priceRangeValues);
  }
}
