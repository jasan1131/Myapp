import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist11/food_menu_list11.1.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist11/food_menu_list11.2.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist11/food_menu_list11.3.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist11/food_menu_list11.4.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist11/food_menu_list11.5.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist11/food_menu_list11.6.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist11/food_menu_list11.7.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu11 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu11({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu11> createState() => _FoodMenu11State();
}

class _FoodMenu11State extends State<FoodMenu11> {
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
            title: 'วิธีทำหมูผัดน้ำมันหอย',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title:
                '1. เอาหมูหมักกับน้ำมันหอย และซีอิ๊วขาวทิ้งไว้ ระหว่างนั้นเราก็ไปหั่นผัก สับกระเทียมไว้ครับเป็นการใช้เวลาให้คุ้มค่า(เกี่ยวไหมเนี่ย)',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. ใส่น้ำมันลงในกระทะ รอให้น้ำมันร้อนสักแปบนึง ใส่กระเทียมลงไป พอกระเทียมเริ่มส่งกลิ่นหอมมาเตะจมูก ใส่หมูที่เราหมักไว้แล้วลงไป',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3. ผัด ๆ  จนหมูเริ่มสุกก็เติมน้ำเปล่าลงไปประมาณ 1/2 ช้อนโต๊ะครับ เติมเครื่องปรุงอื่นๆ ลงไป',
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
                title: 'วัตถุดิบในการทำ หมูผัดน้ำมันหอย',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList11_1(userModel: userModel!),
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
              builder: (context) => FoodMenuList11_2(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '2.กระเทียม',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList11_3(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '3.ต้นหอม',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList11_4(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '4.น้ำมันหอยตราแม่ครัว',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList11_5(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '5.ซีอิ๊วขาวตราเด็กสมบูรณ์ สูตร 1',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList11_6(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '6.น้ำตาล',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList11_7(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '7.พริกไทย',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food11),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'หมูผัดน้ำมันหอย',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
