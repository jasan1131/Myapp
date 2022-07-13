import 'package:flutter/material.dart';

class DeliveryStatus extends StatefulWidget {
  const DeliveryStatus({ Key? key }) : super(key: key);

  @override
  State<DeliveryStatus> createState() => _DeliveryStatusState();
}

class _DeliveryStatusState extends State<DeliveryStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('DeliveryStatus'),
    );
  }
}