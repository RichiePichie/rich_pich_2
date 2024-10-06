import 'package:flutter/material.dart';
import 'package:rich_pich_2/widgets/custom_cooumn.dart';

class Regiser3 extends StatefulWidget {
  const Regiser3({super.key});

  @override
  State<Regiser3> createState() => _Regiser3State();
}

class _Regiser3State extends State<Regiser3> {
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text('Choose One Goal that Fits You Best',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          CustomColumn(
              text: 'Weight loss',
              isSelected: false,
              onTap: () {
                setState(() {
                  _selectedIndex = 0; // Set selected index to 0
                });
              }),
          CustomColumn(
              text: 'Weight loss',
              isSelected: false,
              onTap: () {
                setState(() {
                  _selectedIndex = 1; // Set selected index to 0
                });
              }),
          CustomColumn(
              text: 'Weight loss',
              isSelected: false,
              onTap: () {
                setState(() {
                  _selectedIndex = 2; // Set selected index to 0
                });
              }),
          CustomColumn(
              text: 'Weight loss',
              isSelected: false,
              onTap: () {
                setState(() {
                  _selectedIndex = 3; // Set selected index to 0
                });
              }),
          CustomColumn(
              text: 'Weight loss',
              isSelected: false,
              onTap: () {
                setState(() {
                  _selectedIndex = 4; // Set selected index to 0
                });
              }),
          CustomColumn(
              text: 'Weight loss',
              isSelected: false,
              onTap: () {
                setState(() {
                  _selectedIndex = 5; // Set selected index to 0
                });
              }),
          CustomColumn(
              text: 'Weight loss',
              isSelected: false,
              onTap: () {
                setState(() {
                  _selectedIndex = 6; // Set selected index to 0
                });
              }),
          CustomColumn(
              text: 'Weight loss',
              isSelected: false,
              onTap: () {
                setState(() {
                  _selectedIndex = 7; // Set selected index to 0
                });
              }),
        ],
      ),
    ));
  }
}
