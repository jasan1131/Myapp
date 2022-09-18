import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/states/admin.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class ShowOrderAdmin extends StatefulWidget {
  const ShowOrderAdmin({Key? key}) : super(key: key);

  @override
  State<ShowOrderAdmin> createState() => _ShowOrderAdminState();
}

class _ShowOrderAdminState extends State<ShowOrderAdmin> {
  bool statusOrder = true;
  bool? haveData;
  List<OrderModel> orderModels = [];
  List<List<String>> listOrderProducts = [];
  List<List<String>> listOrderPrices = [];
  List<List<String>> listOrderAmunts = [];
  List<List<String>> listOrderSums = [];
  List<int> totalProductTnts = [];
  String? idSeller;
  String? id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findIdSellerAndReadOrder();
  }

  Future<Null> findIdSellerAndReadOrder() async {
    String path =
        '${MyConstant.domain}/shopping/getOrderWhereStatusAwaitOrder.php';
    await Dio().get(path).then((value) {
      if (value.toString() == 'null') {
        setState(() {
          statusOrder = false;
          haveData = false;
        });
      } else {
        for (var item in json.decode(value.data)) {
          OrderModel model = OrderModel.fromMap(item);
          // print('id = ${model.id}');
          List<String> orderProducts = changeArrey(model.nameProduct!);
          List<String> orderPrices = changeArrey(model.priceProduct!);
          List<String> orderAmounts = changeArrey(model.amount!);
          List<String> orderSums = changeArrey(model.sum!);
          int total = int.parse(model.transport!);
          for (var string in orderSums) {
            total = total + int.parse(string.trim());
            // total = transport + total;
          }

          setState(() {
            statusOrder = false;
            haveData = true;
            orderModels.add(model);
            listOrderProducts.add(orderProducts);
            listOrderPrices.add(orderPrices);
            listOrderAmunts.add(orderAmounts);
            listOrderSums.add(orderSums);
            totalProductTnts.add(total);
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
                              title: ' ${orderModels[index].nameBuyer!}',
                              textStyle: MyConstant().h2Style(),
                            ),
                            Row(
                              children: [
                                ShowTitle(title: 'วันเวลา : ${orderModels[index].dateOrder!} / ${orderModels[index].timeOrder!}'),
                              ],
                            ),
                            ShowTitle(
                              title: 'ค่าจัดส่ง : ${orderModels[index].transport!}',
                              textStyle: MyConstant().h2Style(),
                            ),
                            buildTitle(),
                            bildListViewOrder(index),
                            buildShowTotal(index),
                            buildButton(index),
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

  Widget buildShowTotal(int index) => Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShowTitle(
                title: 'ยอดรวมสินค้า : ',
                textStyle: MyConstant().h2Style(),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShowTitle(
                  title: totalProductTnts[index].toString(),
                  textStyle: MyConstant().h2Style(),
                )
              ],
            ),
          ),
        ],
      );

  Row buildButton(index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: MyConstant.dark, width: 145),
                ),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.cancel_outlined,
                  color: Colors.red.shade700,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShowTitle(
                    title: 'ยกเลิกสินค้า',
                    textStyle: MyConstant().h3WhiteStyle(),
                  ),
                ),
              ],
            )),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: MyConstant.dark, width: 145),
              ),
            ),
          ),
          onPressed: () async {
            confirmOrder(index);
          },
          child: Row(
            children: [
              Icon(
                Icons.radio_button_off,
                color: Colors.green.shade400,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShowTitle(
                  title: 'ยืนยันสินค้า',
                  textStyle: MyConstant().h3WhiteStyle(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future confirmOrder(index) async {
    id = orderModels[index].id;
    String status = 'sellerConfirmOrder';
    String url =
        '${MyConstant.domain}/shopping/editStatusWhereId.php?isAdd=true&id=$id&status=$status';
    await Dio().get(url).then((value) {
      MyDialog().normalDialogOrderOk(context, 'รับคำสั่งซื้อเรียบร้อยแล้ว');
    });
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
