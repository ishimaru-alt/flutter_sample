import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // ここ大事！
  runApp(SignInPage());
}

class SignInPage extends StatefulWidget{
  SignIn createState()=> SignIn();
}

class SignIn extends State<SignInPage>{
  // 入力されたメールアドレス
  String newUserEmail = "";
  // 入力されたパスワード
  String newUserPassword = "";
  // 登録・ログインに関する情報を表示
  String infoText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sign in',
              style: TextStyle(color:Colors.black),
        ),
      ),
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
                    newUserEmail = value;
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
                    newUserPassword = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  try{
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final result = await auth.createUserWithEmailAndPassword(email: newUserEmail, password: newUserPassword);
                  } catch(e) {
                    setState((){
                    infoText = '登録に失敗しました：${e.toString()}';
                    });
                  }
                },
                child:
                  Text('Signin'),
              ),
              const SizedBox(height:8),
              Text(infoText),
              ElevatedButton(
                onPressed: (){
                },
                child: Text('Sign in Google')
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage(),
                    )
                  );
                },
                child: Text('ログイン画面へ')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
