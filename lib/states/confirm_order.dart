import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/product_model.dart';
import 'package:flutter_myappication_1/models/splite_model.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/utility/sqlite_helpper.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  ProductModel? productModel;
  String? distance;
  String? idBuyer;
  UserModel? userModel;
  List<UserModel> userModels = [];
  List<SQLiteModel> sqliteModels = [];
  bool load = true;
  int? total;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    processReadSqlite();
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
  }

  Future<Null> processReadSqlite() async {
    if (sqliteModels.isNotEmpty) {
      sqliteModels.clear();
    }

    await SQLiteHelpper().readSQLite().then((value) {
      // print('### value on processReadSQlite ==>> $value');
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
        backgroundColor: MyConstant.primary,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pushNamedAndRemoveUntil(
        //         context, MyConstant.routeBuyerService, (route) => false);
        //   },
        //   icon: Icon(Icons.arrow_back),
        // ),
        centerTitle: true,
        title: Text('ยืนยันรายการสินค้า'),
      ),
      body: load
          ? ShowProgress()
          : sqliteModels.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ShowTitle(
                          title: 'ไม่มีสินค้า',
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
                  title: 'รายการสินค้าที่สั่ง',
                  textStyle: MyConstant().h1Style(),
                ),
              ),
            ],
          ),
          buildDivider(),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ShowTitle(
              title: 'ข้อมูลการสั่ง :',
              textStyle: MyConstant().h3Stylebold(),
            ),
          ),
          buildNameShop(),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ShowTitle(
              title: 'ข้อมูลผู้สั่ง :',
              textStyle: MyConstant().h3Stylebold(),
            ),
          ),
          buildBuyer(),
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
      margin: EdgeInsets.only(left: 4.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Row(
                children: [
                  ShowTitle(
                    title: 'ชื่อร้าน : ',
                    textStyle: MyConstant().h3Stylebold(),
                  ),
                  ShowTitle(
                    title: '${sqliteModels[0].nameSeller}',
                    textStyle: MyConstant().h3Style(),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: Row(
              children: <Widget>[
                Row(
                  children: [
                    ShowTitle(
                      title: 'ระยะทาง : ',
                      textStyle: MyConstant().h3Stylebold(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: ShowTitle(
                        title: '${sqliteModels[0].distance} กิโลเมตร',
                        textStyle: MyConstant().h3Style(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              children: <Widget>[
                Row(
                  children: [
                    ShowTitle(
                      title: 'ค่าจัดส่ง : ',
                      textStyle: MyConstant().h3Stylebold(),
                    ),
                    ShowTitle(
                      title: '${sqliteModels[0].transport} บาท',
                      textStyle: MyConstant().h3Style(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildBuyer() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ShowTitle(
                title: 'ที่อยู่ : ',
                textStyle: MyConstant().h3Stylebold(),
              ),
              Container(
                margin: EdgeInsets.only(top: 1),
                width: MediaQuery.of(context).size.width * 0.75,
                child: ShowTitle(
                  title: sqliteModels[0].address,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ShowTitle(
                title: 'เบอร์โทรศัพท์ : ',
                textStyle: MyConstant().h3Stylebold(),
              ),
              Container(
                margin: EdgeInsets.only(top: 3.5),
                width: MediaQuery.of(context).size.width * 0.75,
                child: ShowTitle(
                  title: sqliteModels[0].phone,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ShowTitle(
                title: 'เฟสบุ๊ก : ',
                textStyle: MyConstant().h3Stylebold(),
              ),
              Container(
                margin: EdgeInsets.only(top: 2.5),
                width: MediaQuery.of(context).size.width * 0.75,
                child: ShowTitle(
                  title: sqliteModels[0].facebook,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ShowTitle(
                title: 'ไลน์ไอดี : ',
                textStyle: MyConstant().h3Stylebold(),
              ),
              Container(
                margin: EdgeInsets.only(top: 2.5),
                width: MediaQuery.of(context).size.width * 0.75,
                child: ShowTitle(
                  title: sqliteModels[0].line,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ],
          ),
        ),
      ],
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
            child: Text('ยืนยัน'),
          ),
        ),
      ],
    );
  }

  Widget buildTotal() {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    return Row(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShowTitle(
                title: 'ยอดรวมสินค้า :',
                textStyle: MyConstant().h3Stylebold(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: ShowTitle(
                title: total == null ? '' : myFormat.format(total),
                textStyle: MyConstant().h3Style(),
              ),
            ),
            ShowTitle(title: ' บาท')
          ],
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
              flex: 3,
              child: ShowTitle(
                title: sqliteModels[index].nameProduct,
                textStyle: MyConstant().h3Style(),
              ),
            ),
            Expanded(
              flex: 2,
              child: ShowTitle(
                title: sqliteModels[index].amount,
                textStyle: MyConstant().h3Style(),
              ),
            ),
            Expanded(
              flex: 2,
              child: ShowTitle(
                title: sqliteModels[index].priceProduct,
                textStyle: MyConstant().h3Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: sqliteModels[index].sum,
                textStyle: MyConstant().h3Style(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHead() {
    return Container(
      decoration: BoxDecoration(color: MyConstant.light),
      child: Padding(
        padding: const EdgeInsets.all(8),
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

  Future<Null> ordreThread() async {
    DateTime orderDateOrder = DateTime.now();
    int dayNow = orderDateOrder.year + 543;
    DateTime orderTimeOrder = DateTime.now();

    String dateOrder = DateFormat('dd/MM/${dayNow}').format(orderDateOrder);
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

    // String phone = userModel.phone;
    // String line = userModel!.line;

    // print('dateOrdre = $dateOrder, timeOrder = $timeOrder');
    // print('idSeller = $idSeller, nameSeller = $nameSeller, distance = $distance, transport = $transport');

    String url =
        '${MyConstant.domain}/shopping/insertOrder.php?isAdd=true&idSeller=$idSeller&nameSeller=$nameSeller&idBuyer=$idBuyer&nameBuyer=$nameBuyer&distance=$distance&transport=$transport&dateOrder=$dateOrder&timeOrder=$timeOrder&nameProduct=$nameProduct&priceProduct=$priceProduct&amount=$amount&sum=$sum&total=$total&status=awaitOrder';
    await Dio().get(url).then((value) {
      if (value.toString() == 'true') {
        clearAllSqlite();
        notificationToShop(idSeller);
      } else {
        MyDialog().normalDialog(context, 'ไม่สามารทำรายการได้', 'กรุณารองใหม่');
      }
    });
  }

  Future<Null> clearAllSqlite() async {
    MyDialog().normalDialogNavigator(
      context,
      'ทำรายการเสร็จสิ้น',
      'ส่งรายการสินค้าที่สั่งไปยังร้านค้าเรียบร้อยแล้ว ขอบคุณที่ใช้บริการ',
    );
    await SQLiteHelpper().emptySQLite().then((value) {
      editNumberProduct();
      processReadSqlite();
    });
  }

  Future<Null> editNumberProduct() async {
    // List<String> idProduct = [];
    // List<String> numberProduct = [];
    for (var model in sqliteModels) {
      String path =
          '${MyConstant.domain}/shopping/editOrderWhereIdBuyer.php?isAdd=true&id=${model.idProduct}&numberproduct=${model.numberProduct}';
      await Dio().get(path).then((value) {
        print('editFinish');
      });
    }
  }

  void success() {
    Navigator.pushNamed(context, MyConstant.routeBuyerService);
  }

  Future<Null> notificationToShop(String idSeller) async {
    String urlFindToken =
        '${MyConstant.domain}/shopping/getUserWhereId.php?isAdd=true&id=$idSeller';
    await Dio().get(urlFindToken).then((value) {
      var result = json.decode(value.data);
      // print('result ==> $result');
      for (var json in result) {
        UserModel model = UserModel.fromMap(json);
        String tokenShop = model.token;
        // print('tokenShop ==>> $tokenShop');

        String title = 'มีสินค้าจากลูกค้า';
        String body = 'มีการสั่งสินค้าจากลูกค้า';
        String urlSendToken =
            '${MyConstant.domain}/shopping/apiNotification.php?isAdd=true&token=$tokenShop&title=$title&body=$body';
        sendNotificationToShop(urlSendToken);
      }
    });
  }

  Future<Null> sendNotificationToShop(String urlSendToken) async {
    await Dio().get(urlSendToken).then((value) {
      print('UploadFinish');
    });
  }
}
