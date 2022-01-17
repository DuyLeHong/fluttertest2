import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest2/view/component/Page3.dart';
//import 'package:fluttertest2/view/component/Page3.dart';

class Page4 extends StatelessWidget {
  late final List<String> items;

  @override
  Widget build(BuildContext context) {
    items = List<String>.generate(10000, (i) => 'Item $i');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 4'),
      ),
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index]),
                  );
                },
              ),
            ),
            //Page3(),
            Image.asset(
              'BulbOn.jpeg',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
