import 'dart:io';

import 'package:camera_app/services/camera_gallery_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? photoPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 350,
          child: photoPath != null
              ? Image(
                  image: FileImage(File(photoPath!)),
                  fit: BoxFit.fill,
                )
              : Container(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.image),
            onPressed: () async {
              final path = await CameraGalleryService().selectPhoto();
              if (path == null) return;
              setState(() {
                photoPath = path;
              });
            },
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            child: const Icon(Icons.camera_alt),
            onPressed: () async {
              final path = await CameraGalleryService().takePhoto();
              if (path == null) return;
              setState(() {
                photoPath = path;
              });
            },
          ),
        ],
      ),
    );
  }
}
