import 'package:flutter/material.dart';

class SortByConstraint extends StatefulWidget {
  // SortByConstraint({Key key}) : super(key: key);
  @override
  _SortByConstraintState createState() => _SortByConstraintState();
}


class _SortByConstraintState extends State<SortByConstraint> {
  String _defaultValue = 'Lowest rent';
  List<String> _sortList = <String>['Lowest rent', 'Rating', 'Review'];
  String _sortText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              '$_sortText',
              style: TextStyle(fontSize: 16),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _defaultValue,
              items: _sortList.map<DropdownMenuItem<String>>((String dropDownStringItemValue) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItemValue,
                  child: Text(dropDownStringItemValue),
                );
              }).toList(),
              onChanged: _onDropDownItemSelected,
            ),
          ),
        ],
      )
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      _sortText = newValueSelected;
      // this._defaultValue = newValueSelected;
      _defaultValue = newValueSelected;
    });
  }
}