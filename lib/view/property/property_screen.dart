import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/property.dart';
import '../../viewmodel/property_view_model.dart';


class PropertyScreen extends StatefulWidget {
  final Property property;
  PropertyScreen({this.property});
  @override
  _PropertyScreenState createState() => _PropertyScreenState();
}


class _PropertyScreenState extends State<PropertyScreen> {
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // If false in Array, then Initialize isBookedDone.
    if (widget.property.isReserved == false) {
      if (_isInit) {
        Provider.of<PropertyViewModel>(context, listen: false).initializeIsBookedDone();
      }
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _propertyViewModel = Provider.of<PropertyViewModel>(context);
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
                icon: Icon(Icons.arrow_back_ios, size: 20),
                color: Colors.grey,
                onPressed: () => Navigator.of(context).pop(),
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
              child: _propertyViewModel.markedPropertyBools[(widget.property.id - 1)] == false
                  ? IconButton(
                    icon: Icon(Icons.bookmark_border),
                    iconSize: 20,
                    color: Colors.grey,
                    onPressed: () => _markIt(context),
                  )
                  : IconButton(
                    icon: Icon(Icons.bookmark),
                    iconSize: 20,
                    color: Colors.orange,
                    onPressed: () => _unmarkIt(context),
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
                      widget.property.propertyDetails.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 8, bottom: 2),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.property.propertyDetails.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.property.city,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.yellow),
                          Text(
                            widget.property.rating.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '(' + '${widget.property.id*127}' + ' Reviews)',
                            style: TextStyle(color: Colors.grey),
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
                            widget.property.propertyDetails.bedCount.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: <Widget>[
                          Icon(Icons.bathtub_outlined, color: Colors.grey),
                          Text(
                            widget.property.propertyDetails.bathroomCount.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: <Widget>[
                          Icon(Icons.local_laundry_service_outlined, color: Colors.grey),
                          Text(
                            widget.property.propertyDetails.laundryCount.toString(),
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
                          text: widget.property.rentalPrice,
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
                    widget.property.propertyDetails.description,
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
                    widget.property.ownerName,
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
                          icon: Icon(Icons.chat, size: 20),
                          color: Colors.grey,
                          onPressed: () {
                            print('comm: Chat with : ' + '${widget.property.ownerName}');
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
                          icon: Icon(Icons.call, size: 20),
                          color: Colors.white,
                          onPressed: () {
                            print('comm: Call to : ' + '${widget.property.ownerPhoneNumber}');
                          },
                        ),
                      ),
                    ],
                  ),
                  onTap: () => print('comm: Owner\'s infomation'),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    child: widget.property.isReserved == false  // VM共通ゆえ個別にvaluableを持たせる
                        ? FlatButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('Book Now',style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            widget.property.isReserved = true;
                            return _propertyViewModel.getFutureValue();
                          },
                        )
                        :  _propertyViewModel.isBookedDone == false
                            ? Container(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(
                                valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                              ),
                            )
                            : FlatButton(
                              color: Colors.blue[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text('Booked',style: TextStyle(color: Colors.white)),
                              onPressed: () => null,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
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



  Future<void> _markIt(BuildContext context) async {
    final _propertyViewModel = Provider.of<PropertyViewModel>(context, listen: false);
    await _propertyViewModel.markIt(widget.property);
  }

  Future<void> _unmarkIt(BuildContext context) async {
    final _propertyViewModel = Provider.of<PropertyViewModel>(context, listen: false);
    await _propertyViewModel.unmarkIt(widget.property);
  }
}
