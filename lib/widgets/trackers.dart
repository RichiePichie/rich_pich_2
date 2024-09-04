// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Tracker extends StatelessWidget {
  final Icon icon;
  final String trackerName;
  const Tracker({super.key, required this.icon, required this.trackerName});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 182,
      width: 182,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: const Color.fromARGB(255, 110, 109, 108),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 3,
              offset: Offset(2, 3),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                icon,
                Text(
                  trackerName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '20/30',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CircleGrid()
          ],
        ),
      ),
    );
  }
}

class CircleGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(7, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CircleAvatar(radius: 6, backgroundColor: Colors.blue),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}
