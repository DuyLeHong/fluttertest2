import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('Next page 20221'),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(18.0),
            color: Colors.greenAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'This is the next page',
                  style: TextStyle(fontSize: 50),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    Icon(
                      Icons.audiotrack,
                      color: Colors.green,
                      size: 30.0,
                    ),
                    Icon(
                      Icons.beach_access,
                      color: Colors.blue,
                      size: 36.0,
                    ),
                  ],
                ),
                Image.network('https://codefresher.vn/wp-content/uploads/2022/01/banner_2022_flutter-1024x1024.jpg'),
              ],
            ),
          ),
        ));
  }
}
