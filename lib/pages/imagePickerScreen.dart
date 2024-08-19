import 'dart:io'; // Import the dart:io package for File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image; 

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxHeight: 500,

    );

    setState(() {
      _image = image != null ? File(image.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Center(
        child: _image == null
            ? const Text('No image selected') 
            : Image.file(_image!), 
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Capture Image',
        onPressed: getImage,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}