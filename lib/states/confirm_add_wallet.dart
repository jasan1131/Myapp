import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ConfirmAddWallet extends StatefulWidget {
  const ConfirmAddWallet({Key? key}) : super(key: key);

  @override
  State<ConfirmAddWallet> createState() => _ConfirmAddWalletState();
}

class _ConfirmAddWalletState extends State<ConfirmAddWallet> {
  String? dateTimeStr;
  File? file;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finedCurrentTime();
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
        title: Text('Confirm Add Wallet'),
        leading: IconButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, MyConstant.routeBuyerService, (route) => false),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
        onPressed: () {},
        child: Text('อัพโหลด บิล'),
      ),
    );
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
              child: file == null ? Image.asset(MyConstant.bill) : Image.file(file!),
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
      title: dateTimeStr == null ? 'dd/mm/yy HH:mm' : dateTimeStr!,
      textStyle: MyConstant().h2Style(),
    );
  }

  ShowTitle buildHearder() {
    return ShowTitle(
      title: 'Current Date Pay',
      textStyle: MyConstant().h1Style(),
    );
  }
}
