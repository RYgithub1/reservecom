import 'package:flutter/material.dart';

class PropertyScreen extends StatelessWidget {
  // const PropertyScreen({Key key}) : super(key: key);
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
                  print('comm: Bookmarked');
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
                      child: Image.asset(
                        'assets/images/stevejobs.jpeg',
                        fit: BoxFit.fill,
                      ),
                    ),
                ),
                  
                Container(
                  padding: EdgeInsets.only(top: 8, bottom: 2),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Duplex Apartment',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Stockton New Hampshire',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.yellow),
                              Text(
                                '4.8',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '(256 Reviews)',
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
                            '5',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: <Widget>[
                          Icon(Icons.bathtub_outlined, color: Colors.grey),
                          Text(
                            '2',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: <Widget>[
                          Icon(Icons.local_laundry_service_outlined, color: Colors.grey),
                          Text(
                            '1',
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
                          text: '\$1,495',
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
                    'jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs jobs ',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),

                ListTile(
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
                  title: Text(
                    'Owner',
                    style: TextStyle(color: Colors.grey),
                  ),
                  subtitle: Text(
                    'Owner s name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 8, right: 4, bottom: 8),
                        padding: const EdgeInsets.all(0),
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
                            print('comm: Chat with Owner');
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 8),
                        padding: const EdgeInsets.all(0),
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
                            print('comm: Call to Owner');
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
                    child: FlatButton(
                      child: Text(
                        'Book Now',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {

                      },
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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