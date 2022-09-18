import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist15/food_menu_list15.1.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist15/food_menu_list15.2.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist15/food_menu_list15.3.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist15/food_menu_list15.4.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist15/food_menu_list15.5.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist15/food_menu_list15.6.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu15 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu15({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu15> createState() => _FoodMenu15State();
}

class _FoodMenu15State extends State<FoodMenu15> {
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
            title: 'วิธีทำผัดกะหล่ำปลีหมูกรอบ',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title:
                '1.	ตั้งกระทะใส่น้ำมันบนไฟปานกลาง ใส่กระเทียมผัดจนหอม ใส่หมู แครอทผัดให้เข้ากัน',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2.	ใส่กะหล่ำปลีที่หั่นเตรียมไว้ เร่งเป็นไฟแรง เติมน้ำเล็กน้อย',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3.	ปรุงรสให้กลมกล่อมด้วย “รสดี” รสหมู ผัดให้เข้ากันอีกครั้ง ปิดไฟ ตักใส่จาน พร้อมเสิร์ฟ',
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
                title: 'วัตถุดิบในการทำ ผัดกะหล่ำปลีหมูกรอบ',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList15_1(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '1.กะหล่ำปลีเขียว',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList15_2(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '2.รสดีหมู',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList15_3(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '3.แครอท',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList15_4(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '4.หมูเนื้อแดงล้วน',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList15_5(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '5.กระเทียม',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList15_6(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '6.น้ำมันมรกต',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food15),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'ผัดกะหล่ำปลีหมูกรอบ',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
