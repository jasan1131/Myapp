import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/bodyrider/show_confirm_order_by_rider.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class ShowOrderRider extends StatefulWidget {
  const ShowOrderRider({Key? key}) : super(key: key);

  @override
  State<ShowOrderRider> createState() => _ShowOrderRiderState();
}

class _ShowOrderRiderState extends State<ShowOrderRider> {
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
        '${MyConstant.domain}/shopping/getOrderWhereStatusSellerConfirmOrder.php';
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
              ? Container(
                  decoration: MyConstant().gradientRadioBackground(),
                  child: ListView.builder(
                    itemCount: orderModels.length,
                    itemBuilder: (context, index) => Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                buildNameBuyer(index),
                                buildDay(index),
                                buildTime(index),
                                buildTransport(index),
                                buildDistance(index),
                              ],
                            ),
                          ),
                          buildTitle(),
                          bildListViewOrder(index),
                          buildDivider(),
                          buildShowTotal(index),
                          buildDivider(),
                          buildButton(index),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(
                  decoration: MyConstant().gradientRadioBackground(),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShowTitle(
                            title: 'ไม่มีสินค้า',
                            textStyle: MyConstant().h1BackStyle()),
                        ShowTitle(
                            title: 'ไม่มีการสั่งสินค้าจากลูกค้า',
                            textStyle: MyConstant().h2BackStyle()),
                      ],
                    ),
                  ),
                ),
    );
  }

  Divider buildDivider() {
    return Divider(
      color: MyConstant.dark,
    );
  }

  Row buildDistance(int index) {
    return Row(
      children: [
        ShowTitle(
          title: 'ระยะทาง : ',
          textStyle: MyConstant().h3Stylebold(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ShowTitle(
            title: '${orderModels[index].distance}',
            textStyle: MyConstant().h3Style(),
          ),
        ),
      ],
    );
  }

  Row buildTransport(int index) {
    return Row(
      children: [
        ShowTitle(
          title: 'ค่าจัดส่ง : ',
          textStyle: MyConstant().h3Stylebold(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ShowTitle(
            title: '${orderModels[index].transport}',
            textStyle: MyConstant().h3Style(),
          ),
        ),
      ],
    );
  }

  Row buildTime(int index) {
    return Row(
      children: [
        ShowTitle(
          title: 'เวลาที่สั่งซื้อ : ',
          textStyle: MyConstant().h3Stylebold(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ShowTitle(
            title: orderModels[index].timeOrder!,
            textStyle: MyConstant().h3Style(),
          ),
        ),
      ],
    );
  }

  Row buildDay(int index) {
    return Row(
      children: [
        ShowTitle(
          title: 'วันที่สั่งซื้อ : ',
          textStyle: MyConstant().h3Stylebold(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ShowTitle(
            title: orderModels[index].dateOrder!,
            textStyle: MyConstant().h3Style(),
          ),
        ),
      ],
    );
  }

  Row buildNameBuyer(int index) {
    return Row(
      children: [
        ShowTitle(
          title: 'ชื่อผู้ใช้ : ',
          textStyle: MyConstant().h3Stylebold(),
        ),
        ShowTitle(
          title: '${orderModels[index].nameBuyer!}',
          textStyle: MyConstant().h3Style(),
        ),
      ],
    );
  }

  Widget buildShowTotal(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShowTitle(
                title: 'ยอดรวมสินค้า : ${totalProductTnts[index].toString()}',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row buildButton(index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ShowConfirmOrderByRider(orderModel: orderModels[index]),
                ),
              );
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShowTitle(
                    title: 'ดูข้อมูลผู้สั่งซื้อ',
                    textStyle: MyConstant().h3WhiteStyle(),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Widget bildListViewOrder(int index) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: listOrderProducts[index].length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index2) => Row(
          children: [
            Expanded(
              flex: 2,
              child: ShowTitle(
                title: listOrderProducts[index][index2],
                textStyle: MyConstant().h3Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ShowTitle(
                  title: listOrderPrices[index][index2],
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: ShowTitle(
                  title: listOrderAmunts[index][index2],
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: ShowTitle(
                  title: listOrderSums[index][index2],
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      decoration: BoxDecoration(color: MyConstant.light),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ShowTitle(
                title: 'สินค้า',
                textStyle: MyConstant().h3Stylebold(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: 'จำนวน',
                textStyle: MyConstant().h3Stylebold(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: 'ราคา/บาท',
                textStyle: MyConstant().h3Stylebold(),
              ),
            ),
            Expanded(
              flex: 1,
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
}
