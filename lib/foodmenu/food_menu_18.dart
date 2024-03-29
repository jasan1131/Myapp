import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist18/food_menu_list18.1.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist18/food_menu_list18.2.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist18/food_menu_list18.3.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist18/food_menu_list18.4.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist18/food_menu_list18.5.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist18/food_menu_list18.6.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist18/food_menu_list18.7.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu18 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu18({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu18> createState() => _FoodMenu18State();
}

class _FoodMenu18State extends State<FoodMenu18> {
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
            title: 'วิธีทำแกงจืดไข่น้ำ',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title: '1. ใส่ซอสปรุงรสลงในหมูสับ คลุกเคล้าให้เข้ากันแล้วพักไว้',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title: '2. ตอกไข่ใส่ชามผสม เดี๋ยวเราไปทอดไข่เจียวกันค่ะ',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title: '3. ตีไข่แดงไข่ขาวให้เข้ากัน ไม่ต้องปรุงรสอะไรเลยค่ะ',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '4. ใส่น้ำมันลงไป ตั้งกระทะให้น้ำมันร้อน กลิ้งให้เคลือบด้านข้างด้วย ไข่จะได้ไม่ติดกระทะ ส่วนใครใช้กระทะเทฟล่อนก็ไม่ต้องใช้น้ำมันเยอะ',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title: '5. น้ำมันร้อนดีแล้วก็ใส่ไข่ลงไปทอดให้เหลืองสวย',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title: '6. กลับด้าน ทอดไข่ให้สุกทั้ง 2 ด้าน',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title: '7. เมื่อสุกดีแล้วก็ปิดเตา ใช้ตะหลิวหั่นให้เป็นชิ้น ๆ',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '8. พักไว้ในจานที่รองด้วยกระดาษทิชชู่อเนกประสงค์เพื่อซับน้ำมัน อย่าใช้ทิชชู่ทั่วไปเน้อ เดี๋ยวจะกลายเป็นไข่เจียวทิชชู่ เพราะมันจะเกาะติดดึงออกยาก',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title: '9. ปั้นหมูที่เราหมักไว้ใส่ลงไปในน้ำซุป ต้มให้หมูสุก',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title: '10. รอให้น้ำเดือด และหมูสุกดีแล้ว ใส่ไข่เจียวลงไป',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title: '11. โรยต้นหอมผักชี ปิดเตา',
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
                title: 'วัตถุดิบในการทำ แกงจืดไข่น้ำ',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList18_1(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '1.ไข่ไก่      ',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList18_2(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '2.น้ำมันพืช',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList18_3(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '3.หมูเนื้อแดงล้วน',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList18_4(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '4.ซอสปรุงรสฝาเขียว',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList18_5(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '5.ผักชีฝรั่ง',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList18_6(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '6.ต้นหอม',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList18_7(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '7.รสดีหมู',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food18),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'แกงจืดไข่น้ำ',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
