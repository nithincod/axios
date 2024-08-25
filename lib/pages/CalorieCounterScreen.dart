import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'package:html/parser.dart' as html_parser;

class CalorieCounterScreen extends StatefulWidget {
  const CalorieCounterScreen({super.key});

  @override
  State<CalorieCounterScreen> createState() => _CalorieCounterScreenState();
}

class _CalorieCounterScreenState extends State<CalorieCounterScreen> {
  String calories = '';
  String result = '';
  bool isLoading = false;

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
            calories = caloriesElement.text.replaceAll(RegExp(r'[^0-9]'), ''); // Extract only numbers
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

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  void calculateCalories() {
    if (calories.isNotEmpty && double.tryParse(calories) != null) {
      double calorieValue = double.parse(calories);
      double grams = double.tryParse(controller2.text) ?? 0;
      setState(() {
        result = (calorieValue * (grams / 100)).toStringAsFixed(2);
      });
    } else {
      setState(() {
        result = "Please enter valid data.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calorie Counter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        backgroundColor:Color.fromARGB(255, 44, 7, 231),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 236, 233, 239),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Plan your Meal 🔥🔥',
              style: TextStyle(fontSize: 18,color: Colors.deepPurple, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              
            ),
            const SizedBox(height: 20),
            
            TextFormField(
              controller: controller1,
              decoration: InputDecoration(
                labelText: 'Enter food item',
                hintText: 'e.g., Apple',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  fetchCalories(value);
                }
              },
            ),
            const SizedBox(height: 20),
            
            TextFormField(
              controller: controller2,
              decoration: InputDecoration(
                labelText: 'Total grams',
                hintText: 'Enter total grams',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                calculateCalories();
              },
            ),
            const SizedBox(height: 20),
            // Loading indicator
            if (isLoading) CircularProgressIndicator(),
            const SizedBox(height: 20),
            // Display calorie information
            Text(
              'Calories per 100g: $calories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Display total calories
            Text(
              'Total Calories: $result',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}