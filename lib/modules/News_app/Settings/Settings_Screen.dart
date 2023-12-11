import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settingsScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Screen',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.green,
        ),
      ),
    );
  }

}