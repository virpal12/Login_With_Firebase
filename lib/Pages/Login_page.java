import 'package:flutter/material.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Login Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
