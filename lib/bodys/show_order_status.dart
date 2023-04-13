import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/states/show_status_buyer_await_order.dart';
import 'package:flutter_myappication_1/states/show_status_buyer_finish.dart';
import 'package:flutter_myappication_1/states/show_status_buyer_rider_order.dart';
import 'package:flutter_myappication_1/states/show_status_buyer_seller_order.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:steps_indicator/steps_indicator.dart';

class ShowOrderStatus extends StatefulWidget {
  const ShowOrderStatus({Key? key}) : super(key: key);

  @override
  State<ShowOrderStatus> createState() => _ShowOrderStatusState();
}

class _ShowOrderStatusState extends State<ShowOrderStatus> {
  OrderModel? orderModel;
  String? idBuyer;
  bool statusOrder = true;
  bool? haveData;
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

  Widget buildNonOrder() => Center(
        child: ShowTitle(
          title: 'ไม่มีข้อมูลการสั่งซื้อ',
          textStyle: MyConstant().h1Style(),
        ),
      );

  Future<Null> findBuyer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idBuyer = preferences.getString('id');
    // print('idBuyer = $idBuyer');
    readOrderFromIdBuyer();
  }

  Future<Null> readOrderFromIdBuyer() async {
    if (idBuyer != null) {
      String url =
          '${MyConstant.domain}/shopping/getOrderWhereUser.php?isAdd=true&idBuyer=$idBuyer';

      await Dio().get(url).then((value) {
        if (value.toString() == 'null') {
          setState(() {
            statusOrder = false;
            haveData = false;
          });
        } else {
          var result = json.decode(value.data);
          for (var map in result) {
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
              case 'FinishOrder':
                status = 3;
                break;
              default:
            }

            setState(() {
              haveData = true;
              statusOrder = false;
              orderModels.add(model);
              listOrderProducts.add(orderProducts);
              listOrderPrices.add(orderPrices);
              listOrderAmunts.add(orderAmounts);
              listOrderSums.add(orderSums);
              totalProductTnts.add(total);
              statusInts.add(status);
              // print('orderProducts = $orderProducts');
            });
          }
        }
      });
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
                    buildHead(index),
                    buildHeadTitle(),
                    buildListViewOrderProduct(index),
                    buildDivider(),
                    buildShowTotal(index),
                    buildDivider(),
                    MyConstant().mySizeBox(),
                    buildStepIndicator(statusInts[index]),
                    buildIcon(index),
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

  Widget buildIcon(index) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ShowStatusBuyerAwaitOrder(orderModel: orderModels[index]),
              ),
            ),
            icon: Icon(Icons.inventory_sharp),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ShowStatusBuyerSellerOrder(orderModel: orderModels[index]),
              ),
            ),
            icon: Icon(Icons.inventory_2_outlined),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ShowStatusBuyerRiderOrder(orderModel: orderModels[index]),
              ),
            ),
            icon: Icon(Icons.local_shipping_outlined),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ShowStatusBuyerFinish(orderModel: orderModels[index]),
              ),
            ),
            icon: Icon(Icons.check_circle_outline),
          ),
        ],
      ),
    );
  }

  Widget buildStepIndicator(int index) {
    return Column(
      children: [
        StepsIndicator(
          selectedStepColorIn: MyConstant.light,
          unselectedStepColorIn: Colors.white,
          selectedStepColorOut: Colors.black,
          unselectedStepColorOut: Colors.black,
          doneStepColor: Colors.black,
          doneLineColor: Colors.black,
          undoneLineColor: Colors.black,
          lineLength: 110,
          selectedStep: index,
          nbSteps: 4,
        ),
      ],
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
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: ShowTitle(
                  title: '${orderModels[index].dateOrder}',
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ],
          ),
          Row(
            children: [
              ShowTitle(
                title: 'เวลาที่สั่งซื้อ : ',
                textStyle: MyConstant().h3Stylebold(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: ShowTitle(
                  title: '${orderModels[index].timeOrder}',
                  textStyle: MyConstant().h3Style(),
                ),
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
                padding: const EdgeInsets.only(top: 2),
                child: ShowTitle(
                  title: '${orderModels[index].distance} กิโลเมต',
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  ShowTitle(
                    title: 'ค่าจัดส่ง : ',
                    textStyle: MyConstant().h3Stylebold(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: ShowTitle(
                      title: '${orderModels[index].transport} บาท',
                      textStyle: MyConstant().h3Style(),
                    ),
                  ),
                ],
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
