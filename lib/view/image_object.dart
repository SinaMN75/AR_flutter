import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;


class ImageObjectScreen extends StatefulWidget {

  @override
  _ImageObjectScreenState createState() => _ImageObjectScreenState();
}


class _ImageObjectScreenState extends State<ImageObjectScreen> {
  late ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;

    _addSphere(arCoreController);
    _addCylinder(arCoreController);
  }

  Future _addSphere(ArCoreController controller) async {
    final ByteData textureBytes = await rootBundle.load('assets/earth.jpg');

    final material = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244),
        textureBytes: textureBytes.buffer.asUint8List());
    final sphere = ArCoreSphere(
      materials: [material],
      radius: .25,
    );
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);
  }

  void _addCylinder(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.blueGrey,
      reflectance: 2,
    );
    final cylinder = ArCoreCylinder(
      materials: [material],
      radius: 0.1,
      height: 0.2,
    );
    final node = ArCoreNode(
      shape: cylinder,
      position: vector.Vector3(0.0, -0.5, -1.5),
    );
    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}