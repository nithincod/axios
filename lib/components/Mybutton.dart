import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.ontap, required this.text});

  final void Function () ? ontap;
  final String text;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 70,
        width: 200,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 21, 45, 179),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.white
            ),),
          ),
        ),
      ),
    );
  }
}