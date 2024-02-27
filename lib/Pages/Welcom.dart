

import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {

  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
         width:400, height: 400,
          color: Colors.deepPurple.shade300,
          child:Center(

            child: Text('Welcome',style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
          )

        ),
      ),
    );
  }
}
