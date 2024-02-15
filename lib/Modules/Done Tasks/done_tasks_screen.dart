import 'package:flutter/material.dart';

class DoneTasksScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Center(
      child: Text(
        'Done',
        style: TextStyle
          (
          fontSize: 45.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}