// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoAugmented extends StatefulWidget {
//   @override
//   _VideoAugmentedState createState() => _VideoAugmentedState();
// }
//
// class _VideoAugmentedState extends State<VideoAugmented> {
//   ArCoreController arCoreController;
//   Map<int, ArCoreAugmentedImage> augmentedImagesMap = Map();
//
//   bool visible = false;
//   VideoPlayerController _playerController;
//   Future<void> _initializeVideoPlayerFuture;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _playerController = VideoPlayerController.asset(
//         'assets/snow.mp4'); // Initialize the controller and store the Future for later use.
//     _initializeVideoPlayerFuture = _playerController.initialize();
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
//                   child: Stack(
//                     children: [
//                       FutureBuilder(
//                           future: _initializeVideoPlayerFuture,
//                           builder: (context, snapshot) {
//                             return AspectRatio(
//                               aspectRatio: _playerController.value.aspectRatio,
//                               // Use the VideoPlayer widget to display the video.
//                               child: VideoPlayer(_playerController),
//                             );
//                           }),
//                       AnimatedSwitcher(
//                         duration: const Duration(milliseconds: 50),
//                         reverseDuration: const Duration(milliseconds: 200),
//                         child: _playerController.value.isPlaying
//                             ? const SizedBox.shrink()
//                             : Container(
//                                 color: Colors.black26,
//                                 child: const Center(
//                                   child: Icon(
//                                     Icons.play_arrow,
//                                     color: Colors.white,
//                                     size: 100.0,
//                                     semanticLabel: 'Play',
//                                   ),
//                                 ),
//                               ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           _playerController.value.isPlaying
//                               ? _playerController.pause()
//                               : _playerController.play();
//                         },
//                       ),
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
//     }
//   }
//
//   @override
//   void dispose() {
//     arCoreController.dispose();
//     super.dispose();
//   }
// }
