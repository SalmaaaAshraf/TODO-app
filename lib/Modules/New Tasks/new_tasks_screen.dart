import 'package:flutter/material.dart';

class NewTasksScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Center(
      child: Text(
      'New Tasks',
      style: TextStyle
        (
        fontSize: 45.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    );
  }
}