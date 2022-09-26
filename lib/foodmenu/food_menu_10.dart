import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist10/food_menu_list10.1.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist10/food_menu_list10.2.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist10/food_menu_list10.3.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist10/food_menu_list10.4.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist10/food_menu_list10.5.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist10/food_menu_list10.6.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist10/food_menu_list10.7.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist10/food_menu_list10.8.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu10 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu10({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu10> createState() => _FoodMenu10State();
}

class _FoodMenu10State extends State<FoodMenu10> {
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
            MyConstant().mySizeBox()
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
            title: 'วิธีทำข้าวคะน้าหมูกรอบ',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title:
                '1. ล้างผักคะน้าให้สะอาด พักให้สะเด็ดน้ำ หั่นเป็นชิ้นตามชอบ เตรียมไว้',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. ใส่คะน้า หมูกรอบ พริกขี้หนู กระเทียมสับ น้ำมันหอย เต้าเจี้ยว และน้ำตาลทราย ลงในอ่างผสม เตรียมไว้',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3. ใส่น้ำมันพืชลงในกระทะ เปิดไฟแรง พอน้ำมันร้อนจัดใส่ผักลงไป ผัดพอสุก ประมาณ 30 วินาที ราดข้าว พร้อมเสิร์ฟ',
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
                title: 'วัตถุดิบในการทำ ข้าวคะน้าหมูกรอบ',
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
                        FoodMenuList10_1(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '1.คะน้า   ',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList10_2(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '2.หมุสามชั้น',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList10_3(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '3.พริกขี้หนู',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList10_4(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '4.กระเทียม',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList10_5(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '5.น้ำมันหอยตราแม่ครัว',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList10_6(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '6.เต้าเจี้ยวตราเด็กสมบูรณ์ สูตร 1',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList10_7(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '7.น้ำตาลทราย',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList10_8(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '8.น้ำมันมรกรต',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food10),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'ข้าวคะน้าหมูกรอบ',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
