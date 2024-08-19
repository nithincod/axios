import 'package:codeui/services/auth_gate.dart';
import 'package:codeui/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'firebase_options.dart';
import 'pages/toppage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    loadData(); // Call loadData when the app starts
  }

  Future<void> loadData() async {
    String url = "https://api.calorieninjas.com/v1/nutrition?query=10oz onion and a tomato";
    String apiKey = 'YOUR_API_KEY'; // Ensure to use quotes for the API key

    try {
      var response = await http.get(Uri.parse(url), headers: {
        "X-Api-Key": apiKey,
      });

      if (response.statusCode == 200) {
        print(response.body); // Print the response body if successful
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e'); // Handle errors gracefully
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