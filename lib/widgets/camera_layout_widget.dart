import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraLayoutWidget extends StatelessWidget {
  const CameraLayoutWidget({super.key, required this.cameraController});

  final CameraController cameraController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CameraPreview(cameraController),
        ),
        ClipRect(
          clipBehavior: Clip.hardEdge,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_rounded, size: 36.0),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: const Text(
                      'Point your camera at the document you want to scan.',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
