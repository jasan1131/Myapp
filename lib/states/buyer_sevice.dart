import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/bodys/show_menu_food.dart';
import 'package:flutter_myappication_1/bodys/show_order_history.dart';
import 'package:flutter_myappication_1/bodys/show_shop_seller.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_signout.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuyerService extends StatefulWidget {
  const BuyerService({Key? key}) : super(key: key);

  @override
  State<BuyerService> createState() => _BuyerServiceState();
}

class _BuyerServiceState extends State<BuyerService> {
  List<Widget> widgets = [
    ShowShopSeller(),
    ShowMenuFood(),
    ShowOrderHistory(),
  ];
  int indexWidget = 0;
  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUserLogin();
  }

  Future<void> findUserLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var idUserLogin = preferences.getString('id');

    var urlAPI =
        '${MyConstant.domain}/shopping/getUserWhereId.php?isAdd=true&id=$idUserLogin';
    await Dio().get(urlAPI).then((value) {
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
          print('### id login ==> ${userModel!.id}');
        });
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Buyer'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            Column(
              children: [
                buildHeard(),
                showShopSeller(),
                showMenuFood(),
                showorderHistory(),
              ],
            ),
            ShowSignOut(),
          ],
        ),
      ),
      body: widgets[indexWidget],
    );
  }

  ListTile showShopSeller() {
    return ListTile(
      leading: Icon(
        Icons.house_outlined,
        size: 35,
        color: MyConstant.dark,
      ),
      title: ShowTitle(
        title: 'ร้านขายสินค้า',
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: ShowTitle(title: 'แสดงร้านขายสินค้า'),
      onTap: () {
        setState(() {
          indexWidget = 0;
          Navigator.pop(context);
        });
      },
    );
  }

  ListTile showMenuFood() {
    return ListTile(
      leading: Icon(
        Icons.restaurant_menu_outlined,
        size: 35,
        color: MyConstant.dark,
      ),
      title: ShowTitle(
        title: 'เมนูอาหาร',
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: ShowTitle(title: 'แนะนำเมนูอาหาร และ วิธีทำอาหาร'),
      onTap: () {
        setState(() {
          indexWidget = 1;
          Navigator.pop(context);
        });
      },
    );
  }

  ListTile showorderHistory() {
    return ListTile(
      leading: Icon(
        Icons.history_outlined,
        size: 35,
        color: MyConstant.dark,
      ),
      title: ShowTitle(
        title: 'ประวัติการสั่งซื้อ',
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: ShowTitle(title: 'แสดงประวัติการสั่งซื้อ'),
      onTap: () {
        setState(() {
          indexWidget = 2;
          Navigator.pop(context);
        });
      },
    );
  }

  UserAccountsDrawerHeader buildHeard() => UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1,
            center: Alignment(-0.8, -0.2),
            colors: [Colors.white, MyConstant.dark],
          ),
        ),
        currentAccountPicture: userModel == null
            ? ShowImage(path: MyConstant.avatar)
            : userModel!.avatar.isEmpty
                ? ShowImage(path: MyConstant.avatar)
                : CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        '${MyConstant.domain}${userModel!.avatar}'),
                  ),
        accountName: ShowTitle(
          title: userModel == null ? '' : userModel!.name,
          textStyle: MyConstant().h2Style(),
        ),
        accountEmail: ShowTitle(
          title: userModel == null ? '' : userModel!.user,
          textStyle: MyConstant().h3Style(),
        ),
      );
}
