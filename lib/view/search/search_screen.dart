import 'package:flutter/material.dart';

import 'widget/search_property_delegate.dart';



class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.search),
        title: InkWell(
          splashColor: Colors.blueAccent,
          onTap: () => _searchProperty(context),
          child: Text('search here', style: TextStyle(color: Colors.grey)),
        ),
      ),
      body: Container(),
    );
  }


  _searchProperty(BuildContext context) async {
    final selectedProperty = await showSearch(
      context: context,
      delegate: SearchPropertyDelegate(),
    );



    
  }
}
