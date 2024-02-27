import 'package:flutter/material.dart';

class Costum {
  static field(String txt, Widget? Icon, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: txt,

        prefixIcon: Icon,
        border: UnderlineInputBorder(),
        filled: true,
        fillColor: Colors.deepPurple.shade100,
      ),
    );
  }

  static CostumAlert(BuildContext context, String text){
    return showDialog(
    context:context, builder : (BuildContext context){
      return AlertDialog( title: Text(text),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Ok'))
        ],
      );
    }
    );

  }
}
