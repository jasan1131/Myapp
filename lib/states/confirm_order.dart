import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/splite_model.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/sqlite_helpper.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  List<SQLiteModel> sqlitemodels = [];
  UserModel? userModel;
  String? dateOrde;
  String? timeOrder;
  bool load = true;
  bool? haveData;
  int? total;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FinedOrderDate();
    FindOrderTime();
    processReadSQLite();
  }

  void FinedOrderDate() {
    DateTime dateTime = DateTime.now();
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    setState(() {
      dateOrde = dateFormat.format(dateTime);
    });
    // print('#### DateTime ==>> $dateStr');
  }

  void FindOrderTime() {
    DateTime dateTimes = DateTime.now();
    DateFormat dateFormats = DateFormat('HH:mm:ss');
    setState(() {
      timeOrder = dateFormats.format(dateTimes);
    });
    // print('#### DateTime ==>> $timeOrder');
  }

  Future<Null> processReadSQLite() async {
    if (sqlitemodels.isNotEmpty) {
      sqlitemodels.clear();
    }
    await SQLiteHelpper().readSQLite().then((value) {
      setState(() {
        load = false;
        sqlitemodels = value;
        calculateTotal();
      });
    });
  }

  void calculateTotal() async {
    total = 0;
    for (var item in sqlitemodels) {
      int sumInt = int.parse(item.sum.trim());
      setState(() {
        total = total! + sumInt;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, MyConstant.rounteShowCart, (route) => false),
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text('ยืนยันรายการสินค้า'),
      ),
      body: load
          ? ShowProgress()
          : haveData!
              ? buildContent()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ShowTitle(
                          title: 'ไม่มีสินค้า',
                          textStyle: MyConstant().h1Style()),
                    ),
                  ],
                ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('ยืนยันสินค้า'),
        onPressed: () {
          showAlertDialog();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildContent() {
    return Container(
      decoration: MyConstant().planBackground(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShowTitle(
                  title: 'รายการสินค้าที่สั่ง',
                  textStyle: MyConstant().h1Style(),
                ),
              ),
            ],
          ),
          buildDateTime(),
          buildHead(),
          listProductOrder(),
          buildDivider(),
          buildTotal(),
          buildDivider(),
          // buttonController(),
        ],
      ),
    );
  }

  Widget buildDateTime() {
    return Column(
      children: [
        ShowTitle(
          title: 'วันเวลาที่สั่งสินค้า',
          textStyle: MyConstant().h2Style(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShowTitle(
                title: dateOrde == null ? 'dd/mm/yy' : dateOrde!,
              ),
            ),
            ShowTitle(
              title: timeOrder == null ? 'HH:mm:ss' : timeOrder!,
            ),
          ],
        ),
      ],
    );
  }

  // 
  Future<Null> showAlertDialog() async {
    showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                title: ListTile(
                  title: Text('data'),
                ),
                content: ListView.builder(
                  itemCount: sqlitemodels.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Text('data'),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  Row buildTotal() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ShowTitle(
                title: 'Total :',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: ShowTitle(
            title: total == null ? '' : total.toString(),
            textStyle: MyConstant().h2Style(),
          ),
        ),
      ],
    );
  }

  Divider buildDivider() {
    return Divider(
      color: MyConstant.dark,
    );
  }

  ListView listProductOrder() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: sqlitemodels.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 4),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: ShowTitle(
                  title: sqlitemodels[index].nameProduct,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: ShowTitle(
                  title: sqlitemodels[index].priceProduct,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ShowTitle(
                  title: sqlitemodels[index].amount,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ShowTitle(
                  title: sqlitemodels[index].sum,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildHead() {
    return Container(
      decoration: BoxDecoration(color: MyConstant.light),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: ShowTitle(
                  title: 'สินค้า',
                  textStyle: MyConstant().h2Style(),
                ),
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
                title: 'จำนวน',
                textStyle: MyConstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: ShowTitle(
                  title: 'รวม',
                  textStyle: MyConstant().h2Style(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
