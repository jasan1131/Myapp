import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/states/confirm_order.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashOnDelivery extends StatefulWidget {
  const CashOnDelivery({Key? key}) : super(key: key);

  @override
  State<CashOnDelivery> createState() => _CashOnDeliveryState();
}

class _CashOnDeliveryState extends State<CashOnDelivery> {
  UserModel? userModel;
  String? dateDays;
  String? dateTimes;
  bool load = true;
  String? idbuyer;
  String? namebuyer;
   String? secondnamebuyer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finedCurrentTime();
    findIdBuyer();
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
  }

  Future<void> findIdBuyer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idbuyer = preferences.getString('id');
    namebuyer = preferences.getString('name');
    secondnamebuyer = preferences.getString('secondname');
  }

  void finedCurrentTime() {
    DateTime dateTime = DateTime.now();
    DateTime dateDay = DateTime.now();
    // dayNow = dateDay.yearInBuddhistCalendar;
    int dayNow = dateDay.year + 543;

    DateFormat dateFormatDay = DateFormat('dd/MM/${dayNow}');
    DateFormat dateFormatTime = DateFormat('HH:mm:ss');
    setState(() {
      dateDays = dateFormatDay.format(dateDay);
      dateTimes = dateFormatTime.format(dateTime);
    });
    print('### DateTime = $dayNow');
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
      child: ElevatedButton(
        onPressed: () {
          InsertData();
        },
        child: Text('เก็บเงินปลายทาง'),
      ),
    );
  }

  Future<void> InsertData() async {
    var urlAPIInsert =
        '${MyConstant.domain}/shopping/insertSlip.php?isAdd=true&idbuyer=$idbuyer&namebuyer=$namebuyer&secondnamebuyer=$secondnamebuyer&dateDay=$dateDays&dateTime=$dateTimes&status=เก็บเงินปลายทาง';
    await Dio().get(urlAPIInsert).then(
          (value) => MyDialog(funcAction: success).actionDialog(
            context,
            'ทำรายการเสร็จสิ้น',
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ShowTitle(
            title: dateDays == null ? 'dd/mm/yyyy' : dateDays!,
            textStyle: MyConstant().h2Stylebold(),
          ),
        ),
        ShowTitle(
          title: dateTimes == null ? 'HH:mm:ss' : dateTimes!,
          textStyle: MyConstant().h2Stylebold(),
        ),
      ],
    );
  }

  Widget buildHearder() {
    return ShowTitle(
      title: 'วันและเวลาที่ชำระเงิน',
      textStyle: MyConstant().h1Stylebold(),
    );
  }
}
