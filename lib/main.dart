import 'dart:convert';

import 'package:codeui/services/auth_gate.dart';
import 'package:codeui/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'firebase_options.dart';
import 'pages/toppage.dart';
import 'package:html/parser.dart' as html_parser;

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
     // Call loadData when the app starts
  }
  
Future<String?> fetchCalories(String prediction) async {
  try {
    // Construct the URL for the Google search
    final url = 'https://www.google.com/search?q=calories+in+$prediction';

    // Make the GET request
    final response = await http.get(Uri.parse(url));

    // Check if the request was successful
    if (response.statusCode == 200) {
      // Parse the HTML response
      var document = html_parser.parse(response.body);
      // Find the element containing calorie information
      var caloriesElement = document.querySelector("div.BNeawe.iBp4i.AP7Wnd");
      if (caloriesElement != null) {
        return caloriesElement.text; // Return the calorie text
      } else {
        return "Calories information not found.";
      }
    } else {
      return "Failed to fetch data: ${response.statusCode}";
    }
  } catch (e) {
    return "Error occurred: $e";
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TopPage(),
    );
  }
}