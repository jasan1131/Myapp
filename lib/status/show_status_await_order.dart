import 'package:flutter/material.dart';

class ShowStatusAwaitOrder extends StatefulWidget {
  const ShowStatusAwaitOrder({Key? key}) : super(key: key);

  @override
  State<ShowStatusAwaitOrder> createState() => _ShowStatusAwaitOrderState();
}

class _ShowStatusAwaitOrderState extends State<ShowStatusAwaitOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Show Status Await Order'),
    );
  }
}
