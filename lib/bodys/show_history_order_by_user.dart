import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class ShowHistoryByOrderByUser extends StatefulWidget {
  const ShowHistoryByOrderByUser({Key? key}) : super(key: key);

  @override
  State<ShowHistoryByOrderByUser> createState() =>
      _ShowHistoryByOrderByUserState();
}

class _ShowHistoryByOrderByUserState extends State<ShowHistoryByOrderByUser> {
  bool statusOrder = true;
  bool? haveData;
  List<OrderModel> orderModels = [];
  List<List<String>> listOrderProducts = [];
  List<List<String>> listOrderPrices = [];
  List<List<String>> listOrderAmunts = [];
  List<List<String>> listOrderSums = [];
  String? idSeller;
  String? id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findIdSellerAndReadOrder();
  }

  Future<Null> findIdSellerAndReadOrder() async {
    if (orderModels.length != 0) {
      orderModels.clear();
    }
    String path =
        '${MyConstant.domain}/shopping/getOrderWhereStatusSellerConfirmOrder.php';
    await Dio().get(path).then((value) {
      if (value.toString() == 'null') {
        setState(() {
          statusOrder = false;
          haveData = false;
        });
      } else {
        for (var item in json.decode(value.data)) {
          OrderModel model = OrderModel.fromJson(item);
          // print('id = ${model.id}');
          List<String> orderProducts = changeArrey(model.nameProduct!);
          List<String> orderPrices = changeArrey(model.priceProduct!);
          List<String> orderAmounts = changeArrey(model.amount!);
          List<String> orderSums = changeArrey(model.sum!);
          setState(() {
            statusOrder = false;
            haveData = true;
            orderModels.add(model);
            listOrderProducts.add(orderProducts);
            listOrderPrices.add(orderPrices);
            listOrderAmunts.add(orderAmounts);
            listOrderSums.add(orderSums);
          });
        }
      }
    });
  }

  List<String> changeArrey(String string) {
    List<String> list = [];
    String myString = string.substring(1, string.length - 1);
    // print('myString = $myString');
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
      body: statusOrder
          ? ShowProgress()
          : haveData!
              ? ListView.builder(
                  itemCount: orderModels.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShowTitle(
                              title: orderModels[index].nameBuyer!,
                              textStyle: MyConstant().h2Style(),
                            ),
                            Row(
                              children: [
                                ShowTitle(title: orderModels[index].dateOrder!),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: ShowTitle(
                                      title: orderModels[index].timeOrder!),
                                ),
                              ],
                            ),
                            buildTitle(),
                            bildListViewOrder(index),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShowTitle(
                          title: 'ไม่มีสินค้า',
                          textStyle: MyConstant().h1Style()),
                      ShowTitle(
                          title: 'ไม่มีการสั่งสินค้าจากลูกค้า',
                          textStyle: MyConstant().h2Style()),
                    ],
                  ),
                ),
    );
  }

  ListView bildListViewOrder(int index) {
    return ListView.builder(
      itemCount: listOrderProducts[index].length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (context, index2) => Row(
        children: [
          Expanded(
              flex: 3,
              child: ShowTitle(title: listOrderProducts[index][index2])),
          Expanded(
              flex: 1, child: ShowTitle(title: listOrderPrices[index][index2])),
          Expanded(
              flex: 1, child: ShowTitle(title: listOrderAmunts[index][index2])),
          Expanded(
              flex: 1, child: ShowTitle(title: listOrderSums[index][index2])),
        ],
      ),
    );
  }

  Container buildTitle() {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(color: MyConstant.light),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ShowTitle(title: 'ชื่อสินค้า'),
          ),
          Expanded(
            flex: 1,
            child: ShowTitle(title: 'จำนวน'),
          ),
          Expanded(
            flex: 1,
            child: ShowTitle(title: 'ราคา'),
          ),
          Expanded(
            flex: 1,
            child: ShowTitle(title: 'ราคารวม'),
          ),
        ],
      ),
    );
  }
}