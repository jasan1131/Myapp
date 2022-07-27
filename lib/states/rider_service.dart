import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/bodys/show_order_rider.dart';
import 'package:flutter_myappication_1/bodys/show_order_shipped.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_signout.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiderService extends StatefulWidget {
  const RiderService({Key? key}) : super(key: key);

  @override
  State<RiderService> createState() => _RiderServiceState();
}

class _RiderServiceState extends State<RiderService> {
  List<Widget> widgets = [];
  int indexWidget = 0;
  UserModel? userModel;
  OrderModel? orderModel;

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
    // print('### id Logined ==> $id');

    if (id != null && id.isNotEmpty) {
      String url =
          '${MyConstant.domain}/shopping/editTokenWhereId.php?isAdd=true&id=$id&token=$token';
      await Dio()
          .get(url)
          .then((value) => print('#### Update Token Success ####'));
    }

    String apiGetUserWhereId =
        '${MyConstant.domain}/shopping/getUserWhereId.php?isAdd=true&id=$id';
    await Dio().get(apiGetUserWhereId).then((value) {
      // print('### value ==> $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
          // print('### Name Logined ==> ${userModel!.name}');

          setState(() {
            userModel = UserModel.fromMap(item);
            // widgets.add(ShopManageAdmin(userModel: userModel!));
            widgets.add(ShowOrderRider());
            widgets.add(ShowOrderShipped());
            // widgets.add();
            // widgets.add();
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        centerTitle: true,
        title: Text('rider'),
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
                      showOrderRider(),
                      showOrderShipped()
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
      // otherAccountsPictures: [
      //   IconButton(
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => ,
      //         ),
      //       );
      //     },
      //     icon: Padding(
      //       padding: const EdgeInsets.only(right: 16),
      //       child: Icon(Icons.home),
      //     ),
      //     iconSize: 36,
      //     color: MyConstant.light,
      //   )
      // ],
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

  ListTile showOrderRider() {
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
        title: 'รายการสินค้าที่ลูกค้าสั่ง',
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: ShowTitle(
          title: 'แสดงรายละเอียดของสินค้าทีลูกค้าสั่ง',
          textStyle: MyConstant().h3Style()),
    );
  }

  ListTile showOrderShipped() {
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
        title: 'รายการสินค้าที่ลูกค้าสั่ง',
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: ShowTitle(
          title: 'แสดงรายละเอียดของสินค้าทีลูกค้าสั่ง',
          textStyle: MyConstant().h3Style()),
    );
  }

  Future<void> backgroundHandler(RemoteMessage message) async {
    print(message.data.toString());
    print(message.notification!.title);
  }

  void backgroundMessage() async {
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

        MyDialog().normalDialog(context, messageBody!, messageTitle!);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.notification != null) {
        String? messageBody = message.notification!.body;
        String? messageTitle = message.notification!.title;

        MyDialog().normalDialog(context, messageBody!, messageTitle!);
      }
    });
  }
}
