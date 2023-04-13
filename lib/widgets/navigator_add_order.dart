import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/bodys/buyer_show_all_product.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/states/buyer_sevice.dart';
import 'package:flutter_myappication_1/states/buyer_show_shop_seller.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class NavigatorAddOrder extends StatefulWidget {
  const NavigatorAddOrder({Key? key}) : super(key: key);

  @override
  State<NavigatorAddOrder> createState() => _NavigatorAddOrderState();
}

class _NavigatorAddOrderState extends State<NavigatorAddOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BuyerService(),
            )),
        child: Card(
          color: MyConstant.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          child: Center(
            child: ShowTitle(
              title: 'หน้าแรก',
              textStyle: MyConstant().h3WhiteStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
