import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/status/show_status_await_order.dart';
import 'package:flutter_myappication_1/status/show_status_finish.dart';
import 'package:flutter_myappication_1/status/show_status_order.dart';
import 'package:flutter_myappication_1/status/show_status_rider_order.dart';
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
  int status = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findBuyer();
  }

  Center buildNonOrder() => Center(
          child: ShowTitle(
        title: 'ไม่มีข้อมูลการสั่งซื้อ',
        textStyle: MyConstant().h1Style(),
      ));

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

          int total = int.parse(model.transport!);
          for (var string in orderSums) {
            total = total + int.parse(string.trim());
            // total = transport + total;
          }
          print('total = $total');

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

  Widget buildContent() => Container(decoration: MyConstant().gradientRadioBackground(),
    child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: orderModels.length,
          itemBuilder: (context, index) => Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      MyConstant().mySizeBox(),
                      buildHead(index),
                      buildHeadTitle(),
                      buildListViewOrderProduct(index),
                      buildShowTotal(index),
                    ],
                  ),
                ),
              ),
              MyConstant().mySizeBox(),
              buildStepIndicator(statusInts[index]),
              MyConstant().mySizeBox(),
            ],
          ),
        ),
  );

  Widget buildStepIndicator(int index) {
    return Column(
      children: [
        StepsIndicator(
          selectedStepColorIn: MyConstant.primary,
          unselectedStepColorIn: Colors.white,
          selectedStepColorOut: Colors.black,
          unselectedStepColorOut: Colors.black,
          undoneLineColor: Colors.black,
          lineLength: 100,
          selectedStep: index,
          nbSteps: 4,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowStatusOrder(),
                        ));
                  },
                  icon: Icon(Icons.filter_1_outlined),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowStatusAwaitOrder(),
                        ));
                  },
                  icon: Icon(Icons.filter_2_outlined),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowStatusRiderOrder(),
                        ));
                  },
                  icon: Icon(Icons.filter_3_outlined),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowStatusFinish(),
                        ));
                  },
                  icon: Icon(Icons.filter_4_outlined),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildShowTotal(int index) => Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShowTitle(
                    title:
                        'ยอดรวมสินค้า : ${totalProductTnts[index].toString()}',
                    textStyle: MyConstant().h2Style(),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      );

  Widget buildHead(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ShowTitle(
              title: 'ร้าน : ${orderModels[index].nameSeller}',
              textStyle: MyConstant().h1Style(),
            ),
          ],
        ),
        ShowTitle(
          title: 'วันที่สั่งซื้อ : ${orderModels[index].dateOrder}',
          textStyle: MyConstant().h2Style(),
        ),
        ShowTitle(
          title: 'เวลาที่สั่งซื้อ : ${orderModels[index].timeOrder}',
          textStyle: MyConstant().h2Style(),
        ),
        ShowTitle(
          title: 'ระยะทาง : ${orderModels[index].distance} กิโลเมต',
          textStyle: MyConstant().h2Style(),
        ),
        ShowTitle(
          title: 'ค่าจัดส่ง : ${orderModels[index].transport} บาท',
          textStyle: MyConstant().h2Style(),
        ),
      ],
    );
  }

  Widget buildListViewOrderProduct(int index) => Container(
        padding: EdgeInsets.all(4),
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
                  textStyle: MyConstant().h2Style(),
                ),
              ),
              Expanded(
                flex: 1,
                child: ShowTitle(
                  title: listOrderAmunts[index][index2],
                  textStyle: MyConstant().h2Style(),
                ),
              ),
              Expanded(
                flex: 1,
                child: ShowTitle(
                  title: listOrderPrices[index][index2],
                  textStyle: MyConstant().h2Style(),
                ),
              ),
              Expanded(
                flex: 1,
                child: ShowTitle(
                  title: listOrderSums[index][index2],
                  textStyle: MyConstant().h2Style(),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildHeadTitle() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(color: MyConstant.light),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ShowTitle(
                title: 'รายการสินค้า',
                textStyle: MyConstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: 'จำนวน',
                textStyle: MyConstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: 'ราคา',
                textStyle: MyConstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: 'ผลรวม',
                textStyle: MyConstant().h2Style(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView buildListview(int index) {
    return ListView.builder(
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
  }
}
