// import 'dart:typed_data';
//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
//
// class AugmentedPage extends StatefulWidget {
//   @override
//   _AugmentedPageState createState() => _AugmentedPageState();
// }
//
// class _AugmentedPageState extends State<AugmentedPage> {
//   ArCoreController arCoreController;
//   Map<int, ArCoreAugmentedImage> augmentedImagesMap = Map();
//
//   bool visible = false;
//
//   int maxduration = 100;
//   int currentpos = 0;
//   String currentpostlabel = "00:00";
//   String audioasset = "assets/audio/sea.mp3";
//   bool isplaying = false;
//   bool audioplayed = false;
//   Uint8List audiobytes;
//
//   AudioPlayer player = AudioPlayer();
//
//   @override
//   void initState() {
//     Future.delayed(Duration.zero, () async {
//       ByteData bytes =
//           await rootBundle.load(audioasset); //load audio from assets
//       audiobytes =
//           bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
//       //convert ByteData to Uint8List
//
//       player.onDurationChanged.listen((Duration d) {
//         //get the duration of audio
//         maxduration = d.inMilliseconds;
//         setState(() {});
//       });
//
//       player.onAudioPositionChanged.listen((Duration p) {
//         currentpos =
//             p.inMilliseconds; //get the current position of playing audio
//
//         //generating the duration label
//         int shours = Duration(milliseconds: currentpos).inHours;
//         int sminutes = Duration(milliseconds: currentpos).inMinutes;
//         int sseconds = Duration(milliseconds: currentpos).inSeconds;
//
//         int rhours = shours;
//         int rminutes = sminutes - (shours * 60);
//         int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);
//
//         currentpostlabel = "$rhours:$rminutes:$rseconds";
//
//         setState(() {
//           //refresh the UI
//         });
//       });
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('AugmentedPage'),
//         ),
//         body: Stack(
//           children: [
//             ArCoreView(
//               onArCoreViewCreated: _onArCoreViewCreated,
//               type: ArCoreViewType.AUGMENTEDIMAGES,
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Visibility(
//                 visible: visible,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                   )),
//                   margin: EdgeInsets.all(20),
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height / 3,
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                       Slider(
//                         value: double.parse(currentpos.toString()),
//                         min: 0,
//                         max: double.parse(maxduration.toString()),
//                         divisions: maxduration,
//                         label: currentpostlabel,
//                         onChanged: (double value) async {
//                           int seekval = value.round();
//                           int result = await player
//                               .seek(Duration(milliseconds: seekval));
//                           if (result == 1) {
//                             //seek successful
//                             currentpos = seekval;
//                           } else {
//                             print("Seek unsuccessful.");
//                           }
//                         },
//                       ),
//                       Row(
//                         children: [
//                           ElevatedButton.icon(
//                               onPressed: () async {
//                                 if (!isplaying && !audioplayed) {
//                                   int result =
//                                       await player.playBytes(audiobytes);
//                                   if (result == 1) {
//                                     //play success
//                                     setState(() {
//                                       isplaying = true;
//                                       audioplayed = true;
//                                     });
//                                   } else {
//                                     print("Error while playing audio.");
//                                   }
//                                 } else if (audioplayed && !isplaying) {
//                                   int result = await player.resume();
//                                   if (result == 1) {
//                                     //resume success
//                                     setState(() {
//                                       isplaying = true;
//                                       audioplayed = true;
//                                     });
//                                   } else {
//                                     print("Error on resume audio.");
//                                   }
//                                 } else {
//                                   int result = await player.pause();
//                                   if (result == 1) {
//                                     //pause success
//                                     setState(() {
//                                       isplaying = false;
//                                     });
//                                   } else {
//                                     print("Error on pause audio.");
//                                   }
//                                 }
//                               },
//                               icon: Icon(
//                                   isplaying ? Icons.pause : Icons.play_arrow),
//                               label: Text(isplaying ? "Pause" : "Play")),
//                           ElevatedButton.icon(
//                               onPressed: () async {
//                                 int result = await player.stop();
//                                 if (result == 1) {
//                                   //stop success
//                                   setState(() {
//                                     isplaying = false;
//                                     audioplayed = false;
//                                     currentpos = 0;
//                                   });
//                                 } else {
//                                   print("Error on stop audio.");
//                                 }
//                               },
//                               icon: Icon(Icons.stop),
//                               label: Text("Stop")),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _onArCoreViewCreated(ArCoreController controller) async {
//     arCoreController = controller;
//     arCoreController.onTrackingImage = _handleOnTrackingImage;
//     loadSingleImage();
//     //OR
//     // loadImagesDatabase();
//   }
//
//   loadSingleImage() async {
//     final ByteData bytes =
//         await rootBundle.load('assets/earth_augmented_image.jpg');
//     arCoreController.loadSingleAugmentedImage(
//         bytes: bytes.buffer.asUint8List());
//   }
//
//   loadImagesDatabase() async {
//     final ByteData bytes = await rootBundle.load('assets/myimages.imgdb');
//     arCoreController.loadAugmentedImagesDatabase(
//         bytes: bytes.buffer.asUint8List());
//   }
//
//   _handleOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
//     if (!augmentedImagesMap.containsKey(augmentedImage.index)) {
//       augmentedImagesMap[augmentedImage.index] = augmentedImage;
//       setState(() {
//         visible = true;
//       });
//
//       // _addSphere(augmentedImage);
//     }
//   }
//
//   @override
//   void dispose() {
//     arCoreController.dispose();
//     super.dispose();
//   }
// }
