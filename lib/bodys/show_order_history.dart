import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/history_model.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowOrderHistory extends StatefulWidget {
  const ShowOrderHistory({Key? key}) : super(key: key);

  @override
  State<ShowOrderHistory> createState() => _ShowOrderHistoryState();
}

class _ShowOrderHistoryState extends State<ShowOrderHistory> {
  HistoryModel? historyModel;
  List<HistoryModel> historyModels = [];
  List<List<String>> listNameProducts = [];
  List<List<String>> listPriceProducts = [];
  List<List<String>> listAmunts = [];
  List<List<String>> listSums = [];
  List<int> totalProductTnts = [];
  String? idBuyer;
  bool historyData = true;
  bool? havedata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistoryOrder();
  }

  Future getHistoryOrder() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idBuyer = preferences.getString('id');
    readHistoryOrder();
  }

  Future readHistoryOrder() async {
    if (idBuyer != null) {
      String path =
          '${MyConstant.domain}/shopping/getHistoryOrderWhereIdBuyer.php?isAdd=true&idBuyer=$idBuyer';
      await Dio().get(path).then((value) {
        if (value.toString() == 'null') {
          setState(() {
            historyData = false;
            havedata = false;
          });
        } else {
          var result = json.decode(value.data);
          for (var map in result) {
            HistoryModel history = HistoryModel.fromMap(map);
            List<String> historyNameProducts = changeArrey(history.nameProduct);
            List<String> historyPriceProducts =
                changeArrey(history.priceProduct);
            List<String> historyAmunts = changeArrey(history.amount);
            List<String> historySums = changeArrey(history.sum);

            int total = int.parse(history.transport!);
            for (var string in historySums) {
              total = total + int.parse(string.trim());
              // total = transport + total;
            }
            setState(() {
              historyData = false;
              havedata = true;
              historyModels.add(history);
              listNameProducts.add(historyNameProducts);
              listPriceProducts.add(historyPriceProducts);
              listAmunts.add(historyAmunts);
              listSums.add(historySums);
              totalProductTnts.add(total);
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

  Widget buildNonHistoryOrder() => Center(
        child: ShowTitle(
          title: 'ไม่มีข้อมูลการสั่งซื้อ',
          textStyle: MyConstant().h1Stylebold(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: historyData
          ? ShowProgress()
          : havedata!
              ? buildListView()
              : buildNonHistoryOrder(),
    );
  }

  Widget buildListView() {
    return Container(
      decoration: MyConstant().gradientRadioBackground(),
      child: ListView.builder(
        itemCount: historyModels.length,
        itemBuilder: (context, index) => Column(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        buildName(index),
                        buildDateTime(index),
                        buildDistance(index),
                        buildTransport(index),
                      ],
                    ),
                  ),
                  buildHeadTitle(),
                  buildListViewHistoryProduct(index),
                  buildDivider(),
                  buildTotal(index),
                  buildDivider(),
                  MyConstant().mySizeBox()
                ],
              ),
            ),
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

  Widget buildListViewHistoryProduct(int index) => Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: listNameProducts[index].length,
          itemBuilder: (context, index2) => Row(
            children: [
              Expanded(
                flex: 3,
                child: ShowTitle(
                  title: listNameProducts[index][index2],
                  textStyle: MyConstant().h3Style(),
                ),
              ),
              Expanded(
                flex: 2,
                child: ShowTitle(
                  title: listAmunts[index][index2],
                  textStyle: MyConstant().h3Style(),
                ),
              ),
              Expanded(
                flex: 2,
                child: ShowTitle(
                  title: listPriceProducts[index][index2],
                  textStyle: MyConstant().h3Style(),
                ),
              ),
              Expanded(
                flex: 1,
                child: ShowTitle(
                  title: listSums[index][index2],
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildTransport(int index) => Row(
        children: [
          ShowTitle(
            title: 'ค่าจัดส่ง : ',
            textStyle: MyConstant().h3Stylebold(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: ShowTitle(
              title: '${historyModels[index].transport} บาท',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ],
      );

  Widget buildDistance(int index) => Row(
        children: [
          ShowTitle(
            title: 'ระยะทาง : ',
            textStyle: MyConstant().h3Stylebold(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: ShowTitle(
              title: '${historyModels[index].distance} กิโลเมตร',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ],
      );

  Widget buildDateTime(int index) {
    return Column(
      children: [
        Row(
          children: [
            ShowTitle(
              title: 'วันที่สั่งซื้อ : ',
              textStyle: MyConstant().h3Stylebold(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: ShowTitle(
                title: '${historyModels[index].dateOrder}',
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
              padding: const EdgeInsets.only(top: 4),
              child: ShowTitle(
                title: '${historyModels[index].timeOrder}',
                textStyle: MyConstant().h3Style(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildName(int index) => Row(
        children: [
          ShowTitle(
            title: 'ชื่อร้าน : ',
            textStyle: MyConstant().h3Stylebold(),
          ),
          ShowTitle(
            title: '${historyModels[index].nameSeller}',
            textStyle: MyConstant().h3Style(),
          ),
        ],
      );

  Widget buildTotal(int index) {
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
}
