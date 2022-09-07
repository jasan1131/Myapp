import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist5/food_menu_list5.1.dart';
import 'package:flutter_myappication_1/foodmenulist5/food_menu_list5.2.dart';
import 'package:flutter_myappication_1/foodmenulist5/food_menu_list5.3.dart';
import 'package:flutter_myappication_1/foodmenulist5/food_menu_list5.4.dart';
import 'package:flutter_myappication_1/foodmenulist5/food_menu_list5.5.dart';
import 'package:flutter_myappication_1/foodmenulist5/food_menu_list5.6.dart';
import 'package:flutter_myappication_1/foodmenulist5/food_menu_list5.7.dart';
import 'package:flutter_myappication_1/foodmenulist5/food_menu_list5.8.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu5 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu5({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu5> createState() => _FoodMenu5State();
}

class _FoodMenu5State extends State<FoodMenu5> {
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
                title: 'วิธีทำสุกี้น้ำ',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
          ShowTitle(
            title:
                '1. ตั้งน้ำซุปใส่หม้อใบย่อม ๆ พอน้ำซุปเดือดใส่พวกหมูหรือเนื้อต่าง ๆ ที่หมักไว้ลงในหม้อ รอเดือด',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. ใส่ผักต่าง ๆ ตามชอบ เพิ่มความเข้มข้นของน้ำซุปด้วยไข่ตีแตกอีกสัก 1 ฟอง ตอกใส่หม้อแล้วคน ๆ ให้เข้ากัน',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3. ใส่วุ้นเส้นแช่น้ำลงไป เติมน้ำจิ้มสุกี้ คนให้เข้ากัน ตักเสิร์ฟ',
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
                title: 'วัตถุดิบในการทำ สุกี้น้ำ',
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
                        FoodMenuList5_1(userModel: userModel!),
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
                        FoodMenuList5_2(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '2.ไข่ไก่    ',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList5_3(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '3.วุ้นเส้นตราต้นสน',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
            TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList5_4(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '4.กุ้ง          ',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
            TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList5_5(userModel: userModel!),
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
                        FoodMenuList5_6(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '6.น้ำจิ้มสุกี้พันท้าย',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList5_7(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '7.ผักกาดขาว',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList5_8(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '8.ผักบุ้งจีน',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food5),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'สุกี้น้ำ',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
