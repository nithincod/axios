import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
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
     
  }
  
Future<String?> fetchCalories(String prediction) async {
  try {
    
    final url = 'https://www.google.com/search?q=calories+in+$prediction';
    final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
      
      var document = html_parser.parse(response.body);
      
      var caloriesElement = document.querySelector("div.BNeawe.iBp4i.AP7Wnd");
      if (caloriesElement != null) {
        return caloriesElement.text;
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