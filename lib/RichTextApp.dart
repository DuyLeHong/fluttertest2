import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

void main() => runApp(RichTextApp());

class RichTextApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RichTextApp',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Rich Text'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                  color: Colors.amberAccent,
                  padding: EdgeInsets.all(8),
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 30, color: Colors.black, height: 1.5),
                          children: <TextSpan>[
                        TextSpan(
                            text: "Học ở CodeFresher\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "Ngày nào cũng là ngày vui\n",
                            style: TextStyle(fontStyle: FontStyle.italic)),
                        TextSpan(
                            text: "Thích học thì click vào đây\n",
                            style: TextStyle(fontStyle: FontStyle.normal)),
                        TextSpan(
                          text: "https://codefresher.vn\n",
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              launcher.launch('https://codefresher.vn');
                            },
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Colors.deepOrange),
                        )
                      ]))),
              SizedBox(
                height: 20,
              ),
              const SelectableText(
                "Hạt gạo làng ta\n"
                "Có vị phù sa\n"
                "Của sông Kinh Thầy\n"
                "Có hương sen thơm\n"
                "Trong hồ nước đầy\n"
                "Có lời mẹ hát\n"
                "Ngọt bùi đắng cay...",
                style: TextStyle(fontSize: 30),
                showCursor: true,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.amberAccent,
                width: 200,
                height: 200,
                child: Center(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    //alignment: WrapAlignment.start,
                    children: <Widget>[
                      Text("Hello", style: TextStyle(fontSize: 30)),
                      SizedBox(width: 20),
                      Text("Hello", style: TextStyle(fontSize: 30)),
                      SizedBox(width: 20),
                      Text("Hello", style: TextStyle(fontSize: 30)),
                      SizedBox(width: 20),
                      Text("Hello", style: TextStyle(fontSize: 30)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
