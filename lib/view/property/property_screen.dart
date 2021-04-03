import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservecom/data/property.dart';
import 'package:reservecom/viewmodel/property_view_model.dart';

class PropertyScreen extends StatelessWidget {
  final Property property;
  PropertyScreen({@required this.property});
  /// propertyが渡せていないからエラー

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                color: Colors.grey,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
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
                  Icons.bookmark,
                  size: 20,
                ),
                color: Colors.grey,
                onPressed: () {
                  print('comm: Pushed btn: Favorite one');
                },
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0,
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.network(
                      property.propertyDetails.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 8, bottom: 2),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    property.propertyDetails.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        property.city,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.yellow),
                              Text(
                                property.rating.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '(' + '${property.id*127}' + ' Reviews)',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.king_bed_outlined, color: Colors.grey),
                          Text(
                            property.propertyDetails.bedCount.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: <Widget>[
                          Icon(Icons.bathtub_outlined, color: Colors.grey),
                          Text(
                            property.propertyDetails.bathroomCount.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: <Widget>[
                          Icon(Icons.local_laundry_service_outlined, color: Colors.grey),
                          Text(
                            property.propertyDetails.laundryCount.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                          text: property.rentalPrice,
                          style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' /mo',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 4),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Description :',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      property.propertyDetails.description,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),

                ListTile(
                  leading: Container(
                    margin: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/stevewozniak.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    'Owner',
                    style: TextStyle(color: Colors.grey),
                  ),
                  subtitle: Text(
                    property.ownerName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 8, right: 4, bottom: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.chat,
                            size: 20,
                          ),
                          color: Colors.grey,
                          onPressed: () {
                            print('comm: Chat with : ' + '${property.ownerName}');
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.green,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.call,
                            size: 20,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            print('comm: Call to : ' + '${property.ownerPhoneNumber}');
                          },
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    print('comm: Owner\'s infomation');
                  },
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    child: FutureBuilder(  
                      future: Provider.of<PropertyViewModel>(context, listen: false).getFutureValue(),
                      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                        return FlatButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: snapshot.connectionState != ConnectionState.done
                              ? Container(
                                width: 40,
                                height: 40,
                                child: CircularProgressIndicator(
                                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                                ),
                              )
                              : snapshot.hasError
                                  ? Text(
                                    snapshot.error.toString(),
                                    style: TextStyle(color: Colors.white),
                                  )
                                  : snapshot.hasData
                                    ? Text(
                                      snapshot.data,
                                      style: TextStyle(color: Colors.white),
                                    )
                                    : Text(
                                      'Failed to book',
                                      style: TextStyle(color: Colors.white),
                                    ),
                          // Text(
                          //   'Book Now',
                            // style: TextStyle(color: Colors.white),     
                          // ),
                          onPressed: () {},
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}