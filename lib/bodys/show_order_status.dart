import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:steps_indicator/steps_indicator.dart';

class ShowOrderStatus extends StatefulWidget {
  const ShowOrderStatus({Key? key}) : super(key: key);

  @override
  State<ShowOrderStatus> createState() => _ShowOrderStatusState();
}

class _ShowOrderStatusState extends State<ShowOrderStatus> {
  String? idBuyer;
  bool statusOrder = true;
  List<OrderModel> orderModels = [];
  List<List<String>> listOrderProducts = [];
  List<List<String>> listOrderPrices = [];
  List<List<String>> listOrderAmunts = [];
  List<List<String>> listOrderSums = [];
  List<int> totalProductTnts = [];
  List<int> statusInts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findBuyer();
  }

  Center buildNonOrder() => Center(child: Text('ไม่มีข้อมูลการสั่งวื้อ'));

  Future<Null> findBuyer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idBuyer = preferences.getString('id');
    print('idBuyer = $idBuyer');
    readOrderFromIdBuyer();
  }

  Future<Null> readOrderFromIdBuyer() async {
    if (idBuyer != null) {
      String url =
          '${MyConstant.domain}/shopping/getOrderWhereUser.php?isAdd=true&idBuyer=$idBuyer';

      Response response = await Dio().get(url);
      // print('response = $response');
      if (response.toString() != 'null') {
        var result = json.decode(response.data);
        for (var map in result) {
          OrderModel model = OrderModel.fromJson(map);
          List<String> orderProducts = changeArrey(model.nameProduct!);
          List<String> orderPrices = changeArrey(model.priceProduct!);
          List<String> orderAmounts = changeArrey(model.amount!);
          List<String> orderSums = changeArrey(model.sum!);
          // print('orderProducts = $orderProducts');

          int status = 0;
          switch (model.status) {
            case 'awaitOrder': 
              status = 0;
              break;
              case 'sellerConfirmOrder':
              status = 1;
              break;
              case 'riderConfirmOrder':
              status = 2;
              break;
              case 'Finish':
              status = 3;
              break;
            default:
          }

          int total = int.parse(model.transport!);
          for (var string in orderSums) {
            total = total + int.parse(string.trim());
            // total = transport + total;
          }
          print('total = $total');

          setState(() {
            statusOrder = false;
            orderModels.add(model);

            listOrderProducts.add(orderProducts);
            listOrderPrices.add(orderPrices);
            listOrderAmunts.add(orderAmounts);
            listOrderSums.add(orderSums);
            totalProductTnts.add(total);
            statusInts.add(status);
            print('orderProducts = $orderProducts');
          });
        }
      }
    }
  }

  List<String> changeArrey(String string) {
    List<String> list = [];
    String myString = string.substring(1, string.length - 1);
    print('myString = $myString');
    list = myString.split(',');
    int index = 0;
    for (var string in list) {
      list[index] = string.trim();
      index++;
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: statusOrder ? buildNonOrder() : buildContent(),
    );
  }

  Widget buildContent() => ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: orderModels.length,
        itemBuilder: (context, index) => Column(
          children: [
            MyConstant().mySizeBox(),
            buildShop(index),
            buildDateOrder(index),
            buildTimeOrder(index),
            buildDistance(index),
            buildTransport(index),
            buildHead(),
            buildListViewOrderProduct(index),
            buildShowTotal(index),
            MyConstant().mySizeBox(),
            buildStepIndicator(statusInts[index]),
            MyConstant().mySizeBox(),
          ],
        ),
      );

  Widget buildStepIndicator(int index) {
    return Column(
      children: [
        StepsIndicator(
          lineLength: 90,
          selectedStep: index,
          nbSteps: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShowTitle(
              title: 'สินค้าที่สั่ง',
              textStyle: MyConstant().h4Style(),
            ),
            ShowTitle(
              title: 'จัดเตรียมสินค้า',
              textStyle: MyConstant().h4Style(),
            ),
            ShowTitle(
              title: 'สถานะการจัดส่ง',
              textStyle: MyConstant().h4Style(),
            ),
            ShowTitle(
              title: 'ยืนยันสินค้า',
              textStyle: MyConstant().h4Style(),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildShowTotal(int index) => Row(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('ยอดรวมสินค้า :'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(totalProductTnts[index].toString()),
              ],
            ),
          ),
        ],
      );

  ListView buildListViewOrderProduct(int index) => ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: listOrderProducts[index].length,
        itemBuilder: (context, index2) => Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(listOrderProducts[index][index2]),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text(listOrderPrices[index][index2])),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(listOrderAmunts[index][index2]),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(listOrderSums[index][index2]),
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildHead() {
    return Container(
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(color: MyConstant.light),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ShowTitle(
              title: 'รายการสินค้า',
              textStyle: MyConstant().h3BlackStyle(),
            ),
          ),
          Expanded(
            flex: 1,
            child: ShowTitle(
              title: 'ราคา',
              textStyle: MyConstant().h3BlackStyle(),
            ),
          ),
          Expanded(
            flex: 1,
            child: ShowTitle(
              title: 'จำนวน',
              textStyle: MyConstant().h3BlackStyle(),
            ),
          ),
          Expanded(
            flex: 1,
            child: ShowTitle(
              title: 'ผลรวม',
              textStyle: MyConstant().h3BlackStyle(),
            ),
          ),
        ],
      ),
    );
  }

  Row buildTransport(int index) {
    return Row(
      children: [
        Text('ค่าจัดส่ง : ${orderModels[index].transport!} บาท'),
      ],
    );
  }

  Row buildDistance(int index) {
    return Row(
      children: [
        Text('ระยะทาง : ${orderModels[index].distance!} กิโลเมตร'),
      ],
    );
  }

  Row buildTimeOrder(int index) {
    return Row(
      children: [
        Text('เวลาที่สั่งซื้อ : ${orderModels[index].timeOrder!}'),
      ],
    );
  }

  Row buildDateOrder(int index) {
    return Row(
      children: [
        Text('วันที่สั่งซื้อ : ${orderModels[index].dateOrder!}'),
      ],
    );
  }

  Row buildShop(int index) {
    return Row(
      children: [
        Text('ร้าน : ${orderModels[index].nameSeller!}'),
      ],
    );
  }
}
