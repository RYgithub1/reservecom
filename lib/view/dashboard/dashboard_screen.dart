import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/property_view_model.dart';
import '../property/property_screen.dart';
import '../search/search_bottom_sheet.dart';
import '../search/widget/search_property_delegate.dart';
import 'widget/accommodation_type.dart';
import 'widget/property_tile.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}



class _DashboardScreenState extends State<DashboardScreen> {
  Future _getPropertyInfo;
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    /// Initialize future so that it wont load again
    if (_isInit) {
      _getPropertyInfo =
          Provider.of<PropertyViewModel>(context, listen: false).getPropertyInfo();
    }
    _isInit = false;
  }
  ///FUNC [_reloadData] : Reload data on failing
  void _reloadData() {
    setState(() {
      _getPropertyInfo =
          Provider.of<PropertyViewModel>(context, listen: false).getPropertyInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _judgePVM = Provider.of<PropertyViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          child: FittedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(52),
              child: Image.asset(
                'assets/images/stevejobs.jpeg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hi,',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              'Steve Jobs',
              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/bell.svg',
                width: 20.0,
                height: 20.0,
              ),
              color: Colors.blue,
              onPressed: () {
                print('comm: Pushed _removeMarkedProperty()');
                return _removeMarkedProperty(context);
              },
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
      ),


      body: FutureBuilder(
        future: _getPropertyInfo,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
            // ? Center(child: CircularProgressIndicator())
            // : snapshot.error != null
                // ? Center(child: ApiErrorWidget(tryAgain: _reloadData))
                ? Center(child: CircularProgressIndicator())
                : Column(
                  children: <Widget>[

                    /// [Theme Text ==========================]
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Find',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black, fontSize: 36),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'best place ',
                                  style: TextStyle(fontSize: 20, color: Colors.grey),
                                ),
                                TextSpan(
                                  text: 'nearby ',
                                  style: TextStyle(fontSize: 20, color: Colors.blue,fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: '\u{1F44C}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    /// [Search Item ==========================]
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Container(
                            margin: const EdgeInsets.only(top: 4, right: 4, bottom: 4, left: 12),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.search,
                                  color: Colors.blue,
                                ),
                                InkWell(
                                  splashColor: Colors.blueAccent,
                                  onTap: () {
                                    print('comm: SearchScreen');
                                    return _searchProperty(context);
                                  },
                                  child: Text(
                                    'Why don\'t you search a property?',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 42,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.import_export,
                                size: 20,
                              ),
                              color: Colors.blue,
                              onPressed: () {
                                print('comm: SearchBottomSheet');
                                showBarModalBottomSheet(
                                  backgroundColor: Colors.red,
                                  expand: true,
                                  context: context,
                                  builder: (context) => SingleChildScrollView(
                                    controller: ModalScrollController.of(context),
                                    child: SearchBottomSheet()
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// [Accommodation Type ==========================]
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          AccommodationType(
                            accommodationTypeText: '  Building  ',
                            accommodationTypeIcon: ImageIcon(
                              AssetImage('assets/icons/building.png'),
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width:5.0),
                          AccommodationType(
                            accommodationTypeText: '    Room    ',
                            accommodationTypeIcon: ImageIcon(
                              AssetImage('assets/icons/room.png'),
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width:5.0),
                          AccommodationType(
                            accommodationTypeText: '   House   ',
                            accommodationTypeIcon: ImageIcon(
                              AssetImage('assets/icons/home.png'),
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width:5.0),
                          AccommodationType(
                            accommodationTypeText: 'Apartment',
                            accommodationTypeIcon: ImageIcon(
                              AssetImage('assets/icons/apartment.png'),
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width:5.0),
                          AccommodationType(
                            accommodationTypeText: '   Garden   ',
                            accommodationTypeIcon: ImageIcon(
                              AssetImage('assets/icons/park.png'),
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width:5.0),
                          AccommodationType(
                            accommodationTypeText: '  Parking  ',
                            accommodationTypeIcon: ImageIcon(
                              AssetImage('assets/icons/parking.png'),
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// [Property Tile ==========================]
                    Expanded(
                      child: _judgePVM.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Consumer<PropertyViewModel>(
                          builder: (context, propertyViewModel, child) {
                            return ListView.builder(
                              itemCount: propertyViewModel.properties.length,
                              itemBuilder: (BuildContext context, int _arrayNumber) {
                                if (propertyViewModel.properties[_arrayNumber].isReserved == null) {
                                  propertyViewModel.properties[_arrayNumber].isReserved = false;
                                }
                                return PropertyTile(
                                  property: propertyViewModel.properties[_arrayNumber],
                                );
                              },
                            );
                          }
                        ),
                    ),
                  ],
          );
        }
      ),
    );
  }



  Future<void> _removeMarkedProperty(BuildContext context) async {
    final _propertyViewModel = Provider.of<PropertyViewModel>(context, listen: false);
    await _propertyViewModel.removeMarkedProperty();
  }


  Future<void> _searchProperty(BuildContext context) async {
    final _propertyViewModel = Provider.of<PropertyViewModel>(context, listen: false);
    // 検索 -> Click対象Propertyを_selectedPropertyへ格納
    final _selectedProperty = await showSearch(
      context: context,
      delegate: SearchPropertyDelegate(),
    );
    // Property検索結果を処理
    if (_selectedProperty != null) {
      final int _selectedPropertyId = _selectedProperty.id;
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => PropertyScreen(
          property: _propertyViewModel.properties[(_selectedPropertyId - 1)],
        ),
      ));
    }
  }
}
