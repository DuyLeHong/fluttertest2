import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



// Định nghĩa lớp Album để hứng dữ liệu trả về
class Album {
  final int userId;
  final int id;
  final String title;

  Album({required this.userId, required this.id, required this.title});

  /*
  factory là một keyword trong Dart, nó không hẳn là constructor nhưng nó cũng tạo
  ra đối tượng từ tham số truyền vào
  */
  static Album fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(RestAPIApp());

class RestAPIApp extends StatefulWidget {
  RestAPIApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<RestAPIApp> {
  late Future<List<Album>> futureAlbum;
  //bool isHasData = false;
  String dataRespone = 'Fetching data ...';

  //Định nghĩa hàm lấy dữ liệu về nhớ sử dụng async await
  Future<List<Album>> fetchAlbum() async {
    // final response =
    //     await http.get(Uri.https('jsonplaceholder.typicode.com', '/albums/1'));

    final response =
    await http.get(Uri.https('jsonplaceholder.typicode.com', '/albums'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<Album> list;

      //list.add(Album.fromJson(json.decode(response.body)));

      list = (json.decode(response.body) as List).map((jsonObj) =>
          Album.fromJson(jsonObj)).toList();

      setState(() {
        //isHasData = true;
        dataRespone = list.elementAt(3).title;
      });

      return list; //Khởi tạo đối tượng Album từ JSON trả về
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState () {
    super.initState();
    futureAlbum = fetchAlbum();


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child:
            Text(dataRespone),
          // FutureBuilder<List<Album>>(
          //   /*
          //     class FutureBuilder<T> extends StatefulWidget
          //     FutureBuilder là một generic class kế thừa StatefulWidget,
          //     kiểu truyền vào kiểu dữ liệu trả về trong tương lai
          //   */
          //   future: futureAlbum,
          //   //Truyền kết quả trả về của Album trong tương lai vào đây
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Text((snapshot.data! as List<Album>).elementAt(1).title);
          //     } else if (snapshot.hasError) {
          //       return Text("${snapshot.error}");
          //     }
          //
          //     // Mặc định thì show một cái loading
          //     return CircularProgressIndicator();
          //   },
          // ),
        ),
      ),
    );
  }
}
