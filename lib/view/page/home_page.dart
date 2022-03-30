import 'package:flutter/material.dart';
import '../../core/utils.dart';
//page
import 'image_detection_page.dart';
import 'object_plan_page.dart';
import 'augmented_faces_page.dart';
import 'image_object_page.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2f394e),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ImageObjectPage()));
            },
            child: boX('Image Object'),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => AugmentedFacePage()));
              },
              child: boX('Snap Chat')),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ObjectGesturesPage()));
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
    );
  }
}


