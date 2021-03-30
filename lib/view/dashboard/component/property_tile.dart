import 'package:flutter/material.dart';

import '../../property/property_screen.dart';


class PropertyTile extends StatelessWidget {
  // final Article article;
  final ValueChanged onArticleClick;
  /// [Click処理も渡す]
  // const PropertyTile({this.article, this.onArticleClick});
  const PropertyTile({this.onArticleClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        // onTap: () => onArticleClick(article),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => PropertyScreen(),
          ));
        },
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              // child: ArticleTileImage(networkImageUrl: article.networkImage),
              child: PropertyTileLeft(),
              // child: Container(),
            ),
            Expanded(
              flex: 2,
              // child: ArticleTileExplanation(article: article),
              child: PropertyTileRight(),
            ),
          ],
        ),
      ),
    );
  }
}



class PropertyTileLeft extends StatelessWidget {
  // final String networkImageUrl;
  // const PropertyTileLeft({this.networkImageUrl});
  @override
  Widget build(BuildContext context) {
    // /// [urlImageを取得できていない場合のif]
    // final invalidNetworkImageUrl = networkImageUrl.startsWith("http");
    // if(networkImageUrl == null || networkImageUrl == "" || !invalidNetworkImageUrl){
    //   return const Icon(Icons.broken_image);
    // } else {
    //   return CachedNetworkImage(    /// [CachedNetworkImage: cacheする]
    //     imageUrl: networkImageUrl,
    //     placeholder: (context, url) => CircularProgressIndicator(),
    //     errorWidget: (context, url, error) => Icon(Icons.error),
    //   );
    // }
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        Container(
          child: Image.asset(
            'assets/images/stevejobs.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0.3),
          ),
          child: Icon(
            Icons.bookmark,
            size: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}



class PropertyTileRight extends StatelessWidget {
  // final Article article;
  // const PropertyTileRight({this.article});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // DateTime _datetime = DateTime.parse(article.publishedDate);   /// [String -> Date]
    // var _dateFormat = new DateFormat('yyyy/MM/dd(E) HH:mm');
    // String _formattedDate = _dateFormat.format(_datetime);  /// [Date -> String]

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          // article.publishedDate,
          // _formattedDate,
          'Duplex Apartment',
          style: textTheme.subtitle1.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          // article.title,
          // style: textTheme.bodyText1.copyWith(
          //   fontFamily: RegularFont,
          // ),
          'Stockton New Hampshire',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 4),
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
        SizedBox(height: 4),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Icon(Icons.king_bed_outlined, color: Colors.grey),
                  Text(
                    '5',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Icon(Icons.bathtub_outlined, color: Colors.grey),
                  Text(
                    '2',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Icon(Icons.local_laundry_service_outlined, color: Colors.grey),
                  Text(
                    '1',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.grey, fontSize: 20),
            children: <TextSpan>[
              TextSpan(
                text: '\$1,495',
                style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ' /mo',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        )
      ],
    );
  }
}