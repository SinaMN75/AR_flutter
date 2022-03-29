import 'package:ar_core/view/image_detection.dart';
import 'package:ar_core/view/object_plan.dart';
import 'package:flutter/material.dart';
import 'view/augmented_faces.dart';
import 'view/image_object.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xff2f394e),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2f394e),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ImageObjectScreen()));
              },
              child: boX('Sphere'),
            ),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AugmentedFacesScreen()));
                },
                child: boX('Snap Chat')),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ObjectGesturesWidget()));
                },
                child: boX('plan detection')),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AugmentedPage()));
                },
                child: boX('image detection')),
          ],
        ),
      ),
    );
  }
}

Widget boX(String text) {
  return Container(
    height: 45,
    width: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
        colors: [Color(0xfffddb81), Color(0xffe65c1e)],
      ),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
