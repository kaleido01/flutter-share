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
    final doc = await usersRef.getDocuments();
    // .then((QuerySnapshot snapShot) {
    //   snapShot.documents.forEach((DocumentSnapshot doc) {
    //     print(doc.data);
    //   });
    // });
  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: header(context, isAppTitle: true), body: linearProgress());
  }
}
