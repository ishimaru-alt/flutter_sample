import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/main.dart';
import 'package:flutter_application/pages/mypage.dart';

import 'add.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // ここ大事！
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget{
  Login createState()=> Login();
}

class Login extends State<LoginPage>{
  // 入力されたメールアドレス
  String email = "";
  // 入力されたパスワード
  String password = "";
  // 登録・ログインに関する情報を表示
  String infoText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login',
              style: TextStyle(color:Colors.black),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10.0,right: 10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                // 入力数
                maxLength: 102,
                decoration: InputDecoration(
                  labelText: 'Email',
                  ),
                onChanged: (String value){
                  setState((){
                    email = value;
                  });
                },
              ),
              TextField(
                //パスワードの場合
                obscureText: true,
                // 入力数
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: 'Password' ,
                  ),
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  try{
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final result = await auth.signInWithEmailAndPassword(
                      email: email, 
                      password: password,
                    );
                    await Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyApp(),
                      ),
                    );
                  } catch(e) {
                    setState((){
                    infoText = 'ログインに失敗しました';
                    });
                  }
                },
                child:
                  Text('Login'),
              ),
              const SizedBox(height:8),
              Text(infoText),
              IconButton(onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
               icon: Icon(Icons.logout),
              )
            ],
          ),
        ),
      ),
    );
  }
}