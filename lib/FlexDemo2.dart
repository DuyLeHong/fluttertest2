import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flex Demo - CodeFresher'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
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
                      "https://codefresher.vn/wp-content/uploads/2022/01/banner_2022_flutter-1024x1024.jpg",

                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    flex: 3,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Lập trình Flutter",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Thực chiến dự án app mobile 2022",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Lập trình Android",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Java + Kotlin",
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
                        "https://codefresher.vn/wp-content/uploads/2022/01/banner_2022_android.jpg"),
                  )
                ],
              )),
              Divider(
                thickness: 2,
              ),
              Flexible(
                  child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: Image.network(
                        "https://codefresher.vn/wp-content/uploads/2021/06/banner-Java-core-03-1024x1024.png"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Lập trình Java cơ bản",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          "Cho người mới bắt đầu",
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
