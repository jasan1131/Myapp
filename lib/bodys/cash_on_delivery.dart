import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/states/confirm_order.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashOnDelivery extends StatefulWidget {
  const CashOnDelivery({Key? key}) : super(key: key);

  @override
  State<CashOnDelivery> createState() => _CashOnDeliveryState();
}

class _CashOnDeliveryState extends State<CashOnDelivery> {
  UserModel? userModel;
  String? dateTimeStr;
  bool load = true;
  String? idbuyer;
  String? namebuyer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finedCurrentTime();
    findIdBuyer();
  }

  Future<void> findIdBuyer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idbuyer = preferences.getString('id');
    namebuyer = preferences.getString('name');
  }

  void finedCurrentTime() {
    DateTime dateTime = DateTime.now();
    DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
    setState(() {
      dateTimeStr = dateFormat.format(dateTime);
    });
    print('### DateTime = $dateTimeStr');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildHearder(),
            buildDateTime(),
            buildBottom(),
          ],
        ),
      ),
    );
  }

  Widget buildBottom() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          InsertData();
        },
        child: Text('เก็บเงินปลายทาง'),
      ),
    );
  }

  Future<void> InsertData() async {
    var status = 'เก็บเงินปลายทาง';
    var urlAPIInsert =
        '${MyConstant.domain}/shopping/insertSlip.php?isAdd=true&idbuyer=$idbuyer&namebuyer=$namebuyer&datepay=$dateTimeStr&status=$status';
    await Dio().get(urlAPIInsert).then(
          (value) => MyDialog(funcAction: success).actionDialog(
            context,
            'ทำรายการเสร้จสิ้น',
            'ขอบคุณที่ใช้บริการ',
          ),
        );
  }

  void success() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmOrder(),
        ),
        (route) => false);
  }

  Widget buildDateTime() {
    return ShowTitle(
      title: dateTimeStr == null ? 'dd/mm/yy HH:mm:ss' : dateTimeStr!,
      textStyle: MyConstant().h2Style(),
    );
  }

  Widget buildHearder() {
    return ShowTitle(
      title: 'วันที่ชำระเงิน',
      textStyle: MyConstant().h1Style(),
    );
  }
}
