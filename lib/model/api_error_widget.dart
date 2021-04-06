import 'package:flutter/material.dart';

/// Widget [ApiErrorWidget] :
/// Used when the data load fails to show and Try again button and image
class ApiErrorWidget extends StatelessWidget {
  final Function tryAgain;

  const ApiErrorWidget({Key key, @required this.tryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/stevejobs.jpeg', height: 240),
          SizedBox(height: 20),
          Text('something wrong', textAlign: TextAlign.center),
          RaisedButton(
            onPressed: tryAgain,
            // onPressed: () => tryAgain,
            child: Text('TRY AGAIN', textAlign: TextAlign.center),
            textColor: Colors.white,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
