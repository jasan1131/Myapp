import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/status/show_status_await_order.dart';
import 'package:flutter_myappication_1/status/show_status_finish.dart';
import 'package:flutter_myappication_1/status/show_status_rider_order.dart';
import 'package:flutter_myappication_1/status/show_status_seller_order.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';

class ShowStatusBuyer extends StatefulWidget {
  final OrderModel orderModel;
  const ShowStatusBuyer({Key? key, required this.orderModel}) : super(key: key);

  @override
  State<ShowStatusBuyer> createState() => _ShowStatusBuyerState();
}

class _ShowStatusBuyerState extends State<ShowStatusBuyer> {
  OrderModel? orderModel;
  List<Widget> listWidget = [];
  int indexPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderModel = widget.orderModel;
    listWidget.add(ShowStatusAwaitOrder(orderModel: orderModel!));
    listWidget.add(ShowStatusSellerOrder(orderModel: orderModel!));
    listWidget.add(ShowStatusRiderOrder(orderModel: orderModel!,));
    listWidget.add(ShowStatusFinish());
  }

  BottomNavigationBarItem showStatusAwaitOrder() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.info_outline),
      label: 'เกี่ยวกับร้าน',
    );
  }

  BottomNavigationBarItem showStatusSellerOrder() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.info_outline),
      label: 'เกี่ยวกับร้าน',
    );
  }

  BottomNavigationBarItem showStatusRiderOrder() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.info_outline),
      label: 'เกี่ยวกับร้าน',
    );
  }

  BottomNavigationBarItem showStatusFinish() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.info_outline),
      label: 'เกี่ยวกับร้าน',
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
