import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist7/food_menu_list7.1.dart';
import 'package:flutter_myappication_1/foodmenulist7/food_menu_list7.2.dart';
import 'package:flutter_myappication_1/foodmenulist7/food_menu_list7.3.dart';
import 'package:flutter_myappication_1/foodmenulist7/food_menu_list7.4.dart';
import 'package:flutter_myappication_1/foodmenulist7/food_menu_list7.5.dart';
import 'package:flutter_myappication_1/foodmenulist7/food_menu_list7.6.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu7 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu7({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu7> createState() => _FoodMenu7State();
}

class _FoodMenu7State extends State<FoodMenu7> {
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
                title: 'วิธีทำข้าวหมูกระเทียม',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
          ShowTitle(
            title: '1. โขลกกระเทียม พริกไทยดำและเกลือทะเล เข้าด้วยกันจนละเอียด',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. นำส่วนผสมโขลกไว้ลงไปผสมคลุกเคล้ากับเนื้อหมู ใส่ซีอิ๊วขาว น้ำตาลทราย และน้ำมันพืช คลุกเคล้าให้ส่วนผสมเข้ากัน หมักทิ้งไว้ 30 นาที ถึง 1 ชั่วโมง',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3. นำกระทะขึ้นตั้งไฟ ใส่น้ำมันพืชลงไปเล็กน้อย พอร้อนใส่หมูที่หมักไว้ลงไปทอดให้สุกเหลือง ตักราดลงบนข้าวสวยร้อน ๆ เสิร์ฟพร้อมแตงกวาและพริกน้ำปลา',
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
                title: 'วัตถุดิบในการทำ ข้าวหมูกระเทียม',
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
                        FoodMenuList7_1(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '1.หมูเนื้อแดงล้วน',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList7_2(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '2.กระเทียม',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList7_3(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '3.น้ำมันมรกต',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList7_4(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '4.ซีอิ๊วขาวตราเด็กสมบูรณ์ สูตร 1',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList7_5(userModel: userModel!),
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
                        FoodMenuList7_6(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '6.แตงกวา',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food7),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'ข้าวหมูกระเทียม',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
