import 'package:flutter/material.dart';

main() {
  runApp(RoutesApp());
}

class RoutesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App",
      // routes: {
      //   "/": (_) => Home(),
      //   "/second": (_) => SecondPage(),
      // },

      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          // final ScreenArguments args = settings.arguments;

          // Then, extract the required data from the arguments and
          // pass the data to the correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return Home();
            },
          );
        } else if (settings.name == "/second") {
          // Cast the arguments to the correct type: ScreenArguments.
          final String args = settings.arguments.toString();

          return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return SecondPage(data: args);
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(),
                onChanged: (value) {
                  data = value;
                },
              ),
            ),
            RaisedButton(
              child: Text("Push to Next Page"),
              onPressed: () {
                Navigator.pushNamed(context, "/second", arguments: data);

                // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                //   return SecondPage(data: data);
                // }));
              },
            ),
          ],
        ),
      ),
    );
  }
}



class SecondPage extends StatelessWidget {
  String? data;

  SecondPage({this.data = ""});

  @override
  Widget build(BuildContext context) {

    //data = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Go Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Data from Home: $data",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
