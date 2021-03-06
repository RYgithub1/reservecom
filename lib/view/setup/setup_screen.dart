import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/multi_theme_view_model.dart';



class SetupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _multiThemeViewModel = Provider.of<MultiThemeViewModel>(context, listen: false);
    final _isMultiTheme = _multiThemeViewModel.isMultiTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Setup'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(child: Text('coming soon')),
          RaisedButton(
            child: _isMultiTheme
                ? const Text('Go Light Side')
                : const Text('Go Dark Side'),
            color: Colors.blue,
            textColor: Colors.black,
            onPressed: () => _changeMultiTheme(context, _isMultiTheme),  // 背反
          ),
        ],
      ),
    );
  }


  _changeMultiTheme(BuildContext context, bool isMultiTheme) {
    final _multiThemeViewModel = Provider.of<MultiThemeViewModel>(context, listen: false);
    _multiThemeViewModel.changeMultiTheme(!isMultiTheme);
  }
}
