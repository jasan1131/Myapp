import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist2/food_menu_list2.1.dart';
import 'package:flutter_myappication_1/foodmenulist2/food_menu_list2.2.dart';
import 'package:flutter_myappication_1/foodmenulist2/food_menu_list2.3.dart';
import 'package:flutter_myappication_1/foodmenulist2/food_menu_list2.4.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu2 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu2({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu2> createState() => _FoodMenu2State();
}

class _FoodMenu2State extends State<FoodMenu2> {
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
          Row(
            children: [
              ShowTitle(
                title: 'วิธีทำข้าวไข่เจียว',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
          ShowTitle(
            title:
                '1. ตอกไข่ใส่ชาม ปรุงรสด้วยน้ำมันหอยกับซอสปรุงรส ใส่ต้นหอม ตีจนเข้ากัน',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. ตั้งกระทะใส่น้ำมันพืช พอน้ำมันร้อนเทไข่ลงไป ทอดจนสุกทั้งสองด้าน',
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
          padding: const EdgeInsets.only(top: 8, left: 8),
          child: Row(
            children: [
              ShowTitle(
                title: 'วัตถุดิบในการทำ ข้าวไข่เจียว',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList2_1(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '1.ไข่ไก่',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList2_2(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '2.น้ำมันหอย',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList2_3(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '3.ซอสปรุงรสฝาเขียว',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList2_4(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '4.ต้นหอม',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food2),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'ข้าวไข่เจียว',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
