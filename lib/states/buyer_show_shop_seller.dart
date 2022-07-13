import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/bodys/buyer_product_type.dart';
import 'package:flutter_myappication_1/bodys/buyer_show_about_seller.dart';
import 'package:flutter_myappication_1/bodys/buyer_showall_product.dart';
import 'package:flutter_myappication_1/bodys/buyer_special_product.dart';
import 'package:flutter_myappication_1/bodys/buyer_wholesale_product.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';

class BuyerShowShopSeller extends StatefulWidget {
  final UserModel userModel;
  const BuyerShowShopSeller({Key? key, required this.userModel})
      : super(key: key);

  @override
  State<BuyerShowShopSeller> createState() => _BuyerShowShopSellerState();
}

class _BuyerShowShopSellerState extends State<BuyerShowShopSeller> {
  UserModel? userModel;
  List<UserModel> userModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(userModel!.name),
            actions: [
              IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, MyConstant.rounteShowCart),
                  icon: Icon(Icons.shopping_cart_outlined))
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              isScrollable: true,
              tabs: [
                Tab(
                  icon: Icon(Icons.info_outline),
                  text: 'เกี่ยวกันร้าน',
                ),
                Tab(
                  icon: Icon(Icons.shop_outlined),
                  text: 'สินค้า',
                ),
                Tab(
                  icon: Icon(Icons.account_tree_outlined),
                  text: 'ประเภทสินค้า',
                ),
                Tab(
                  icon: Icon(Icons.sell_outlined),
                  text: 'สินค้าพิเศษ',
                ),
                Tab(
                  icon: Icon(Icons.workspace_premium_outlined),
                  text: 'สินค้าราคาส่ง',
                )
              ],
            ),
          ),
          body: TabBarView(
            
            children: [
              ShowAboutSeller(userModel: userModel!),
              BuyerShowAllProduct(),
              BuyerProductType(),
              BuyerSpecialProduct(),
              BuyerWholeSaleProduct(),
            ],
          ),
        ),
      );
}
