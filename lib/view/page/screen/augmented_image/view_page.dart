import 'package:flutter/material.dart';
import 'image.dart';
import 'text.dart';

class AugmentedScreen extends StatelessWidget {
  const AugmentedScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArCore Demo'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ImageAugmented()));
            },
            title: Text("image"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TextAugmented()));
            },
            title: Text("text"),
          ),

        ],
      ),
    );
  }
}
