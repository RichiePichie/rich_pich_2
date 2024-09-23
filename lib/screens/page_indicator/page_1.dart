// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(TextSpan(
            children: [
              TextSpan(
                  text: 'Rich Pich',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
            ],
          ))
        ],
      ),
    );
  }
}
