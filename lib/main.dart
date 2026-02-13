import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gopel_scanner/widgets/camera_layout_widget.dart';
import 'package:gopel_scanner/widgets/initializing_camera_loading_widget.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController controller;

  String? cameraErrorCode;

  @override
  void initState() {
    super.initState();
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller
        .initialize()
        .then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        })
        .catchError((Object e) {
          if (e is CameraException) {
            switch (e.code) {
              case 'CameraAccessDenied':
                cameraErrorCode = e.code;
                setState(() {});
                break;
              default:
                // Handle other errors here.
                break;
            }
          }
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isCameraInitialized = controller.value.isInitialized;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child:
            isCameraInitialized
                ? CameraLayoutWidget(cameraController: controller)
                : cameraErrorCode != null
                // TODO: add inform user if camera access denied.
                ? Center(child: Text('Camera access denied'))
                : InitializingCameraLoadingWidget(),
      ),
      floatingActionButton: ClipRect(
        clipBehavior: Clip.hardEdge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.white54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  label: const Text(
                    'Open from file',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: const Icon(Icons.folder_open_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.help_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
