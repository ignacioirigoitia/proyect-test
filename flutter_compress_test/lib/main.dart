
import 'package:flutter/material.dart';
import 'package:flutter_compress_test/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Esta app es un test de cargar archivos para comprimirlos'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: HomeReactions()
          ),
        ),
      ),
    );
  }
}