import 'package:flutter/material.dart';
import 'package:fluttershareapp/widgets/header.dart';
import 'package:fluttershareapp/widgets/progress.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(context) {
    return Scaffold(
        appBar: header(context, isAppTitle: true), body: linearProgress());
  }
}
