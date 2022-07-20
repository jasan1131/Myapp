import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmAddWallet extends StatefulWidget {
  const ConfirmAddWallet({Key? key}) : super(key: key);

  @override
  State<ConfirmAddWallet> createState() => _ConfirmAddWalletState();
}

class _ConfirmAddWalletState extends State<ConfirmAddWallet> {
  String? dateTimeStr;
  File? file;
  bool load = true;
  

  String? idbuyer;
  String? userbuyer;

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
    userbuyer = preferences.getString('user');
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
      appBar: AppBar(
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
    String nameSlip = 'slip${Random().nextInt(1000000)}.jpg';

    MyDialog().showProgressDialog(context);

    try {
      Map<String, dynamic> map = {};
      map['file'] =
          await MultipartFile.fromFile(file!.path, filename: nameSlip);
      FormData data = FormData.fromMap(map);
      await Dio().post(APISaveSlip, data: data).then((value) async {
        Navigator.pop(context);

        // inset value to mySQL
        var pathslip = '/slip/nameslip';
        var status = 'waitOrder';
        var urlAPIInsert =
            '${MyConstant.domain}/shopping/insertSlip.php?isAdd=true&idbuyer=$idbuyer&userbuyer=$userbuyer&datepay=$dateTimeStr&pathslip=$pathslip&status=$status';
        await Dio().get(urlAPIInsert).then(
              (value) => MyDialog(funcAction: success).actionDialog(
                context,
                'ทำรายการเสร้จสิ้น',
                'ขอบคุณที่ใช้บริการ',
              ),
            );
      });
    } catch (e) {}
  }

  void success(){
    Navigator.pushNamedAndRemoveUntil(context, MyConstant.rounteConfirmOrder, (route) => false);
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

  ShowTitle buildDateTime() {
    return ShowTitle(
      title: dateTimeStr == null ? 'dd/mm/yy HH:mm:ss' : dateTimeStr!,
      textStyle: MyConstant().h2Style(),
    );
  }

  ShowTitle buildHearder() {
    return ShowTitle(
      title: 'วันที่ชำระเงิน',
      textStyle: MyConstant().h1Style(),
    );
  }
}
