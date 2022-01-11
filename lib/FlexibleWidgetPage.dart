

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexibleWidgetPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible Widget Page'),
      ),
      body: Column(
        children: <Widget>[
          Spacer(flex: 1),
          Expanded(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.indigo,
              ),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Spacer(flex: 1),
                    Flexible(
                      child: Container(color: Colors.amber),
                    ),

                    Flexible(
                      child: Container(
                        color: Colors.blueAccent,
                        margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      ),
                    ),
                    Spacer(flex: 1),
                    Flexible(
                      child: Container(color: Colors.pinkAccent),
                    )
                  ]),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.cyanAccent,
              ),
            ),
          ),
          Spacer(flex: 1),
        ],

      ),
    );
  }
}


