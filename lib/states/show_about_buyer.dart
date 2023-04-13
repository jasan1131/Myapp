import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/bodyadmin/show_profile_buyer.dart';
import 'package:flutter_myappication_1/bodyadmin/show_status_money.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';

class ShowAboutBuyer extends StatefulWidget {
  final OrderModel orderModel;
  const ShowAboutBuyer({Key? key, required this.orderModel}) : super(key: key);

  @override
  State<ShowAboutBuyer> createState() => _ShowAboutBuyerState();
}

class _ShowAboutBuyerState extends State<ShowAboutBuyer> {
  OrderModel? orderModel;
  UserModel? userModel;
  List<Widget> listWidgets = [];
  int indexPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderModel = widget.orderModel;
    listWidgets.add(ShowProfileBuyer(orderModel: orderModel!));
    listWidgets.add(ShowStatusMoney(orderModel: orderModel!));
  }

  BottomNavigationBarItem showProduct() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.info),
      label: 'ข้อมูลผู้ใช้ ',
    );
  }

  BottomNavigationBarItem showTypeProduct() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.receipt_long_outlined),
      label: 'สถานะการจ่ายเงิน',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidgets.length == 0 ? ShowProgress() : listWidgets[indexPage],
      bottomNavigationBar: showBottomNavigationBar(),
    );
  }

  Widget showBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyConstant.primary,
      unselectedFontSize: 12,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.black,
      currentIndex: indexPage,
      onTap: (value) {
        setState(() {
          indexPage = value;
        });
      },
      items: <BottomNavigationBarItem>[
        showProduct(),
        showTypeProduct(),
      ],
    );
  }
}
