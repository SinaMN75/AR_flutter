import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';

class TextAugmented extends StatefulWidget {
  @override
  _TextAugmentedState createState() => _TextAugmentedState();
}

class _TextAugmentedState extends State<TextAugmented> {
  ArCoreController arCoreController;
  Map<int, ArCoreAugmentedImage> augmentedImagesMap = Map();

  bool visible = false;
  AssetImage image = AssetImage('assets/copertina.jpg');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image;
  }

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
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
                child: Container( decoration: BoxDecoration(
                    color: Colors.white,
                //     image: DecorationImage(
                //   image: image,
                //   fit: BoxFit.fitHeight,
                // ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    )
                ),
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Text('Eraser',style: TextStyle(fontSize: 50),)
                ),
              ),
            )
          ],
        ),
      )
    ;
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
    await rootBundle.load('assets/card.jpg');
    arCoreController.loadSingleAugmentedImage(
        bytes: bytes.buffer.asUint8List());
  }

  loadImagesDatabase() async {
    final ByteData bytes = await rootBundle.load('assets/myimages.imgdb');
    arCoreController.loadAugmentedImagesDatabase(
        bytes: bytes.buffer.asUint8List());
  }

  _handleOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
    if (true == true) {
      augmentedImagesMap[augmentedImage.index] = augmentedImage;
      setState(() {
        visible = true;
      });
    }
  }



  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
