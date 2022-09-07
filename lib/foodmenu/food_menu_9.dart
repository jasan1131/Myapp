import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist9/food_menu_list9.1.dart';
import 'package:flutter_myappication_1/foodmenulist9/food_menu_list9.2.dart';
import 'package:flutter_myappication_1/foodmenulist9/food_menu_list9.3.dart';
import 'package:flutter_myappication_1/foodmenulist9/food_menu_list9.4.dart';
import 'package:flutter_myappication_1/foodmenulist9/food_menu_list9.5.dart';
import 'package:flutter_myappication_1/foodmenulist9/food_menu_list9.6.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu9 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu9({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu9> createState() => _FoodMenu9State();
}

class _FoodMenu9State extends State<FoodMenu9> {
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
            title: 'วิธีทำมะกะโรนีผัดซอส',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title:
                '1. ต้มน้ำให้เดือด ใส่มะกะโรนีลงไปต้มประมาณ 5 นาที เสร็จแล้วแช่ทิ้งไว้ในน้ำร้อนประมาณ 5 นาที จนนิ่มตามชอบ ตักขึ้นใส่ตะแกรงพักให้สะเด็ดน้ำ',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. ตั้งกระทะให้ร้อน ใส่น้ำมันลงไป ใส่เนื้อสัตว์ลงไปผัดพอสุก ตามด้วยหอมใหญ่และมะเขือเทศ',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3. พอผักเริ่มนิ่มแล้วตอกไข่ใส่ลงไป คลุกเคล้าให้เข้ากันดีจนไข่สุก',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '4. ใส่มะกะโรนีลงไป ตามด้วยซอสมะเขือเทศ ปรุงรสด้วยเกลือป่น ผัดคลุกเคล้าให้เข้ากัน ใส่ต้นหอมลงไปคลุกเคล้าให้เข้ากันดี ตักใส่จานเสิร์ฟ',
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
                title: 'วัตถุดิบในการทำ มะกะโรนีผัดซอส',
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
                        FoodMenuList9_1(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '1.มักกะโรนี',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList9_2(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '2.อกไก่',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList9_3(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '3.หอมหัวใหญ่',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList9_4(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '4.มะเขือเทศผลใหญ่',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList9_5(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '5.ไข่ไก่   ',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList9_6(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '6.ต้นหอม',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food9),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'มะกะโรนีผัดซอส',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
