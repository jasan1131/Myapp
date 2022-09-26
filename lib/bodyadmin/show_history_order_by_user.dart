import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/history_model.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowHistoryByOrderByUser extends StatefulWidget {
  const ShowHistoryByOrderByUser({Key? key}) : super(key: key);

  @override
  State<ShowHistoryByOrderByUser> createState() =>
      _ShowHistoryByOrderByUserState();
}

class _ShowHistoryByOrderByUserState extends State<ShowHistoryByOrderByUser> {
  bool statusOrder = true;
  bool? haveData;
  HistoryModel? historyModel;
  List<HistoryModel> historyModels = [];
  List<List<String>> listNameProducts = [];
  List<List<String>> listPriceProducts = [];
  List<List<String>> listAmunts = [];
  List<List<String>> listSums = [];
  String? idSeller;
  String? id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistoryOrder();
  }

  Future getHistoryOrder() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idSeller = preferences.getString('id');
    readHistoryOrder();
  }

  Future readHistoryOrder() async {
    if (idSeller != null) {
      String path =
          '${MyConstant.domain}/shopping/getHistoryOrderWhereIdSeller.php?isAdd=true&idSeller=$idSeller';
      await Dio().get(path).then((value) {
        if (value.toString() == 'null') {
          setState(() {
            statusOrder = false;
            haveData = false;
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
            setState(() {
              statusOrder = false;
              haveData = true;
              historyModels.add(history);

              listNameProducts.add(historyNameProducts);
              listPriceProducts.add(historyPriceProducts);
              listAmunts.add(historyAmunts);
              listSums.add(historySums);
            });
          }
        }
      });
    }
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

  Widget buildNonHistoryOrder() => Center(
        child: ShowTitle(
          title: 'ไม่มีข้อมูลการสั่งซื้อ',
          textStyle: MyConstant().h1Style(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: statusOrder
          ? ShowProgress()
          : haveData!
              ? buildListView()
              : buildNonHistoryOrder(),
    );
  }

  ListView buildListView() {
    return ListView.builder(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildName(index),
                      buildDay(index),
                      buildTime(index),
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

  Widget buildListViewHistoryProduct(int index) => Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: listNameProducts[index].length,
          itemBuilder: (context, index2) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ShowTitle(
                    title: listNameProducts[index][index2],
                    textStyle: MyConstant().h3Style(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ShowTitle(
                      title: listAmunts[index][index2],
                      textStyle: MyConstant().h3Style(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: ShowTitle(
                      title: listPriceProducts[index][index2],
                      textStyle: MyConstant().h3Style(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: ShowTitle(
                      title: listSums[index][index2],
                      textStyle: MyConstant().h3Style(),
                    ),
                  ),
                ),
              ],
            ),
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
              title: '${historyModels[index].transport}',
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
            padding: const EdgeInsets.only(top: 3),
            child: ShowTitle(
              title: '${historyModels[index].distance}',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ],
      );

  Widget buildDay(int index) {
    return Row(
      children: [
        ShowTitle(
          title: 'วันที่สั่งซื้อ : ',
          textStyle: MyConstant().h3Stylebold(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: ShowTitle(
            title: '${historyModels[index].dateOrder}',
            textStyle: MyConstant().h3Style(),
          ),
        ),
      ],
    );
  }

  Widget buildTime(int index) {
    return Row(
      children: [
        ShowTitle(
          title: 'เวลาที่สั่งซื้อ : ',
          textStyle: MyConstant().h3Stylebold(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: ShowTitle(
            title: '${historyModels[index].timeOrder}',
            textStyle: MyConstant().h3Style(),
          ),
        ),
      ],
    );
  }

  Widget buildName(int index) => Row(
        children: [
          ShowTitle(
            title: 'ชื่อผู้สั่ง : ',
            textStyle: MyConstant().h3Stylebold(),
          ),
          ShowTitle(
            title: '${historyModels[index].nameBuyer}',
            textStyle: MyConstant().h3Style(),
          ),
        ],
      );

  Widget buildTotal(int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ShowTitle(
              title: 'ยอดรวมสินค้า : ',
              textStyle: MyConstant().h3Stylebold(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: ShowTitle(
                title: '${historyModels[index].total}',
                textStyle: MyConstant().h3Style(),
              ),
            ),
          ],
        ),
      );
}
