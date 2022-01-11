import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible Widget Page 2'),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Image.network(
                        "https://images.pexels.com/photos/2253415/pexels-photo-2253415.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Girl with face mask",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          "Jeffrey Czum 123",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  )
                ],
              )),
              Divider(
                thickness: 2,
              ),
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Young girl red coat",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          "Jaspereology",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    flex: 1,
                    child: Image.network(
                        "https://images.pexels.com/photos/4026110/pexels-photo-4026110.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  )
                ],
              )),
              Divider(
                thickness: 2,
              ),
              Flexible(
                  child: Row(
                verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Image.network(
                        "https://images.pexels.com/photos/4048182/pexels-photo-4048182.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Running man",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          "Niko Twisty",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  )
                ],
              )),
            ]),
      ),
    );
  }
}
