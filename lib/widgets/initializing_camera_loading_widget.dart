import 'package:flutter/material.dart';

class InitializingCameraLoadingWidget extends StatelessWidget {
  const InitializingCameraLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16.0,
        children: [CircularProgressIndicator(), Text('Initializing camera...')],
      ),
    );
  }
}
