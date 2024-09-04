// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ToDo extends StatelessWidget {
  final Icon icon;
  final String name;
  const ToDo({super.key, required this.icon, required this.name});

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
              blurRadius: 7,
              offset: Offset(2, 3),
            ),
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                icon,
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  ToDoList(
                    color: Colors.red,
                    toDoListItemName: 'kys',
                  ),
                  ToDoList(
                    color: Colors.red,
                    toDoListItemName: 'kys',
                  ),
                  ToDoList(
                    color: Colors.red,
                    toDoListItemName: 'kys',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToDoList extends StatelessWidget {
  final Color color;
  final String toDoListItemName;

  const ToDoList(
      {super.key, required this.color, required this.toDoListItemName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 6,
          backgroundColor: color,
        ),
        const SizedBox(width: 10),
        Text(
          toDoListItemName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
