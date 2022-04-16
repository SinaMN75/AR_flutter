//package
import 'package:flutter/material.dart';
//page
import 'view/page/home_page.dart';

 main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AR_Flutter',
      home: MyHomePage(),
    );
  }
}
