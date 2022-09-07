import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist8/food_menu_list8.1.dart';
import 'package:flutter_myappication_1/foodmenulist8/food_menu_list8.2.dart';
import 'package:flutter_myappication_1/foodmenulist8/food_menu_list8.3.dart';
import 'package:flutter_myappication_1/foodmenulist8/food_menu_list8.4.dart';
import 'package:flutter_myappication_1/foodmenulist8/food_menu_list8.5.dart';
import 'package:flutter_myappication_1/foodmenulist8/food_menu_list8.6.dart';
import 'package:flutter_myappication_1/foodmenulist8/food_menu_list8.7.dart';
import 'package:flutter_myappication_1/foodmenulist8/food_menu_list8.8.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu8 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu8({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu8> createState() => _FoodMenu8State();
}

class _FoodMenu8State extends State<FoodMenu8> {
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
        centerTitle: true,
        title: Text('เมนูอาหาร'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHead(),
            buildImage(),
            buildStaple(),
            buildTitle(),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowTitle(
            title: 'วิธีทำข้าวผัดพริกแกงหมู',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title:
                '1. ลวกถั่วฝักยาวในน้ำเดือด ประมาณ 20 วินาที ตักขึ้นใส่ลงแช่ในน้ำเย็น ตักขึ้นสะเด็ดน้ำ เตรียมไว้',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. ใส่น้ำมันพืชลงในกระทะ นำขึ้นตั้งไฟปานกลางพอร้อน ใส่น้ำพริกแกงลงผัดจนหอม ปรุงรสด้วยน้ำปลาและน้ำตาลปี๊บ จากนั้นใส่หมูลงผัดจนสุก ใส่ถั่วฝักยาวและใบมะกรูดลงผัดสักครู่ ราดข้าว พร้อมเสิร์ฟ',
            textStyle: MyConstant().h3Style(),
          ),
        ],
      ),
    );
  }

  Widget buildStaple() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ShowTitle(
                title: 'วัตถุดิบในการทำ ข้าวผัดพริกแกงหมู',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList8_1(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '1.ถั่วฝักยาว',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList8_2(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '2.น้ำมันมรกต',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList8_3(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '3.น้ำปลาตราหน่อไม้ ',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList8_4(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '4.พริกแกง',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList8_5(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '5.น้ำตาลทราย',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList8_6(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '6.หมูเนื้อแดงล้วน',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList8_7(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '7.ใบมะกรูด',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList8_8(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '8.พริกจินดาแดง',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food8),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'ข้าวผัดพริกแกงหมู',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
