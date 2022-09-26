import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist3/food_menu_list3.1.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist3/food_menu_list3.2.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist3/food_menu_list3.3.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist3/food_menu_list3.4.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist3/food_menu_list3.5.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist3/food_menu_list3.6.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist3/food_menu_list3.7.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist3/food_menu_list3.8.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist3/food_menu_list3.9.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu3 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu3({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu3> createState() => _FoodMenu3State();
}

class _FoodMenu3State extends State<FoodMenu3> {
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
          Row(
            children: [
              ShowTitle(
                title: 'วิธีทำข้าวผัดทะเล',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
          ShowTitle(
            title:
                '1. ใส่เนยสดลงในกระทะ นำขึ้นตั้งไฟแรงพอร้อน ใส่หอมใหญ่ลงผัดจนมีกลิ่นหอม จากนั้นใส่กุ้งและปลาหมึกลงไปผัดจนสุก',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. ตอกไข่ลงไปยีพอแตก ใส่ข้าวสวย เกลือป่น พริกไทยป่น น้ำส้มสายชู และน้ำตาลทราย ผัดจนเข้ากัน ชิมรสตามชอบ ตักใส่จาน เสิร์ฟพร้อมมะนาวฝาน และแตงกวา',
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
                title: 'วัตถุดิบในการทำ ข้าวผัดทะเล',
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
                        FoodMenuList3_1(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '1.น้ำมันมรกต',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList3_2(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '2.หอมหัวใหญ่',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList3_3(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '3.ไข่ไก่',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList3_4(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '4.กุ้งขาว',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList3_5(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '5.ปลาหมึกกล้วย',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList3_6(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '6.พริกไทย',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList3_7(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '7.น้ำส้มสายชู ',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList3_8(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '8.น้ำตาลทราย',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList3_9(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '9.ต้นหอม',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
      ],
    );
  }

  ShowImage buildImage() => ShowImage(path: MyConstant.food3);

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'ข้าวผัดทะเล',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
