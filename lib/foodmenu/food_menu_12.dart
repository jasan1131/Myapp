import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist12/food_menu_list12.1.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist12/food_menu_list12.2.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist12/food_menu_list12.3.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist12/food_menu_list12.4.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist12/food_menu_list12.5.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist12/food_menu_list12.6.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist12/food_menu_list12.7.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist12/food_menu_list12.8.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu12 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu12({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu12> createState() => _FoodMenu12State();
}

class _FoodMenu12State extends State<FoodMenu12> {
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
            title: 'วิธีทำหมี่ผัดผักกระเฉด',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title:
                '1. ตำพริกและกระเทียมแบบหยาบ ๆ และนำมันกุ้งมาผสมน้ำเปล่า น้ำปลา และน้ำมะนาว ให้ได้รสชาติตามที่ต้องการ',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. ตั้งน้ำในกระทะให้เดือดจัด แล้วนำเส้นหมี่ขาวที่แช่น้ำแล้วใส่ลงไปในน้ำเดือด จากนั้นนับ 1-10 ในใจ เมื่อครบแล้วก็ปิดไฟ นำกระชอนช้อนเส้นหมี่ขาวออกแล้วราดน้ำเย็น หรือเปิดน้ำเปล่าผ่านเส้นเพื่อหยุดความสุก สะเด็ดน้ำออก แล้วพักเส้นไว้ก่อน',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3. ตั้งกระทะเทน้ำมันใส่ลงไป พอร้อนใส่พริกและกระเทียมลงไปผัดให้เข้ากัน เทเครื่องปรุงมันกุ้งลงในกระทะแล้วคนให้เข้ากัน ใส่น้ำตาลปี๊บเคี่ยวจนละลาย ปรุงรสตามชอบ',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '4. ใส่กุ้งกับปลาหมึกลงไปผัด ใส่เส้นตามทันที ผัดจนเข้ากัน ดันเส้นที่ผัดแล้วไว้ข้างกระทะ แล้วใส่ผักกระเฉดลงไป กลบผักกระเฉดด้วยเส้นหมี่ขาว ทิ้งไว้ประมาณครึ่งนาที  ปิดไฟ คลุกเคล้าส่วนผสมทั้งหมดเข้าด้วยกัน',
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
                title: 'วัตถุดิบในการทำ หมี่ผัดผักกระเฉด',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList12_1(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '1.เส้นหมี่อบแห้ง ตราไวไว',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList12_2(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '2.ผักกระเฉด',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList12_3(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '3.กุ้ง         ',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList12_4(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '4.ปลาหมึกกล้วย',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList12_5(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '5.กระเทียม',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList12_6(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '6.พริกขี้หนู',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList12_7(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '7.มะนาว',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList12_8(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '8.น้ำมันมรกต',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food12),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'หมี่ผัดผักกระเฉด',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
