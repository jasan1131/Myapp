import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist4/fodo_menu_list4.1.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.10.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.11.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.12.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.13.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.14.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.15.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.16.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.17.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.2.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.3.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.4.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.5.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.6.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.7.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.8.dart';
import 'package:flutter_myappication_1/foodmenulist4/food_menu_list4.9.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu4 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu4({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu4> createState() => _FoodMenu4State();
}

class _FoodMenu4State extends State<FoodMenu4> {
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
            buildTitle(context),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowTitle(
            title: 'วิธีทำข้าวผัดต้มยำ',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title:
                '1. เจียวพริกขี้หนูและกระเทียมในน้ำมันร้อน ๆ แล้วใส่กุ้งสดตามลงไปผัด',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. ใส่ข่า ตะไคร้ ใบมะกรูด หอมแดง มะเขือเทศ และเห็ดฟาง ผัดให้เข้ากัน',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3. ปรุงรสด้วยซีอิ๊วขาว ซุปก้อน ซอสหอยนางรม น้ำตาลทราย น้ำมะนาว และน้ำพริกเผา',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '4. ใส่ข้าวสวยลงไปผัดให้เข้ากัน โรยด้วยพริกไทยกับต้นหอมซอย ผัดจนเข้ากัน ตักใส่จาน',
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
                title: 'วัตถุดิบในการทำ ข้าวผัดต้มยำ',
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
                        FoodMenuList4_1(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '1.พริกขี้หนู',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList4_2(userModel: userModel!),
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
                        FoodMenuList4_3(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '3.น้ำมันโอลีน',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList4_4(userModel: userModel!),
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
                        FoodMenuList4_5(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '5.ข่า              ',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList4_6(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '6.ตะไคร้ ',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList4_7(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '7.ใบมะกรูด',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList4_8(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '8.หอมแดง',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList4_9(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '9.มะเขือเทศ',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList4_10(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '10.เห็ดฟาง',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList4_11(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '11.รสดีหมู',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList4_12(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '12.ซอสหอยนางรม',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList4_13(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '13.น้ำตาลทราย',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList4_14(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '14.มะนาว',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
          onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList4_15(userModel: userModel!),
                  ),
                ),
          child: ShowTitle(
            title: '15.น้ำพริกเผาตราแม่ประนอม',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList4_16(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '16.พริกไทย',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList4_17(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '17.ต้นหอม',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food4),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'ข้าวผัดต้มยำ',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
