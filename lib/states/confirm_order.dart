import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/splite_model.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/utility/sqlite_helpper.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  String? distance;
  List<SQLiteModel> sqliteModels = [];
  bool load = true;
  int? total;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    processReadSqlite();
  }

  Future<Null> processReadSqlite() async {
    if (sqliteModels.isNotEmpty) {
      sqliteModels.clear();
    }

    await SQLiteHelpper().readSQLite().then((value) {
      print('### value on processReadSQlite ==>> $value');
      setState(() {
        load = false;
        sqliteModels = value;
        calculateTotal();
      });
    });
  }

  void calculateTotal() async {
    total = 0;
    for (var item in sqliteModels) {
      int sql = int.parse(item.transport);
      int sumInt = int.parse(item.sum.trim());
      setState(() {
        total = total! + sumInt + sql;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, MyConstant.routeBuyerService, (route) => false);
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text('??????????????????????????????????????????????????????'),
      ),
      body: load
          ? ShowProgress()
          : sqliteModels.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ShowTitle(
                          title: '?????????????????????????????????',
                          textStyle: MyConstant().h1Style()),
                    ),
                  ],
                )
              : buildContent(),
    );
  }

  Widget buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShowTitle(
                  title: '?????????????????????????????????????????????????????????',
                  textStyle: MyConstant().h1Style(),
                ),
              ),
            ],
          ),
          buildDivider(),
          buildNameShop(),
          buildHead(),
          listProductOrder(),
          buildDivider(),
          buildTotal(),
          buildDivider(),
          buttonController(),
        ],
      ),
    );
  }

  Widget buildNameShop() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ShowTitle(
                title: '???????????? : ${sqliteModels[0].nameSeller}',
              ),
            ],
          ),
          Row(
            children: <Widget>[
              ShowTitle(
                title: '????????????????????? : ${sqliteModels[0].distance} ????????????????????????',
              ),
            ],
          ),
          Row(
            children: <Widget>[
              ShowTitle(
                title: '??????????????????????????? : ${sqliteModels[0].transport} ?????????',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonController() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              ordreThread();
            },
            child: Text('Order'),
          ),
        ),
      ],
    );
  }

  Widget buildTotal() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShowTitle(
                title: 'Total :',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 14),
            child: ShowTitle(
              title: total == null ? '' : total.toString(),
              textStyle: MyConstant().h2Style(),
            ),
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
      itemCount: sqliteModels.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: ShowTitle(
                  title: sqliteModels[index].nameProduct,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: ShowTitle(
                  title: sqliteModels[index].priceProduct,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ShowTitle(
                  title: sqliteModels[index].amount,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ShowTitle(
                  title: sqliteModels[index].sum,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(),
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
                  title: '??????????????????',
                  textStyle: MyConstant().h2Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: '????????????',
                textStyle: MyConstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: '???????????????',
                textStyle: MyConstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: ShowTitle(
                  title: '?????????',
                  textStyle: MyConstant().h2Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> ordreThread() async {
    DateTime orderDateOrder = DateTime.now();
    DateTime orderTimeOrder = DateTime.now();

    String dateOrder = DateFormat('dd-MM-yyyy').format(orderDateOrder);
    String timeOrder = DateFormat('HH:mm:ss').format(orderTimeOrder);

    String idSeller = sqliteModels[0].idSeller;
    String nameSeller = sqliteModels[0].nameSeller;
    String distance = sqliteModels[0].distance;
    String transport = sqliteModels[0].transport;

    List<String> idProducts = [];
    List<String> nameProducts = [];
    List<String> priceProducts = [];
    List<String> amounts = [];
    List<String> sums = [];

    for (var model in sqliteModels) {
      idProducts.add(model.idProduct);
      nameProducts.add(model.nameProduct);
      priceProducts.add(model.priceProduct);
      amounts.add(model.amount);
      sums.add(model.sum);
    }

    String idProduct = idProducts.toString();
    String nameProduct = nameProducts.toString();
    String priceProduct = priceProducts.toString();
    String amount = amounts.toString();
    String sum = sums.toString();
    String totals = total.toString();

    SharedPreferences preferences = await SharedPreferences.getInstance();

    String idBuyer = preferences.getString('id')!;
    String nameBuyer = preferences.getString('name')!;

    // print('dateOrdre = $dateOrder, timeOrder = $timeOrder');
    // print('idSeller = $idSeller, nameSeller = $nameSeller, distance = $distance, transport = $transport');
    print(
        'idProduct = $idProduct, nameProduct = $nameProduct, idBuyer = $idBuyer, nameBuyer = $nameBuyer, priceProduct = $priceProduct, amount = $amount, sum = $sum, total = $totals');

    String url =
        '${MyConstant.domain}/shopping/insertOrder.php?isAdd=true&idSeller=$idSeller&nameSeller=$nameSeller&idBuyer=$idBuyer&nameBuyer=$nameBuyer&distance=$distance&transport=$transport&dateOrder=$dateOrder&timeOrder=$timeOrder&idProduct=$idProduct&nameProduct=$nameProduct&priceProduct=$priceProduct&amount=$amount&sum=$sum&total=$total&status=awaitOrder';
    await Dio().get(url).then((value) {
      if (value.toString() == 'true') {
        clearAllSqlite();
        notificationToShop(idSeller);
      } else {
        MyDialog().normalDialog(context, '?????????????????????????????????????????????????????????', '????????????????????????????????????');
      }
    });
  }

  Future<Null> clearAllSqlite() async {
    await SQLiteHelpper().emptySQLite().then((value) {
      processReadSqlite();
    });
  }

  void success() {
    Navigator.pushNamed(context, MyConstant.routeBuyerService);
  }

  Future<Null> notificationToShop(String idSeller) async {
    String urlFindToken =
        '${MyConstant.domain}/shopping/getUserWhereId.php?isAdd=true&id=$idSeller';
    await Dio().get(urlFindToken).then((value) {
      var result = json.decode(value.data);
      print('result ==> $result');
      for (var json in result) {
        UserModel model = UserModel.fromMap(json);
        String tokenShop = model.token;
        print('tokenShop ==>> $tokenShop');

        String title = '???????????????????????????????????????????????????';
        String body = '????????????????????????????????????????????????????????????????????????';
        String urlSendToken =
            '${MyConstant.domain}/shopping/apiNotification.php?isAdd=true&token=$tokenShop&title=$title&body=$body';
        sendNotificationToShop(urlSendToken);
      }
    });
  }

  Future<Null> sendNotificationToShop(String urlSendToken) async {
    await Dio().get(urlSendToken).then((value) => MyDialog().normalDialog(context, '??????????????????????????????????????????????????????????????????????????????????????????????????????', '?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????'));
  }
}
