import 'package:firebase/Pages/Welcom.dart';
import 'package:firebase/function/forgot_pass.dart';
import 'package:firebase/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/Custom.dart';
import 'SignUp.dart';

class Login_page extends StatefulWidget {

  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();

  login() async {
    if (Email == "" && Password == "") {
      return Costum.CostumAlert(context, 'fill required details');
    } else {
      UserCredential? userCredential;

      try {
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: Email.text, password: Password.text).then((value) =>
        Navigator.push(context, MaterialPageRoute(builder: (_)=>Welcome()))
        );
      } on FirebaseException catch (ex) {
        return Costum.CostumAlert(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Login Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Costum.field('Enter your mail', Icon(Icons.email_rounded), Email),
            SizedBox(
              height: 20,
            ),
            Costum.field('Enter your password', Icon(Icons.lock), Password),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                login();
              },
              child: Text(
                'Login',
                style: TextStyle(fontSize: 25),
              ),
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an Account ??',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => SignUp()));
                    },
                    child: Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ))
              ],
            ),

            SizedBox(height: 23,),

            TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ForgotPassword()));
                },
                child: Center(
                  child: Text(
                    'Forgot Password',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
