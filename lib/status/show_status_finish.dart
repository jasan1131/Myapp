import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowStatusFinish extends StatefulWidget {
  final OrderModel orderModel;
  const ShowStatusFinish({Key? key, required this.orderModel})
      : super(key: key);

  @override
  State<ShowStatusFinish> createState() => _ShowStatusFinishState();
}

class _ShowStatusFinishState extends State<ShowStatusFinish> {
  OrderModel? orderModel;
  bool? haveData;
  bool statusOrder = true;
  List<OrderModel> orderModels = [];
  List<List<String>> listOrderProducts = [];
  List<List<String>> listOrderPrices = [];
  List<List<String>> listOrderAmunts = [];
  List<List<String>> listOrderSums = [];
  List<int> totalProductInts = [];
  List<int> statusInts = [];
  String? id;
  String? idBuyer;
  String? status;
  String? idSeller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderModel = widget.orderModel;
    findBuyer();
  }

  Center buildNonOrder() => Center(
        child: ShowTitle(
          title: 'ไม่มีข้อมูลการสั่งซื้อ',
          textStyle: MyConstant().h1Style(),
        ),
      );

  Future<Null> findBuyer() async {
    id = orderModel!.id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idBuyer = preferences.getString('id');
    status = 'FinishOrder';
    readOrderFromBuyer();
  }

  Future<Null> readOrderFromBuyer() async {
    if (status != null) {
      String pathURL =
          '${MyConstant.domain}/shopping/getOrderWhereUserStatus.php?isAdd=true&id=$id&idBuyer=$idBuyer&status=$status';

      await Dio().get(pathURL).then((value) {
        if (value.toString() == 'null') {
          setState(() {
            haveData = false;
            statusOrder = false;
          });
        } else {
          var result = json.decode(value.data);
          for (var item in result) {
            OrderModel model = OrderModel.fromMap(item);
            List<String> orderProduct = changeArrey(model.nameProduct!);
            List<String> orderPrice = changeArrey(model.priceProduct!);
            List<String> orderAmount = changeArrey(model.amount!);
            List<String> orderSum = changeArrey(model.sum!);

            int total = int.parse(model.transport!);
            for (var string in orderSum) {
              total = total + int.parse(string.trim());
            }
            setState(() {
              haveData = true;
              statusOrder = false;
              orderModels.add(model);

              listOrderProducts.add(orderProduct);
              listOrderPrices.add(orderPrice);
              listOrderAmunts.add(orderAmount);
              listOrderSums.add(orderSum);
              totalProductInts.add(total);
            });
          }
        }
      });
    }
  }

  List<String> changeArrey(String string) {
    List<String> list = [];
    String myString = string.substring(1, string.length - 1);
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyConstant.primary,
        title: Text('รายการสินค้าที่สั่ง'),
      ),
      body: statusOrder
          ? ShowProgress()
          : haveData!
              ? buildContent()
              : buildNonOrder(),
    );
  }

  Widget buildContent() => Container(
        decoration: MyConstant().gradientRadioBackground(),
        child: ListView.builder(
          itemCount: orderModels.length,
          itemBuilder: (context, index) => Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ShowTitle(
                            title: 'ส่งสินค้าเสร็จสิ้น',
                            textStyle: MyConstant().h2Stylebold(),
                          ),
                        ),
                      ],
                    ),
                    buildHead(index),
                    buildHeadTitle(),
                    buildListViewOrderProduct(index),
                    buildDivider(),
                    buildShowTotal(index),
                    buildDivider(),
                    MyConstant().mySizeBox()
                  ],
                ),
              ),
              MyConstant().mySizeBox(),
              buildShomStatusOrderByRider(index),
              MyConstant().mySizeBox(),
            ],
          ),
        ),
      );

  Divider buildDivider() {
    return Divider(
      color: MyConstant.dark,
    );
  }

  Widget buildShomStatusOrderByRider(index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyConstant.light)),
        onPressed: () {
          confirmOrder(index);
        },
        child: ShowTitle(
          title: 'ยืนยันการรับสินค้า',
          textStyle: MyConstant().h3BlackStyle(),
        ),
      ),
    );
  }

  Future confirmOrder(index) async {
    String? dateOrder = orderModels[index].dateOrder;
    String? timeOrder = orderModels[index].timeOrder;
    String? idBuyer = orderModels[index].idBuyer;
    String? nameBuyer = orderModels[index].nameBuyer;
    String? distance = orderModels[index].distance;
    String? transport = orderModels[index].transport;
    idSeller = orderModels[index].idSeller;
    String? nameSeller = orderModels[index].nameSeller;
    String? nameProduct = orderModels[index].nameProduct;
    String? priceProduct = orderModels[index].priceProduct;
    String? amount = orderModels[index].amount;
    String? sum = orderModels[index].sum;
    String? totals = totalProductInts[index].toString();

    String path =
        '${MyConstant.domain}/shopping/insertOrderHistory.php?isAdd=true&idSeller=$idSeller&nameSeller=$nameSeller&idBuyer=$idBuyer&nameBuyer=$nameBuyer&distance=$distance&transport=$transport&dateOrder=$dateOrder&timeOrder=$timeOrder&nameProduct=$nameProduct&priceProduct=$priceProduct&amount=$amount&sum=$sum&total=$totals';
    await Dio().get(path).then((value) => {
          if (value.toString() == 'true')
            {clearAllOrder(), confirmDialogDelete(orderModels[index])}
          else
            {
              MyDialog()
                  .normalDialog(context, 'ไม่สามารทำรายการได้', 'กรุณารองใหม่')
            }
        });
  }

  Future<Null> clearAllOrder() async {
    MyDialog().normalDialogNavigator(
      context,
      'ทำรายการเสร็จสิ้น',
      'ขอบคุณที่ใช้บริการ',
    );
  }

  Future<Null> confirmDialogDelete(OrderModel orderModel) async {
    String path =
        '${MyConstant.domain}/shopping/deleteOrderWhereId.php?isAdd=true&id=${orderModel.id}';
    await Dio()
        .get(path)
        .then((value) => {print('#### DeleteOrderFinish !!!!!!')});
  }

  Widget buildShowTotal(int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ShowTitle(
                  title: 'ยอดรวมสินค้า : ${totalProductInts[index].toString()} บาท',
                  textStyle: MyConstant().h3Style(),
                )
              ],
            ),
          ],
        ),
      );

  Widget buildHead(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ShowTitle(
                title: 'ชื่อร้าน : ',
                textStyle: MyConstant().h3Stylebold(),
              ),
              ShowTitle(
                title: '${orderModels[index].nameSeller}',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
          Row(
            children: [
              ShowTitle(
                title: 'วันที่สั่งซื้อ : ',
                textStyle: MyConstant().h3Stylebold(),
              ),
              ShowTitle(
                title: '${orderModels[index].dateOrder}',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
          Row(
            children: [
              ShowTitle(
                title: 'เวลาที่สั่งซื้อ : ',
                textStyle: MyConstant().h3Stylebold(),
              ),
              ShowTitle(
                title: '${orderModels[index].timeOrder}',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
          Row(
            children: [
              ShowTitle(
                title: 'ระยะทาง : ',
                textStyle: MyConstant().h3Stylebold(),
              ),
              ShowTitle(
                title: '${orderModels[index].distance} กิโลเมต',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
          Row(
            children: [
              ShowTitle(
                title: 'ค่าจัดส่ง : ',
                textStyle: MyConstant().h3Stylebold(),
              ),
              ShowTitle(
                title: '${orderModels[index].transport} บาท',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ],
      ),
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
