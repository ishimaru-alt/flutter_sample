import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/main.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // ここ大事！
  runApp(MyPage());
}

class MyPage extends StatefulWidget{
  SignInPage createState()=> SignInPage();
}

class SignInPage extends State<MyPage>{
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) { 
        if (user == null) {
          print('ログインしているユーザーはいません');
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => LoginPage(),
          ));
        } else {
          print('ログインしてるよ(≧◇≦)');
          print(user.email);
        }
      }
      );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10.0,right: 10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextButton(
                onPressed: (){},
                child:Text('ログイン'), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
