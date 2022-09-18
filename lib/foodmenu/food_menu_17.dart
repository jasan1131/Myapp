import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist17/food_menu_list17.1.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist17/food_menu_list17.2.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist17/food_menu_list17.3.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist17/food_menu_list17.4.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist17/food_menu_list17.5.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist17/food_menu_list17.6.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist17/food_menu_list17.7.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu17 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu17({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu17> createState() => _FoodMenu17State();
}

class _FoodMenu17State extends State<FoodMenu17> {
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
                title: 'วิธีทำน้ำตกหมู',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
          ShowTitle(
            title:
                '1. ใส่น้ำซุปลงในหม้อ นำขึ้นตั้งไฟ ใส่เนื้อหมูลงรวนพอสุก ยกลงจากเตา ',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. ใส่พริกป่นและข้าวคั่ว ปรุงรสด้วยน้ำมะนาวและน้ำปลา คนผสมให้เข้ากัน ชิมรสตามชอบ',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3. ใส่หอมแดงซอย ต้นหอมซอย ผักชีซอย ผักชีฝรั่งซอย และใบสะระแหน่ เคล้าผสมให้เข้ากันอีกครั้ง ตักใส่จาน เสิร์ฟ',
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
                title: 'วัตถุดิบในการทำ น้ำตกหมู',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList17_1(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '1.หมูสันนอก',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList17_2(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '2.พริกขี้หนู',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList17_3(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '3.มะนาว',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList17_4(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '4.น้ำปลา',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList17_5(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '5.หอมแดง',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList17_6(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '6.ต้นหอม',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList17_7(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '7.ใบสะระแหน่',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food17),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'น้ำตกหมู',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
