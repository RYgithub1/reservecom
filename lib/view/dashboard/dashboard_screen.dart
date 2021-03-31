import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'component/accommodation_type.dart';
import 'component/property_tile.dart';
import 'component/search_bottom_sheet.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool propertyList = true;


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

      body: Column(
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
            : ListView.builder(
              itemCount: 8,
              itemBuilder: (BuildContext context, int arrayNumber) {
                return PropertyTile(
                  // article: viewModel.articles[arrayNumber],
                  // onArticleClick: (article) => _openArticleWebPage(article, context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
