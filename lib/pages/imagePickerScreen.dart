// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'package:html/parser.dart' as html_parser;

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? imageFile;
  List _results = [];
  bool imageSelect = false;
  bool isLoading = false;
  String calories = '';
  String result = '';

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    Tflite.close();
    try {
      String? res = await Tflite.loadModel(
        model: "assets/MyFoodClassifier.tflite",
        labels: "assets/labels.txt",
      );
      if (res == null) {
        throw Exception('Model loading failed');
      } else {
        print('Model loaded successfully');
      }
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  Future<void> imageClassification(File image) async {
    try {
      var recognitions = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 1,
        threshold: 0.9,
        imageMean: 127.5,
        imageStd: 127.5,
      );
      setState(() {
        _results = recognitions ?? [];
        imageSelect = true;
      });
      if (_results.isNotEmpty) {
        await fetchCalories(_results.first['label']);
      }
      print(_results);
    } catch (e) {
      print("Failed to run model: $e");
    }
  }

  Future<void> _getFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      await imageClassification(imageFile!);
    }
  }

  Future<void> _getFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      await imageClassification(imageFile!);
    }
  }

  Future<void> fetchCalories(String prediction) async {
    setState(() {
      isLoading = true;
    });

    try {
     
      final url = 'https://www.google.com/search?q=calories+in+$prediction';

      
      final response = await http.get(Uri.parse(url));

      
      if (response.statusCode == 200) {
        
        var document = html_parser.parse(response.body);
        
        var caloriesElement = document.querySelector("div.BNeawe.iBp4i.AP7Wnd");
        if (caloriesElement != null) {
          setState(() {
            calories = caloriesElement.text.replaceAll(RegExp(r'[^0-9]'), ''); 
          });
        } else {
          setState(() {
            calories = "Calories information not found.";
          });
        }
      } else {
        setState(() {
          calories = "Failed to fetch data: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        calories = "Error occurred: $e";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.deepPurpleAccent),
          displayMedium: TextStyle(color: Colors.deepPurpleAccent),
          bodyMedium: TextStyle(color: Colors.deepPurpleAccent),
          titleMedium: TextStyle(color: Colors.pinkAccent),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Calorie Estimator',
             style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              ),
            ),
          centerTitle: true,
          backgroundColor:  Color.fromARGB(255, 44, 7, 231),
          
        ),
        body: Container(
          alignment: Alignment.center,
          color: const Color.fromARGB(255, 232, 232, 235),
          padding: const EdgeInsets.all(16),
          child: imageFile == null
              ? const Center(
                  child: Text(
                    'No image selected.',
                    style: TextStyle(
                      fontSize: 20,
                      color:  Color.fromARGB(255, 4, 4, 5),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.file(
                      imageFile!,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      
                    ),
                    const SizedBox(height: 0),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _results.map((result) {
                          return Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color:  Color.fromARGB(255, 44, 7, 231), 
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    "${result['label']}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    
                                  ),
                                  const SizedBox(height: 10),
                                  if (isLoading)
                                    const CircularProgressIndicator(),
                                  if (!isLoading && calories.isNotEmpty)
                                    Text(
                                      "Estimated Calories per 100 g: $calories",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                heroTag: "gallery",
                onPressed: () async {
                  await _getFromGallery();
                },
                child: const Icon(
                  Icons.photo_library,
                  color: Colors.white,
                  ),
                backgroundColor: Color.fromARGB(255, 44, 7, 231),
              ),
              FloatingActionButton(
                heroTag: "camera",
                onPressed: () async {
                  await _getFromCamera();
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  ),
                backgroundColor: Color.fromARGB(255, 44, 7, 231),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
