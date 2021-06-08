import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // ここ大事！
  runApp(HomePage());
}

class HomePage extends StatefulWidget{
  Home createState()=> Home();
}


class Home extends State<HomePage>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Lottie.asset('assets/scooter-with-side-car.json'),
            ],
          ),
        ),
      ),
    );
  }
}