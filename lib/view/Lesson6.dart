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
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.deepOrangeAccent,
                      height: 100,
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    height: 100,
                    width: 50,
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Container(
                      color: Colors.deepOrangeAccent,
                      height: 100,
                      width: 10,
                    ),
                  ),
                ],
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight, // thu bo comment cho nay
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
              SizedBox(
                height: 10,
              ),
              Stack(
                //alignment: Alignment.bottomCenter,
                //overflow: Overflow.visible, // thu bo comment cho nay
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.brown,
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    color: Colors.green,
                  ),
                  Positioned(
                      bottom: 0,
                      left: 35,
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.blueGrey,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
