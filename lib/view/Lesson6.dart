import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 6 demo'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 150,
              ),
              Flexible(
                flex: 1,
                //fit: FlexFit.tight, // thu bo comment cho nay
                child: Container(
                  color: Colors.amber,
                  width: 100,
                  height: 150,
                ),
              ),
              Container(
                color: Colors.blue,
                height: 120,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.red,
                  width: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
