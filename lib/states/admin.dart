import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/bodys/show_check_stock_product.dart';
import 'package:flutter_myappication_1/bodys/show_product_specail_admin.dart';
import 'package:flutter_myappication_1/bodys/show_order_admin.dart';
import 'package:flutter_myappication_1/bodys/show_product_whol_sale_admin.dart';
import 'package:flutter_myappication_1/bodys/show_productadmin.dart';
import 'package:flutter_myappication_1/bodys/show_shop_manage_admin.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_signout.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminServer extends StatefulWidget {
  const AdminServer({Key? key}) : super(key: key);

  @override
  State<AdminServer> createState() => _AdminServerState();
}

class _AdminServerState extends State<AdminServer> {
  List<Widget> widgets = [];
  int indexWidget = 0;
  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUserModel();
    aboutNotification();
  }

  Future<Null> findUserModel() async {
    await Firebase.initializeApp();
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? token = await firebaseMessaging.getToken();
    print('token ==>> $token');

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('id')!;
    print('### id Logined ==> $id');
    String apiGetUserWhereId =
        '${MyConstant.domain}/shopping/getUserWhereId.php?isAdd=true&id=$id';
    await Dio().get(apiGetUserWhereId).then((value) {
      print('### value ==> $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
          print('### Name Logined ==> ${userModel!.name}');

          setState(() {
            userModel = UserModel.fromMap(item);
            // widgets.add(ShopManageAdmin(userModel: userModel!));
            widgets.add(ShowOrderAdmin());
            widgets.add(ShowProductAdmin());
            widgets.add(ShowProductSpecailAdmin());
            widgets.add(ShowProductWholeSaleAdmin());
            widgets.add(CheckStockProduct());
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      drawer: widgets.length == 0
          ? SizedBox()
          : Drawer(
              child: Stack(
                children: [
                  ShowSignOut(),
                  Column(
                    children: [
                      buildHead(),
                      // showShopManage(),
                      menuShowOrder(),
                      menuProduct(),
                      menuProductSpecail(),
                      menuProductWholeSale(),
                      menuCheckStockProduct(),
                    ],
                  ),
                ],
              ),
            ),
      body: widgets.length == 0 ? ShowProgress() : widgets[indexWidget],
    );
  }

  Widget buildHead() {
    return UserAccountsDrawerHeader(
      otherAccountsPictures: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopManageAdmin(userModel: userModel!),
              ),
            );
          },
          icon: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.home),
          ),
          iconSize: 36,
          color: MyConstant.light,
        )
      ],
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [MyConstant.light, MyConstant.dark],
          center: Alignment(-0.6, -0.2),
          radius: 1,
        ),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage:
            NetworkImage('${MyConstant.domain}${userModel!.avatar}'),
      ),
      accountName: Text(userModel == null ? 'Nmae' : userModel!.name),
      accountEmail: Text(userModel == null ? 'Type ?' : userModel!.type),
    );
  }

  // ListTile showShopManage() {
  //   return ListTile(
  //     onTap: () {
  //       setState(() {
  //         indexWidget = 0;
  //         Navigator.pop(context);
  //       });
  //     },
  //     leading: Icon(
  //       Icons.home_outlined,
  //     ),
  //     title: ShowTitle(
  //       title: '????????????????????????',
  //       textStyle: MyConstant().h2Style(),
  //     ),
  //     subtitle: ShowTitle(
  //         title: '???????????????????????????????????????????????????????????????????????????',
  //         textStyle: MyConstant().h3Style()),
  //   );
  // }

  ListTile menuShowOrder() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 0;
          Navigator.pop(context);
        });
      },
      leading: Icon(
        Icons.filter_1_outlined,
      ),
      title: ShowTitle(
        title: '???????????????????????????????????????????????????????????????????????????',
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: ShowTitle(
          title: '?????????????????????????????????????????????????????????????????????????????????????????????????????????',
          textStyle: MyConstant().h3Style()),
    );
  }

  ListTile menuProduct() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 1;
          Navigator.pop(context);
        });
      },
      leading: Icon(
        Icons.filter_2_outlined,
      ),
      title: ShowTitle(
        title: '????????????????????????????????????',
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: ShowTitle(
          title: '???????????????????????????????????????????????????????????????????????????????????????',
          textStyle: MyConstant().h3Style()),
    );
  }

  ListTile menuProductSpecail() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 2;
          Navigator.pop(context);
        });
      },
      leading: Icon(
        Icons.filter_3_outlined,
      ),
      title: ShowTitle(
        title: '???????????????????????????????????????????????????????????????',
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: ShowTitle(
          title: '????????????????????????????????????????????????????????????????????????????????????????????????',
          textStyle: MyConstant().h3Style()),
    );
  }

  ListTile menuProductWholeSale() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 3;
          Navigator.pop(context);
        });
      },
      leading: Icon(
        Icons.filter_4_outlined,
      ),
      title: ShowTitle(
        title: '?????????????????????????????????????????????????????????',
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: ShowTitle(
          title: '??????????????????????????????????????????????????????????????????????????????????????????',
          textStyle: MyConstant().h3Style()),
    );
  }

  ListTile menuCheckStockProduct() {
    return ListTile(
      onTap: () {
        setState(() {
          indexWidget = 4;
          Navigator.pop(context);
        });
      },
      leading: Icon(
        Icons.filter_5_outlined,
      ),
      title: ShowTitle(
        title: '?????????????????????????????????',
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: ShowTitle(
          title: '????????????????????????????????????????????????????????????????????????????????????',
          textStyle: MyConstant().h3Style()),
    );
  }

  Future<void> backgroundHandler(RemoteMessage message)async{
    print(message.data.toString());
    print(message.notification!.title);
  }
  void backgroundMessage()async{
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  }

  Future<Null> aboutNotification() async {
    await await Firebase.initializeApp();
    
    FirebaseMessaging.instance.getInitialMessage();


    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        String? messageBody = message.notification!.body;
        String? messageTitle = message.notification!.title;
        // print(message.notification!.body);
        // print(message.notification!.title);
        MyDialog().normalDialog(context, messageBody!, messageTitle!);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {});
  }
}
