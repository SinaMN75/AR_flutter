
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';

class AugmentedFacePage extends StatefulWidget {
  @override
  _AugmentedFacePageState createState() => _AugmentedFacePageState();
}

class _AugmentedFacePageState extends State<AugmentedFacePage> {
  ArCoreFaceController arCoreFaceController;

  int _selectedFace = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            ArCoreFaceView(
              onArCoreViewCreated: _onArCoreViewCreated,
              enableAugmentedFaces: true,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.transparent,
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(faceList.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedFace = index;
                          loadMesh();
                          _onArCoreViewCreated;
                        });
                      },
                      child: faceBox(faceList[index], _selectedFace == index),
                    );
                  }),
                ))
          ],
        ),
      ),
    );
  }

  Widget faceBox(String asset, bool selected) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      margin: EdgeInsets.all(10),
      width: selected ? 100 : 70,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(asset),
          ),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 3,
          )),
    );
  }

  final List<String> faceList = [
    'assets/fox_face_mesh_texture.png',
    'assets/venom.jpg',
    'assets/iron.png',
    'assets/spiderman.png',
  ];

  void _onArCoreViewCreated(ArCoreFaceController controller) {
    arCoreFaceController = controller;
    loadMesh();
  }

  loadMesh() async {
    final ByteData textureBytes = await rootBundle.load(faceList[_selectedFace]);

    arCoreFaceController.loadMesh(textureBytes: textureBytes.buffer.asUint8List(), skin3DModelFilename: 'ox_face.sfb');
  }

  @override
  void dispose() {
    arCoreFaceController.dispose();
    super.dispose();
  }
}
