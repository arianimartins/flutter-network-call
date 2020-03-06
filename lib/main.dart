import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/photos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GET Request',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Get Request'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Photos> futurePhotos;

  @override
  void initState() {
    super.initState();
    futurePhotos = fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        fetchData();
      }),
      body: FutureBuilder<Photos>(
        future: futurePhotos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: Container(
                    child: Column(
              children: <Widget>[
                Text(snapshot.data.photos[0].title),
                Image.network(snapshot.data.photos[0].url),
              ],
            )));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchData();
  }

  void fetchData() {
    /*var result = await http.get('https://jsonplaceholder.typicode.com/photos');
    print(result.body);*/
    http.get('https://jsonplaceholder.typicode.com/photos').then((result) {
      print(result.body);
    });
  }

  Future<Photos> fetchPhotos() async {
    final result = await http.get('https://jsonplaceholder.typicode.com/photos');
    if (result.statusCode == 200) {
      /*Iterable item = jsonDecode(result.body);
      List<Photos> photos = item.map((i)=>Photos.fromJson(i)).toList();*/
      return Photos.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('Failed!!!');
    }
  }
}
