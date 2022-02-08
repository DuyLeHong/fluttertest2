import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson 5',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  late final List<String> items;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    items = List<String>.generate(100, (i) => 'Phan tu thu $i');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 5'),
      ),
      body: Container(
        child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'Banner-Youtube-thumbnail-KH-ReactNative-4.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Container(child: Text(items[index])); // neu dung widget tuy bien thi can dung them GestureDetector

                      // return ListTile(
                      //   title: Text(items[index]),
                      //   subtitle: Text("Sub Title cua ${items[index]}"),
                      //   onTap: () {
                      //     String mess = items[index];
                      //
                      //     ScaffoldMessenger.of(context)
                      //         .showSnackBar(SnackBar(content: Text(mess)));
                      //   },
                      // );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
