import 'package:flutter/material.dart';

class MYMoney extends StatefulWidget {
  const MYMoney({ Key? key }) : super(key: key);

  @override
  State<MYMoney> createState() => _MYMoneyState();
}

class _MYMoneyState extends State<MYMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('My Money'),
    );
  }
}