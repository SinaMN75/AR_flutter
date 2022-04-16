import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';

class ImageAugmented extends StatefulWidget {
  @override
  _ImageAugmentedState createState() => _ImageAugmentedState();
}

class _ImageAugmentedState extends State<ImageAugmented> {
  ArCoreController arCoreController;
  Map<int, ArCoreAugmentedImage> augmentedImagesMap = Map();

  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AugmentedPage'),
        ),
        body: Stack(
          children: [
            ArCoreView(
              onArCoreViewCreated: _onArCoreViewCreated,
              type: ArCoreViewType.AUGMENTEDIMAGES,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Visibility(
                visible: visible,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    )
                  ),
                    margin: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    color: Colors.white,
                    child: Image.asset('assets/copertina.jpg'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) async {
    arCoreController = controller;
    arCoreController.onTrackingImage = _handleOnTrackingImage;
    loadSingleImage();
    //OR
    // loadImagesDatabase();
  }

  loadSingleImage() async {
    final ByteData bytes =
    await rootBundle.load('assets/earth_augmented_image.jpg');
    arCoreController.loadSingleAugmentedImage(
        bytes: bytes.buffer.asUint8List());
  }

  loadImagesDatabase() async {
    final ByteData bytes = await rootBundle.load('assets/myimages.imgdb');
    arCoreController.loadAugmentedImagesDatabase(
        bytes: bytes.buffer.asUint8List());
  }

  _handleOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
    if (!augmentedImagesMap.containsKey(augmentedImage.index)) {
      augmentedImagesMap[augmentedImage.index] = augmentedImage;
      setState(() {
        visible = true;
      });

      // _addSphere(augmentedImage);
    }
  }


  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
