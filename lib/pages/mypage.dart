import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ),
              TextField(
                //パスワードの場合
                obscureText: true,
                // 入力数
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: 'Password' ,
                  ),
              ),
              ElevatedButton(
                onPressed: (){},
                child: 
                  Text('Login')
              ),
              ElevatedButton(
                onPressed: (){
                },
                child: Text('Sign in Google')
              ),
            ],
          ),
        ),
      ),
    );
  }
}