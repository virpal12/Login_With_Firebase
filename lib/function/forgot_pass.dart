

import 'package:firebase/Pages/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/Custom.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController Email = TextEditingController();

  Forgot(String Email)async{

    if(Email== null){
      return Costum.CostumAlert(context, 'Enter mail');
    }
   else{
     FirebaseAuth.instance.sendPasswordResetEmail(email: Email);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Forgot Password'),),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Costum.field('Enter your mail', Icon(Icons.mail), Email),
            SizedBox(height: 50,),

            ElevatedButton(onPressed: (){
             Forgot(Email.text.toString());
             Navigator.pop(context);
            }, child: Text('Reset Password', style: TextStyle(fontSize: 25),),
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
