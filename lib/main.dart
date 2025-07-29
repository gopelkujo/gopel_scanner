import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome,',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            'User One',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Dummy profile image.
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 16.0,
                    children: [
                      Expanded(child: _buildMenuItem(label: 'MRZ')),
                      Expanded(child: _buildMenuItem(label: 'Fingerprint')),
                      Expanded(child: _buildMenuItem(label: 'NFC')),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Text('Gopel Kujo © 2025', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({required String label}) {
    return ElevatedButton(
      onPressed: () {
        // TODO: Add on pressed menu item here.
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      child: Text(label),
    );
  }
}
