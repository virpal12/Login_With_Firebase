
import 'package:firebase/Pages/Login.dart';
import 'package:firebase/Pages/Welcom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/Custom.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Checkuser()async{
   final user = FirebaseAuth.instance.currentUser;

    if(user!= null){
      return Welcome();
    }else{
      return Login_page();
    }

  }
}
