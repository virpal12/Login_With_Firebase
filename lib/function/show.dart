import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class fatching extends StatefulWidget {
  @override
  State<fatching> createState() => _fatchingState();
}

class _fatchingState extends State<fatching> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("produc").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print("object");
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text("${index + 1}"),
                  ),
                  title: Text("${snapshot.data!.docs[index].data()['name']}"),
                  subtitle:
                      Text("${snapshot.data!.docs[index].data()['email']}"),
                ),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
