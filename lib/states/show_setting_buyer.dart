import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/bodys/show_about_appcation_buyer.dart';
import 'package:flutter_myappication_1/bodys/show_buyer_manage.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class ShowSettingBuyer extends StatefulWidget {
  final UserModel userModel;
  const ShowSettingBuyer({Key? key, required this.userModel}) : super(key: key);

  @override
  State<ShowSettingBuyer> createState() => _ShowSettingBuyerState();
}

class _ShowSettingBuyerState extends State<ShowSettingBuyer> {
  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyConstant.primary,
          title: Text('ตั้งค่า'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            buildManage(context),
            buildAboutAppcation(context),
            buildVersionAppication(context)
          ],
        ));
  }

  Widget buildManage(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowManageBuyer(userModel: userModel!),
          )),
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Card(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowTitle(
              title: 'ข้อมูลส่วนตัว',
              textStyle: MyConstant().h2Style(),
            ),
          ],
        )),
      ),
    );
  }

  Widget buildAboutAppcation(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowAboutAppcationBuyer(),
          )),
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Card(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowTitle(
              title: 'เกี่ยวกับแอปพลิเคชัน',
              textStyle: MyConstant().h2Style(),
            ),
          ],
        )),
      ),
    );
  }

  Widget buildVersionAppication(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MyDialog().normalDialog1(context, 'เวอร์ชั่นแอปพลิเคชัน', 'แอปพลิเคชันเป็นเวอร์ชันล่าสุด');
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Card(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowTitle(
              title: 'เวอร์ชั่น 1.0.0+1',
              textStyle: MyConstant().h2Style(),
            ),
          ],
        )),
      ),
    );
  }
}
