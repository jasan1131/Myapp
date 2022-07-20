import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class NavigatorCFW extends StatefulWidget {
  const NavigatorCFW({Key? key}) : super(key: key);

  @override
  State<NavigatorCFW> createState() => _NavigatorCFWState();
}

class _NavigatorCFWState extends State<NavigatorCFW> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 95,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, MyConstant.rounteConfirmAddWallet),
        child: Card(
          color: MyConstant.dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          child: Center(
            child: ShowTitle(
              title: 'AddBill',
              textStyle: MyConstant().h3WhiteStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
