import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';

class ShowProgress extends StatelessWidget {
  const ShowProgress({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: MyConstant.light,
      ),
    );
  }
}