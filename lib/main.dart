import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest2/FlexDemo2.dart';
import 'package:fluttertest2/FlexibleWidgetPage.dart';
import 'package:fluttertest2/MediaQueryPage.dart';
import 'package:fluttertest2/view/component/Page2.dart';
import 'package:fluttertest2/StackPage.dart';

import 'view/component/Page3.dart';
import 'Page4.dart';
import 'Page5.dart';
import 'Page6.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

        dividerTheme: const DividerThemeData(
            space: 30,
            color: Colors.red,
            indent: 5,
            thickness: 12,
            endIndent: 5),

        // Define the default brightness and colors.
        //brightness: Brightness.dark,
        //primaryColor: Colors.lightBlue[800],
        //accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        // textTheme: TextTheme(
        //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        // ),
      ),
      home: const MyHomePage(title123: 'Flutter Demo 20221'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title123}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title123;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }

// @override
// State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final ButtonStyle btnStyle =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Theme(
        data: Theme.of(context).copyWith(hintColor: Colors.yellow),
        child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title123),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_alert),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute<void>(
                    builder: (BuildContext context) {
                      return Page4();
                    },
                  ));
                },
              ),
              IconButton(
                icon: const Icon(Icons.navigate_next_rounded),
                tooltip: 'Go to the next page',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return FlexDemo2();
                    },
                  ));
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Center(
                child: Container(
              padding: const EdgeInsets.all(18.0),
              color: Colors.amberAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Row(
                    children: const <Widget>[
                      Expanded(
                        child: Text('Deliver features faster',
                            textAlign: TextAlign.center),
                      ),
                      Expanded(
                        child: Text('Craft beautiful UIs',
                            textAlign: TextAlign.center),
                      ),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          // otherwise the logo will be tiny
                          child: FlutterLogo(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const FlutterLogo(),
                      const Expanded(
                        child: Text(
                            "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android."),
                      ),
                      const Icon(Icons.sentiment_very_satisfied),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: btnStyle,
                    onPressed: null,
                    child: const Text('Disabled'),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: btnStyle,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Btn Pressed 20221')));

                      Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return StackPage();
                        },
                      ));
                    },
                    child: const Text('Enabled'),
                  ),
                ],
              ),
            )),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(height: 50.0),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.plus_one),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
