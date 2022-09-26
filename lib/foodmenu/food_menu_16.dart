import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist16/food_menu_list16.1.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist16/food_menu_list16.10.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist16/food_menu_list16.11.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist16/food_menu_list16.2.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist16/food_menu_list16.3.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist16/food_menu_list16.4.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist16/food_menu_list16.5.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist16/food_menu_list16.6.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist16/food_menu_list16.7.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist16/food_menu_list16.8.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist16/food_menu_list16.9.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu16 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu16({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu16> createState() => _FoodMenu16State();
}

class _FoodMenu16State extends State<FoodMenu16> {
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
    return Column(
      children: [
        ShowTitle(
          title: 'วิธีทำลาบหมู',
          textStyle: MyConstant().h2Style(),
        ),
        ShowTitle(
          title:
              '1. นำหมูรวนและตับใส่ในชามผสม ปรุงรสด้วยน้ำมะนาว น้ำปลา น้ำตาลทราย พริกป่น และข้าวคั่ว คลุกเคล้าให้เข้ากัน',
          textStyle: MyConstant().h3Style(),
        ),
        ShowTitle(
          title:
              '2. จากนั้นตามด้วย หอมแดงซอย ผักชีฝรั่ง และใบมะกรูดซอย คลุกเคล้าเบา ๆ อีกครั้ง',
          textStyle: MyConstant().h3Style(),
        ),
        ShowTitle(
          title:
              '3. ก่อนเสิร์ฟโรยด้วยใบมะกรูดซอยและใบสะระแหน่ แต่งด้วยมะเขือเทศ',
          textStyle: MyConstant().h3Style(),
        ),
      ],
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
                title: 'วัตถุดิบในการทำ ลาบหมู',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList16_1(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '1.หมูเนื้อแดงล้วน',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList16_2(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '2.ตับหมู',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList16_3(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '3.หอมแดง',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList16_4(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '4.ผักชีฝรั่ง',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList16_5(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '5.น้ำปลา',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList16_6(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '6.มะนาว ',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList16_7(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '7.น้ำตาลทราย ',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList16_8(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '8.พริกขี้หนู',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList16_9(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '9.ใบมะกรูด',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList16_10(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '10.ผักกาดขาว',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList16_11(userModel: userModel!),
            ),
          ),
          child: ShowTitle(
            title: '11.มะเขือเทศราชินี',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food16),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'ลาบหมู',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
