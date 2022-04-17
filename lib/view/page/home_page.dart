import 'package:ar_core/view/page/screen/assets_object.dart';
import 'package:ar_core/view/page/screen/augmented_image/image.dart';
import 'package:ar_core/view/page/screen/augmented_image/text.dart';
import 'package:ar_core/view/page/screen/auto_detect_plane.dart';
import 'package:ar_core/view/page/screen/custom_object.dart';
import 'package:ar_core/view/page/screen/image_object.dart';
import 'package:ar_core/view/page/screen/matri_3d.dart';
import 'package:ar_core/view/page/screen/multiple_augmented_images.dart';
import 'package:ar_core/view/page/screen/remote_object.dart';
import 'package:ar_core/view/page/screen/runtime_materials.dart';
import 'package:ar_core/view/page/screen/texture_and_rotation.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import '../../core/utils.dart';
//page
import 'augmented_faces_page.dart';
import 'image_object_page.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ability();
  }

  ability() async {
    print('ARCORE IS AVAILABLE?');
    print(await ArCoreController.checkArCoreAvailability());

    print('\nAR SERVICES INSTALLED?');
    print(await ArCoreController.checkIsArCoreInstalled());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2f394e),
      body: Align(
        child: Column(
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
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AssetsObject()));
                },
                child: boX('3D Model ')),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AutoDetectPlane()));
                },
                child: boX('Auto Detect Plane')),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CustomObject()));
                },
                child: boX('Earth & Moon')),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ImageObjectScreen()));
                },
                child: boX('Gallery')),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Matrix3DRenderingPage()));
                },
                child: boX('Matrix Render')),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => MultipleAugmentedImagesPage()));
                },
                child: boX('Multi Detect Image')),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RemoteObject()));
                },
                child: boX('Online 3d Model')),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RuntimeMaterials()));
                },
                child: boX('Custom color..')),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ObjectWithTextureAndRotation()));
                },
                child: boX('Object Rotation')),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => TextAugmented()));
                },
                child: boX('text')),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ImageAugmented()));
                },
                child: boX('image')),
            SizedBox(
              height: 12,
            ),

          ],
        ),
      ),
    );
  }
}


