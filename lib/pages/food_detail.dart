import 'package:codeui/utils/foodList.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class FoodDetail extends StatelessWidget {
  final Food food;

  const FoodDetail({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(food.name),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              child: Image.asset(
                food.image, 
                height: MediaQuery.of(context).size.height * 0.3, 
                width: MediaQuery.of(context).size.width,
                
                
                ),
            ),
            
            Center(
              child: Text('Calories🔥🔥: ${food.calories} ', 
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold, 
                color: Color.fromARGB(255, 27, 27, 27))
                )
                ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1 ),
            NutritionalRings(food: food),
          ],
        ),
      ),
    );
  }
}

class NutritionalRings extends StatelessWidget {
  final Food food;

  const NutritionalRings({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 5.0,
              animation: true,
              percent: food.protein / 100, 
              center: Text("${food.protein}g", style: TextStyle(fontWeight: FontWeight.bold)),
              footer: Text("Protein", style: TextStyle(fontWeight: FontWeight.bold)),
              progressColor: Colors.green,
            ),
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 5.0,
              animation: true,
              percent: food.carbs / 100, 
              center: Text("${food.carbs}g", style: TextStyle(fontWeight: FontWeight.bold)),
              footer: Text("Carbs", style: TextStyle(fontWeight: FontWeight.bold)),
              progressColor: Colors.blue,
            ),
          ],
        ),
        SizedBox(height: 20),
        Center(
          child: CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 5.0,
            animation: true,
            percent: food.fats / 100, 
            center: Text("${food.fats}g", style: TextStyle(fontWeight: FontWeight.bold)),
            footer: Text("Fats", style: TextStyle(fontWeight: FontWeight.bold)),
            progressColor: Colors.red,
          ),
        ),
      ],
    );
  }
}