// import 'dart:typed_data';
//
// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class AssetsObject extends StatefulWidget {
//   @override
//   _AssetsObjectState createState() => _AssetsObjectState();
// }
//
// class _AssetsObjectState extends State<AssetsObject> {
//   ArCoreController arCoreController;
//   String objectSelected;
//
//
//   String audioasset = "assets/TocoToucan.mp3";
//   bool isplaying = false;
//   bool audioplayed = false;
//   Uint8List audiobytes;
//
//   AudioPlayer player = AudioPlayer();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     played();
//   }
//
//   played() async {
//     ByteData bytes =
//     await rootBundle.load(audioasset); //load audio from assets
//     audiobytes =
//         bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
//     //convert ByteData to Uint8List}
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Custom Object on plane detected'),
//         ),
//         body: Stack(
//           children: <Widget>[
//             ArCoreView(
//               onArCoreViewCreated: _onArCoreViewCreated,
//               enableTapRecognizer: true,
//             ),
//             Align(
//               alignment: Alignment.topLeft,
//               child: ListObjectSelection(
//                 onTap: (value) async {
//                   objectSelected = value;
//                   await player.playBytes(audiobytes);
//                   setState(() {
//                     isplaying = true;
//                     audioplayed = true;
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _onArCoreViewCreated(ArCoreController controller) {
//     arCoreController = controller;
//     arCoreController.onNodeTap = (name) => onTapHandler(name);
//     arCoreController.onPlaneTap = _handleOnPlaneTap;
//   }
//
//   void _addToucano(ArCoreHitTestResult plane) {
//     if (objectSelected != null) {
//       //"https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF/Duck.gltf"
//       final toucanoNode = ArCoreReferenceNode(
//           name: objectSelected,
//           object3DFileName: objectSelected,
//           position: plane.pose.translation,
//           rotation: plane.pose.rotation);
//
//       arCoreController.addArCoreNodeWithAnchor(toucanoNode);
//     } else {
//       showDialog<void>(
//         context: context,
//         builder: (BuildContext context) =>
//             AlertDialog(content: Text('Select an object!')),
//       );
//     }
//   }
//
//   void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
//     final hit = hits.first;
//     _addToucano(hit);
//   }
//
//   void onTapHandler(String name) {
//     print("Flutter: onNodeTap");
//     showDialog<void>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         content: Row(
//           children: <Widget>[
//             Text('Remove $name?'),
//             IconButton(
//                 icon: Icon(
//                   Icons.delete,
//                 ),
//                 onPressed: () {
//                   arCoreController.removeNode(nodeName: name);
//                   Navigator.pop(context);
//                 })
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     arCoreController.dispose();
//     super.dispose();
//   }
// }
//
// class ListObjectSelection extends StatefulWidget {
//   final Function onTap;
//
//   ListObjectSelection({this.onTap});
//
//   @override
//   _ListObjectSelectionState createState() => _ListObjectSelectionState();
// }
//
// class _ListObjectSelectionState extends State<ListObjectSelection> {
//   List<String> gifs = [
//     'assets/TocoToucan.gif',
//     'assets/ArcticFox.gif',
//   ];
//
//   List<String> objectsFileName = [
//     'toucan.sfb',
//     'artic_fox.sfb',
//   ];
//
//   String selected;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150.0,
//       child: ListView.builder(
//         itemCount: gifs.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selected = gifs[index];
//                 widget.onTap(objectsFileName[index]);
//               });
//             },
//             child: Card(
//               elevation: 4.0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(10),
//                 ),
//               ),
//               child: Container(
//                 color:
//                     selected == gifs[index] ? Colors.red : Colors.transparent,
//                 padding: selected == gifs[index] ? EdgeInsets.all(8.0) : null,
//                 child: Image.asset(gifs[index]),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
