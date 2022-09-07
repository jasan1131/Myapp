import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/history_model.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
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
            setState(() {
              historyData = false;
              havedata = true;
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
          textStyle: MyConstant().h1Style(),
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

  ListView buildListView() {
    return ListView.builder(
      itemCount: historyModels.length,
      itemBuilder: (context, index) => Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildName(index),
                  buildDateTime(index),
                  buildDistance(index),
                  buildTransport(index),
                  buildHeadTitle(),
                  buildListViewHistoryProduct(index),
                  buildTotal(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildHeadTitle() {
    return Row(
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
    );
  }

  Widget buildListViewHistoryProduct(int index) => Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: listNameProducts[index].length,
          itemBuilder: (context, index2) => Row(
            children: [
              Expanded(
                flex: 3,
                child: ShowTitle(title: listNameProducts[index][index2]),
              ),
              Expanded(
                flex: 1,
                child: ShowTitle(title: listAmunts[index][index2]),
              ),
              Expanded(
                flex: 1,
                child: ShowTitle(title: listPriceProducts[index][index2]),
              ),
              Expanded(
                flex: 1,
                child: ShowTitle(title: listSums[index][index2]),
              ),
            ],
          ),
        ),
      );

  Widget buildTransport(int index) => ShowTitle(
        title: 'ค่าจัดส่ง : ${historyModels[index].transport}',
        textStyle: MyConstant().h2Style(),
      );

  Widget buildDistance(int index) => ShowTitle(
        title: 'ระยะทาง : ${historyModels[index].distance}',
        textStyle: MyConstant().h2Style(),
      );

  Widget buildDateTime(int index) {
    return Row(
      children: [
        ShowTitle(
          title:
              'วันและเวลาในการสั่งซื้อ : ${historyModels[index].dateOrder} ${historyModels[index].timeOrder}',
          textStyle: MyConstant().h2Style(),
        ),
      ],
    );
  }

  Widget buildName(int index) => ShowTitle(
        title: 'ชื่อ : ${historyModels[index].nameBuyer}',
        textStyle: MyConstant().h1Style(),
      );

  Widget buildTotal(int index) => ShowTitle(
        title: 'ยอดรวมสินค้า : ${historyModels[index].total}',
        textStyle: MyConstant().h2Style(),
      );
}
