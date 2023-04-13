import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/states/show_about_buyer.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:intl/intl.dart';

class ShowOrderAdmin extends StatefulWidget {
  const ShowOrderAdmin({Key? key}) : super(key: key);

  @override
  State<ShowOrderAdmin> createState() => _ShowOrderAdminState();
}

class _ShowOrderAdminState extends State<ShowOrderAdmin> {
  OrderModel? orderModel;
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
                  itemBuilder: (context, index) => Card(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildHead(index),
                        buildHeadTitle(),
                        buildListViewOrderProduct(index),
                        buildDivider(),
                        buildShowTotal(index),
                        buildDivider(),
                        buildButton(index),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShowTitle(
                          title: 'ไม่มีการสั่งซื้อ',
                          textStyle: MyConstant().h1Style()),
                      ShowTitle(
                          title: 'ไม่มีการสั่งสินค้าจากลูกค้า',
                          textStyle: MyConstant().h2Style()),
                    ],
                  ),
                ),
    );
  }

  Divider buildDivider() {
    return Divider(
      color: MyConstant.dark,
    );
  }

  Widget buildHead(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              ShowTitle(
                title: 'ชื่อผู้สั่ง : ',
                textStyle: MyConstant().h3Stylebold(),
              ),
              ShowTitle(
                title: '${orderModels[index].nameBuyer!}    ',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  ShowTitle(
                    title: 'วันที่สั่ง : ',
                    textStyle: MyConstant().h3Stylebold(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: ShowTitle(
                      title: '${orderModels[index].dateOrder!}',
                      textStyle: MyConstant().h3Style(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ShowTitle(
                    title: 'เวลาที่สั่ง : ',
                    textStyle: MyConstant().h3Stylebold(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: ShowTitle(
                      title: '${orderModels[index].timeOrder!}',
                      textStyle: MyConstant().h3Style(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              ShowTitle(
                title: 'ระยะทาง : ',
                textStyle: MyConstant().h3Stylebold(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: ShowTitle(
                  title: '${orderModels[index].distance!} กิโลเมตร',
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ],
          ),
          Row(
            children: [
              ShowTitle(
                title: 'ค่าจัดส่ง : ',
                textStyle: MyConstant().h3Stylebold(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: ShowTitle(
                  title: '${orderModels[index].transport!} บาท',
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildShowTotal(int index) {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShowTitle(
                title: 'ยอดรวมสินค้า : ',
                textStyle: MyConstant().h3Stylebold(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: ShowTitle(
                  title: myFormat.format(totalProductTnts[index]),
                  textStyle: MyConstant().h3Style(),
                ),
              ),
              ShowTitle(title: ' บาท')
            ],
          ),
        ],
      ),
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

  Row buildButton(index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(
                  color: MyConstant.dark,
                ),
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
                padding: const EdgeInsets.only(left: 8, bottom: 3),
                child: ShowTitle(
                  title: 'ยืนยันการรับสินค้า',
                  textStyle: MyConstant().h3WhiteStyle(),
                ),
              ),
            ],
          ),
        ),
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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ShowAboutBuyer(orderModel: orderModels[index]),
                ));
          },
          child: Row(
            children: [
              Icon(
                Icons.radio_button_off,
                color: Colors.green.shade400,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 3),
                child: ShowTitle(
                  title: 'ดูข้อมูลผู้สั่งซื้อ',
                  textStyle: MyConstant().h3WhiteStyle(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildHeadTitle() {
    return Container(
      decoration: BoxDecoration(color: MyConstant.light),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ShowTitle(
                title: 'รายชื่อสินค้า',
                textStyle: MyConstant().h3Stylebold(),
              ),
            ),
            Expanded(
              flex: 2,
              child: ShowTitle(
                title: 'จำนวน',
                textStyle: MyConstant().h3Stylebold(),
              ),
            ),
            Expanded(
              flex: 2,
              child: ShowTitle(
                title: 'ราคา/บาท',
                textStyle: MyConstant().h3Stylebold(),
              ),
            ),
            Expanded(
              flex: 0,
              child: ShowTitle(
                title: 'ราคารวม/บาท',
                textStyle: MyConstant().h3Stylebold(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListViewOrderProduct(int index) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: listOrderProducts[index].length,
        itemBuilder: (context, index2) => Row(
          children: [
            Expanded(
              flex: 3,
              child: ShowTitle(
                title: listOrderProducts[index][index2],
                textStyle: MyConstant().h3Style(),
              ),
            ),
            Expanded(
              flex: 2,
              child: ShowTitle(
                title: listOrderAmunts[index][index2],
                textStyle: MyConstant().h3Style(),
              ),
            ),
            Expanded(
              flex: 2,
              child: ShowTitle(
                title: listOrderPrices[index][index2],
                textStyle: MyConstant().h3Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: listOrderSums[index][index2],
                textStyle: MyConstant().h3Style(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
