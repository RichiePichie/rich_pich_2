import 'package:flutter/material.dart';
import 'package:rich_pich_2/widgets/custom_cooumn.dart';

class Regiser2 extends StatefulWidget {
  const Regiser2({super.key});

  @override
  State<Regiser2> createState() => _Regiser2State();
}

class _Regiser2State extends State<Regiser2> {
  int _selectedIndex = -1; // -1 means nothing is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'I am a',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
            ),
            SizedBox(height: 40),
            Column(
              children: [
                CustomColumn(
                  text: 'Beginner',
                  numberOfYears: 1,
                  isSelected: _selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0; // Set selected index to 0
                    });
                  },
                ),
                CustomColumn(
                  text: 'Intermediate',
                  numberOfYears: 3,
                  isSelected: _selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1; // Set selected index to 1
                    });
                  },
                ),
                CustomColumn(
                  text: 'Advanced',
                  numberOfYears: 5,
                  isSelected: _selectedIndex == 2,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2; // Set selected index to 2
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
