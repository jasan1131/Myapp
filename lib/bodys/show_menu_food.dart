import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';

class ShowMenuFood extends StatefulWidget {
  const ShowMenuFood({Key? key}) : super(key: key);

  @override
  State<ShowMenuFood> createState() => _ShowMenuFoodState();
}

class _ShowMenuFoodState extends State<ShowMenuFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('menu food'),
    );
  }
}
