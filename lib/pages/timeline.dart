import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershareapp/widgets/header.dart';
import 'package:fluttershareapp/widgets/progress.dart';

final usersRef = Firestore.instance.collection("users");

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<dynamic> users = [];

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  // getUsers() {
  //   usersRef.getDocuments().then((QuerySnapshot snapShot) {
  //     snapShot.documents.forEach((DocumentSnapshot doc) {
  //       print(doc.data);
  //     });
  //   });
  // }
  getUsers() async {
    final QuerySnapshot snapShot = await usersRef.getDocuments();
    setState(() {
      users = snapShot.documents;
    });
    // snapShot.documents.forEach((DocumentSnapshot doc) {
    //   print(doc.data);
    // });
  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: header(context, isAppTitle: true),
        body: StreamBuilder<QuerySnapshot>(
          stream: usersRef.snapshots(),
          builder: (context, snapShot) {
            if (!snapShot.hasData) {
              return circularProgress();
            }
            final List<Text> children = snapShot.data.documents
                .map((doc) => Text(doc["username"]))
                .toList();
            return Container(
              child: ListView(children: children),
            );
          },
        ));
  }
}
