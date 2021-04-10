import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservecom/data/property.dart';
import 'package:reservecom/viewmodel/search_view_model.dart';



class SearchPropertyDelegate extends SearchDelegate<Property> {
  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   final _theme = Theme.of(context);
  //   return _theme.copyWith(
  //     brightness: Brightness.dark,
  //   );
  // }


  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        print('comm: buildLeading: No searched result');
        // onPressed -> close、パスするもの(return先)なしnull
        close(context, null);
      },
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResult(context);
  }
  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResult(context);
  }


  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
        print('comm: buildActions: Clear text');
        query = '';
        },
      ),
    ];
  }


  /// Widget [_buildSearchResult] : Build Search Result View for buildSuggestions() and buildResults().
  Widget _buildSearchResult(BuildContext context) {
    final _searchViewModel = Provider.of<SearchViewModel>(context, listen: false);
    _searchViewModel.searchProperty(query);

    return GridView.count(
      crossAxisCount: 1,
      children: List.generate(
        _searchViewModel.searchedProperties.length,
        (position) {
          final _oneSearchedProperty = _searchViewModel.searchedProperties[position];

          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: InkWell(
                // onTap -> closeしてclick対象をパス
                onTap: () => close(context, _oneSearchedProperty),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: _searchViewModel.searchedProperties[position].propertyDetails.image == null
                            ? const Icon(Icons.no_photography)
                            : CachedNetworkImage(
                              imageUrl: _searchViewModel.searchedProperties[position].propertyDetails.image,
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.tv_off),
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(bottom: 12),
                          child: _searchViewModel.searchedProperties[position].propertyDetails.title == null
                              || _searchViewModel.searchedProperties[position].propertyDetails.description == null
                              ? Column(
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  const Icon(Icons.browser_not_supported),
                                ]
                              )
                              : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: Text(
                                      _searchViewModel.searchedProperties[position].propertyDetails.title,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    _searchViewModel.searchedProperties[position].propertyDetails.description,
                                    style: TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
