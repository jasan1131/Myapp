import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/states/confirm_order.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmAddWallet extends StatefulWidget {
  const ConfirmAddWallet({Key? key}) : super(key: key);

  @override
  State<ConfirmAddWallet> createState() => _ConfirmAddWalletState();
}

class _ConfirmAddWalletState extends State<ConfirmAddWallet> {
  UserModel? userModel;
  String? dateDays;
  String? dateTimes;
  File? file;
  bool load = true;
  String? idbuyer;
  String? namebuyer;
  String? secondnamebuyer;
  String pathslip = '';

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
    print(namebuyer);
  }

  void finedCurrentTime() {
    DateTime dateTime = DateTime.now();
    DateTime dateDay = DateTime.now();
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
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        centerTitle: true,
        title: Text('ชำระเงิน'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildHearder(),
            buildDateTime(),
            Spacer(),
            buildImage(),
            Spacer(),
            buildBottom(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Container buildBottom() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (file == null) {
            MyDialog()
                .normalDialog(context, 'ยังไม่มีรูปภาพ', 'กรุณาอัพโหลดรูปภาพ');
          } else {
            processUploadAddInsertData();
          }
        },
        child: Text('อัพโหลด บิล'),
      ),
    );
  }

  Future<void> processUploadAddInsertData() async {
    // upload image to sever

    String APISaveSlip = '${MyConstant.domain}/shopping/saveSlip.php';
    int i = Random().nextInt(1000000);
    String nameSlip = 'slip$i.jpg';

    MyDialog().showProgressDialog(context);

    try {
      Map<String, dynamic> map = {};
      map['file'] =
          await MultipartFile.fromFile(file!.path, filename: nameSlip);
      FormData data = FormData.fromMap(map);
      await Dio().post(APISaveSlip, data: data).then((value) async {
        Navigator.pop(context);
        // inset value to mySQL
        pathslip = '/shopping/slip/$nameSlip';

        var urlAPIInsert =
            '${MyConstant.domain}/shopping/insertSlip.php?isAdd=true&idbuyer=$idbuyer&namebuyer=$namebuyer&secondnamebuyer=$secondnamebuyer&dateDay=$dateDays&dateTime=$dateTimes&pathslip=$pathslip&status=โอนเงิน';
        await Dio().get(urlAPIInsert).then(
              (value) => MyDialog(funcAction: success).actionDialog(
                context,
                'ชำระเงินเสร็จสิ้น',
                'ขอบคุณที่ใช้บริการ',
              ),
            );
      });
    } catch (e) {}
  }

  void success() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmOrder(),
        ),
        (route) => false);
  }

  Future<void> processTakePhoto(ImageSource source) async {
    try {
      var result = await ImagePicker().pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Column buildImage() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250.0,
              height: 300.0,
              child: file == null
                  ? Image.asset(MyConstant.bill)
                  : Image.file(file!),
            ),
          ],
        ),
        IconButton(
          onPressed: () => processTakePhoto(ImageSource.gallery),
          icon: Icon(Icons.add_photo_alternate_outlined),
        ),
      ],
    );
  }

  Widget buildDateTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ShowTitle(
            title: dateDays == null ? 'dd/mm/' : dateDays!,
            textStyle: MyConstant().h2Style(),
          ),
        ),
        ShowTitle(
          title: dateTimes == null ? 'HH:mm:ss' : dateTimes!,
          textStyle: MyConstant().h2Style(),
        ),
      ],
    );
  }

  ShowTitle buildHearder() {
    return ShowTitle(
      title: 'วันและเวลาที่ชำระเงิน',
      textStyle: MyConstant().h1Style(),
    );
  }
}
