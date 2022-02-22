import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(builder: (BuildContext context) {
          return FlatButton(
            child: Text('show snackbar'),
            color: Colors.pink,
            onPressed: () {
              // xử lý show snackbar khi click
              final snackBar = SnackBar(content: Text('Nội dung text gì đó'));
              Scaffold.of(context).showSnackBar(snackBar);
            },
          );
        },),
      ),
    );
  }
}