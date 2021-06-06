import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.message),
                  color: Colors.red,
              ),
              Text('メッセージ'),
            ],
          ),
        ),
      ),
    );
  }
}