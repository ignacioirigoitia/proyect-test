import 'package:flutter/material.dart';
class HomeLayout extends StatelessWidget {
  const HomeLayout({ Key? key, required this.child }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:[
          IconButton(onPressed: (){}, icon: Icon(Icons.video_call)),
          IconButton(onPressed: (){}, icon: Icon(Icons.home)),
        ],
        title: Text('Esta app es un test de cargar archivos para comprimirlos'),
      ),
      body: Expanded(
        child: Container(
          child: child
        ),
      ),
    );
  }
}