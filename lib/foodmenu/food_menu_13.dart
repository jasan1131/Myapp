import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist13/food_menu_list13.1.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist13/food_menu_list13.10.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist13/food_menu_list13.2.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist13/food_menu_list13.3.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist13/food_menu_list13.4.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist13/food_menu_list13.5.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist13/food_menu_list13.6.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist13/food_menu_list13.7.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist13/food_menu_list13.8.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist13/food_menu_list13.9.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu13 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu13({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu13> createState() => _FoodMenu13State();
}

class _FoodMenu13State extends State<FoodMenu13> {
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
        children: [
          Row(
            children: [
              ShowTitle(
                title: 'วิธีทำผัดเปรี้ยวหวานหมู',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
          ShowTitle(
            title:
                '1.	เจียวกระเทียมสับในน้ำมันพืชจนหอม ใส่เนื้อหมูลงไปผัดจนสุก',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2.	ใส่สับปะรด แตงกวา หอมใหญ่ พริกฝรั่ง ต้นหอม และมะเขือเทศ ลงไปผัดจนสุก',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3.	ปรุงรสด้วยซอสมะเขือเทศ น้ำตาลทราย และเกลือป่น ใส่น้ำเปล่าลงไปเล็กน้อย ผัดให้เข้ากัน ชิมรสตามชอบ พร้อมเสิร์ฟ',
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
                title: 'วัตถุดิบในการทำ ผัดเปรี้ยวหวานหมู',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList13_1(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '1.กระเทียม',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList13_2(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '2.หมูเนื้อแดงล้วน',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList13_3(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '3.สับปะรด',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList13_4(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '4.แตงกวา',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList13_5(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '5.หอมใหญ่',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList13_6(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '6.มะเขือเทศ',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList13_7(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '7.ซอสมะเขือเทศ',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList13_8(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '8.น้ำตาลทราย',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList13_9(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '9.น้ำปลา',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList13_10(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '10.น้ำมันมรกต',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food13),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'ผัดเปรี้ยวหวานหมู',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
