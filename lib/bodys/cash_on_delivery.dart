import 'package:flutter/material.dart';

class CashOnDelivery extends StatefulWidget {
  const CashOnDelivery({ Key? key }) : super(key: key);

  @override
  State<CashOnDelivery> createState() => _CashOnDeliveryState();
}

class _CashOnDeliveryState extends State<CashOnDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is Cash on delivery'),
    );
  }
}