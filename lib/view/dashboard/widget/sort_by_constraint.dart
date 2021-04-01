import 'package:flutter/material.dart';

class SortByConstraint extends StatefulWidget {
  // SortByConstraint({Key key}) : super(key: key);
  @override
  _SortByConstraintState createState() => _SortByConstraintState();
}


class _SortByConstraintState extends State<SortByConstraint> {
  String _defaultValue = 'Lowest rent';
  List<String> _sortList = <String>['Lowest rent', 'Rating', 'Review'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _defaultValue,
                items: _sortList.map<DropdownMenuItem<String>>((String dropDownStringItemValue) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItemValue,
                    child: Text(dropDownStringItemValue),
                  );
                }).toList(),
                onChanged: _onDropDownItemSelected,
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                iconSize: 28,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ],
      )
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      _defaultValue = newValueSelected;
    });
  }
}