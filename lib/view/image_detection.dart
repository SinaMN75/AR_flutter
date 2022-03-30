import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';

class AugmentedPage extends StatefulWidget {
  @override
  _AugmentedPageState createState() => _AugmentedPageState();
}

class _AugmentedPageState extends State<AugmentedPage> {
  late ArCoreController arCoreController;
  Map<int, ArCoreAugmentedImage> augmentedImagesMap = Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Detection'),
        ),
        body:
            ArCoreView(
              onArCoreViewCreated: _onArCoreViewCreated,
              type: ArCoreViewType.AUGMENTEDIMAGES,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onTrackingImage = _handleOnTrackingImage;
    loadSingleImage();
    //OR

    // loadImagesDatabase();
  }

  loadSingleImage() async {
   // final ByteData bytes = await NetworkAssetBundle(Uri.parse('https://m.media-amazon.com/images/I/71hJgA36ihL._AC_SX425_.jpg')).load("");

    final ByteData bytes = await rootBundle.load('assets/earth_augmented_image.jpg');
    arCoreController.loadSingleAugmentedImage(bytes: bytes.buffer.asUint8List());
  }

  loadImagesDatabase() async {
    final ByteData bytes = await rootBundle.load('assets/myimages.imgdb');
    arCoreController.loadAugmentedImagesDatabase(bytes: bytes.buffer.asUint8List());
  }

  _handleOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
    //problem craaaash
    if (true) {
      augmentedImagesMap[augmentedImage.index] = augmentedImage;
      _addSphere(augmentedImage);
    }
  }

  Future _addSphere(ArCoreAugmentedImage augmentedImage) async {

   // final ByteData textureBytes = await rootBundle.load('assets/earth.jpg');

    final ByteData textureBytes = await NetworkAssetBundle(Uri.parse('https://thumbs.dreamstime.com/b/texture-soccer-ball-13533294.jpg')).load("");

    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      textureBytes: textureBytes.buffer.asUint8List(),
    );
    final sphere = ArCoreSphere(
      materials: [material],
      radius: .1,
    );
    final node = ArCoreNode(
      shape: sphere,
    );
    arCoreController.addArCoreNodeToAugmentedImage(node, augmentedImage.index, parentNodeName: augmentedImage.name);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
