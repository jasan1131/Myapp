import 'package:flutter/material.dart';

class ShowStatusRiderOrder extends StatefulWidget {
  const ShowStatusRiderOrder({Key? key}) : super(key: key);

  @override
  State<ShowStatusRiderOrder> createState() => _ShowStatusRiderOrderState();
}

class _ShowStatusRiderOrderState extends State<ShowStatusRiderOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Show Status Rider Order'),
    );
  }
}
