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

class MyHomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Color frogColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Builder(
              builder: (BuildContext context) {
                return FlatButton(
                  child: Text('show snackbar'),
                  color: Colors.pink,
                  onPressed: () {
                    // xử lý show snackbar khi click
                    final snackBar =
                    SnackBar(content: Text('Nội dung text gì đó'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                );
              },
            ),
            FrogColor(
              color: frogColor,
              child: Builder(
                builder: (BuildContext context) {
                  return Text(
                    'Hello Frog',
                    style: TextStyle(color: FrogColor.of(context).color),
                  );
                },
              ),
            ),

            ElevatedButton(onPressed: () {
              setState(() {
                if (frogColor == Colors.green) {
                  frogColor = Colors.blueGrey;
                } else {
                  frogColor = Colors.green;
                }
              });
            }, child: Text('Click Me!')),
          ],
        ),
      ),
    );
  }
}

class FrogColor extends InheritedWidget {
  const FrogColor({
    Key? key,
    required this.color,
    required Widget child,
  }) : super(key: key, child: child);

  final Color color;

  static FrogColor of(BuildContext context) {
    final FrogColor? result =
        context.dependOnInheritedWidgetOfExactType<FrogColor>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(FrogColor old) => color != old.color;
}
