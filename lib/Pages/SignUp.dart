

import 'package:firebase/Pages/Login.dart';
import 'package:firebase/Pages/Welcom.dart';
import 'package:firebase/main.dart';
import 'package:firebase/widgets/Custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Number = TextEditingController();
  TextEditingController Password= TextEditingController();

  Signup (String Email, String Password)async {
    if (Email == "" && Password == "") {
      Costum.CostumAlert(context, 'Enter Required Fields');
    }
    else{
      UserCredential ? userCredential;
      try {
        userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: Email, password: Password).then((value) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Welcome()));
        });
      }
      on FirebaseException catch (ex) {
        return Costum.CostumAlert(context, ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up PAGE'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Costum.field('Enter Your Name', Icon(Icons.account_box), Name),
            SizedBox(height: 8,),
            Costum.field('Enter Your E-mail', Icon(Icons.email), Email),
            SizedBox(height: 8,),

            Costum.field('Enter Your Number', Icon(Icons.numbers), Number),
            SizedBox(height: 8,),

            Costum.field('Enter Your Password', Icon(Icons.password), Password),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              Signup(Email.text.toString(), Password.text.toString());
            }, child: Text('Sign Up', style: TextStyle(fontSize: 25),),
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
            ),

            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Sign UP ??',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Login_page()));
                    },
                    child: Text(
                      'Log IN',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ))
              ],
            )

          ],
        ),
      ),
    );
  }
}
