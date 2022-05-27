import 'dart:html';

import 'package:flutter/material.dart';
import 'package:json_parsing_demo/pages/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text("Page1 "),
      ),
      body: Center(
        child:RaisedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Page2()));
          },
          child: Text("Move to page 2"),
        )
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text("Page1 "),
      ),
      body: Center(
          child:RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Page1()));
            },
            child: Text("Move to page 1"),
          )
      ),
    );
  }
}

