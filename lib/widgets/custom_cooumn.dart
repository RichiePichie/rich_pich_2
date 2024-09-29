import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {
  final String text;
  final int numberOfYears;
  final bool isSelected; // to track if this column is selected
  final VoidCallback onTap; // callback for handling tap

  const CustomColumn({
    super.key,
    required this.text,
    required this.numberOfYears,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap, // trigger the callback on tap
        child: Container(
          width: MediaQuery.of(context).size.width * 0.67,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.grey, // Highlight if selected
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$text - $numberOfYears years',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

