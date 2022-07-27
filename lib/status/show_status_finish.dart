import 'package:flutter/material.dart';

class ShowStatusFinish extends StatefulWidget {
  const ShowStatusFinish({Key? key}) : super(key: key);

  @override
  State<ShowStatusFinish> createState() => _ShowStatusFinishState();
}

class _ShowStatusFinishState extends State<ShowStatusFinish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Show Status Finish'),
    );
  }
}
