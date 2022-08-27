import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/status/show_status_await_order.dart';
import 'package:flutter_myappication_1/status/show_status_finish.dart';
import 'package:flutter_myappication_1/status/show_status_rider_order.dart';
import 'package:flutter_myappication_1/status/show_status_seller_order.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';

class ShowStatusBuyerRiderOrder extends StatefulWidget {
  final OrderModel orderModel;
  const ShowStatusBuyerRiderOrder({ Key? key, required this.orderModel }) : super(key: key);

  @override
  State<ShowStatusBuyerRiderOrder> createState() => _ShowStatusBuyerRiderOrderState();
}

class _ShowStatusBuyerRiderOrderState extends State<ShowStatusBuyerRiderOrder> {
  OrderModel? orderModel;
  List<Widget> listWidget = [];
  int indexPage = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderModel = widget.orderModel;
    listWidget.add(ShowStatusAwaitOrder(orderModel: orderModel!));
    listWidget.add(ShowStatusSellerOrder(orderModel: orderModel!));
    listWidget.add(ShowStatusRiderOrder(orderModel: orderModel!));
    listWidget.add(ShowStatusFinish(orderModel: orderModel!));
  }

  BottomNavigationBarItem showStatusAwaitOrder() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.inventory_sharp),
      label: 'รายการสินค้าที่สั่ง',
    );
  }

  BottomNavigationBarItem showStatusSellerOrder() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.inventory_2_outlined),
      label: 'สินค้าที่ต้องจัดส่ง',
    );
  }

  BottomNavigationBarItem showStatusRiderOrder() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.local_shipping_outlined),
      label: 'สินค้าที่ต้องได้รับ',
    );
  }

  BottomNavigationBarItem showStatusFinish() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.check_circle_outline),
      label: 'ยันยันสินค้าที่ได้รับ',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget.length == 0 ? ShowProgress() : listWidget[indexPage],
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
        showStatusAwaitOrder(),
        showStatusSellerOrder(),
        showStatusRiderOrder(),
        showStatusFinish(),
      ],
    );
  }
}