import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';

class ShowAboutAppcationBuyer extends StatefulWidget {
  const ShowAboutAppcationBuyer({Key? key}) : super(key: key);

  @override
  State<ShowAboutAppcationBuyer> createState() =>
      _ShowAboutAppcationBuyerState();
}

class _ShowAboutAppcationBuyerState extends State<ShowAboutAppcationBuyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        title: Text('ข้อมูลส่วนตัว'),
        centerTitle: true,
      ),
      body: Text('data'),
    );
  }
}
