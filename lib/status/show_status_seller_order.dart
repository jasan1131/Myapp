import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowStatusSellerOrder extends StatefulWidget {
  final OrderModel orderModel;
  const ShowStatusSellerOrder({Key? key, required this.orderModel})
      : super(key: key);

  @override
  State<ShowStatusSellerOrder> createState() => _ShowStatusSellerOrderState();
}

class _ShowStatusSellerOrderState extends State<ShowStatusSellerOrder> {
  OrderModel? orderModel;
  String? idBuyer;
  String? id;
  String? status;
  bool? haveData;
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
    orderModel = widget.orderModel;
    findBuyer();
  }

  Center buildNonOrder() => Center(
          child: ShowTitle(
        title: 'ไม่มีข้อมูลการสั่งซื้อ',
        textStyle: MyConstant().h1Style(),
      ));

  Future<Null> findBuyer() async {
    id = orderModel!.id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idBuyer = preferences.getString('id');
    status = 'sellerConfirmOrder';
    print('id = $id, idBuyer = $idBuyer');
    readOrderFromIdBuyer();
  }

  Future<Null> readOrderFromIdBuyer() async {
    if (status != null) {
      String url =
          '${MyConstant.domain}/shopping/getOrderWhereUserStatus.php?isAdd=true&id=$id&idBuyer=$idBuyer&status=$status';

      await Dio().get(url).then((value) {
        if (value.toString() == 'null') {
          setState(() {
            haveData = false;
            statusOrder = false;
          });
        } else {
          for (var map in json.decode(value.data)) {
            OrderModel model = OrderModel.fromMap(map);
            List<String> orderProducts = changeArrey(model.nameProduct!);
            List<String> orderPrices = changeArrey(model.priceProduct!);
            List<String> orderAmounts = changeArrey(model.amount!);
            List<String> orderSums = changeArrey(model.sum!);
            // print('orderProducts = $orderProducts');

            int total = int.parse(model.transport!);
            for (var string in orderSums) {
              total = total + int.parse(string.trim());
              // total = transport + total;
            }
            // print('total = $total');

            setState(() {
              haveData = true;
              statusOrder = false;
              orderModels.add(model);

              listOrderProducts.add(orderProducts);
              listOrderPrices.add(orderPrices);
              listOrderAmunts.add(orderAmounts);
              listOrderSums.add(orderSums);
              totalProductTnts.add(total);
              // print('orderProducts = $orderProducts');
            });
          }
        }
      });
      // print('response = $response');
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ShowTitle(
                            title: 'จัดเตรียมสินค้า',
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
            ],
          ),
        ),
      );

  Divider buildDivider() {
    return Divider(
      color: MyConstant.dark,
    );
  }

  Widget buildShowTotal(int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ShowTitle(
                  title: 'ยอดรวมสินค้า : ${totalProductTnts[index].toString()} บาท',
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
