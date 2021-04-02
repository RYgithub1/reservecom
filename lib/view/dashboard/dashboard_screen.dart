import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:reservecom/model/api_error_widget.dart';

import '../../viewmodel/property_view_model.dart';
import 'widget/accommodation_type.dart';
import 'widget/property_tile.dart';
import 'widget/search_bottom_sheet.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}



class _DashboardScreenState extends State<DashboardScreen> {
  bool propertyList = true;  

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
              style:
                  TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
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
              icon: Icon(
                Icons.notifications_none,
                size: 20,
              ),
              color: Colors.blue,
              onPressed: () {
                print('comm: Notification');
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

                    /// [Theme Text]
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

                    /// [Search Item]
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
                                    print('comm: Search');
                                  },
                                  child: Text(
                                    'Search your ...',
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

                    /// [Accommodation Type]
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          AccommodationType(
                            accommodationTypeText: '  Building  ',
                            accommodationTypeIcon: Icon(Icons.fire_extinguisher, color: Colors.blue),
                          ),
                          SizedBox(width:5.0),
                          AccommodationType(
                            accommodationTypeText: '    Room    ',
                            accommodationTypeIcon: Icon(Icons.lightbulb, color: Colors.blue),
                          ),
                          SizedBox(width:5.0),
                          AccommodationType(
                            accommodationTypeText: '   House   ',
                            accommodationTypeIcon: Icon(Icons.house, color: Colors.blue),
                          ),
                          SizedBox(width:5.0),
                          AccommodationType(
                            accommodationTypeText: 'Apartment',
                            accommodationTypeIcon: Icon(Icons.apartment, color: Colors.blue),
                          ),
                          SizedBox(width:5.0),
                          AccommodationType(
                            accommodationTypeText: '   Garden   ',
                            accommodationTypeIcon: Icon(Icons.nature, color: Colors.blue),
                          ),
                          SizedBox(width:5.0),
                          AccommodationType(
                            accommodationTypeText: '  Parking  ',
                            accommodationTypeIcon: Icon(Icons.local_parking, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),

                    /// [Property Tile]
                    Expanded(
                      child: propertyList == false  
                        ? Center(child: CircularProgressIndicator())
                        : Consumer<PropertyViewModel>(
                          builder: (context, propertyViewModel, child) {
                            print('comm1: ${propertyViewModel.properties.length}');
                            // print('comm2: ${propertyViewModel.properties[0].city}');  
                            return ListView.builder(
                              itemCount: propertyViewModel.properties.length,  
                              // itemCount: 4,
                              itemBuilder: (BuildContext context, int arrayNumber) {
                                return PropertyTile();
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
}
