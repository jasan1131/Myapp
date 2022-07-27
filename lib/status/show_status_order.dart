import 'package:flutter/material.dart';

class ShowStatusOrder extends StatefulWidget {
  const ShowStatusOrder({ Key? key }) : super(key: key);

  @override
  State<ShowStatusOrder> createState() => _ShowStatusOrderState();
}

class _ShowStatusOrderState extends State<ShowStatusOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Show Status Order'),
    );
  }
}