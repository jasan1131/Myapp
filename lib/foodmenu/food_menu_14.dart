import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist14/food_menu_list14.1.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist14/food_menu_list14.2.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist14/food_menu_list14.3.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist14/food_menu_list14.4.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist14/food_menu_list14.5.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist14/food_menu_list14.6.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist14/food_menu_list14.7.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist14/food_menu_list14.8.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist14/food_menu_list14.9.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu14 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu14({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu14> createState() => _FoodMenu14State();
}

class _FoodMenu14State extends State<FoodMenu14> {
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
            buildHeda(),
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
            title: 'วิธีทำกะเพราหมูสับ',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title: '1.	โขลกพริกและกระเทียมพอหยาบๆ เพื่อกระจายความเผ็ด',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2.	เทน้ำมันพืชลงในกระทะ จากนั้นตั้งไฟปานกลาง ใส่พริก กระเทียมที่โขลกเตรียมไว้ลงไปผัดจนกระเทียมจนสีเหลืองทอง มีกลิ่นหอม',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3.	นำหมูบดลงใส่กระทะ ผัดให้สุกทั่วถึง ตามด้วยเครื่องปรุงรสทั้งหมด ได่แก่ น้ำปลา น้ำตาล ซีอิ๊วขาว ซีอิ๊วดำ และน้ำมันหอย คลุกให้ซอสเข้ากันกับเนื้อหมู ตามด้วยน้ำซุป/น้ำเปล่า เพื่อเพิ่มความฉ่ำ ไม่จำเป็นต้องใส่หากชอบผัดแบบแห้ง',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '4.	หากต้องการเติมผักประเภทอื่นๆ ใส่ลงในกระทะแล้วผัดต่อประมาณ 2-3 นาที',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '5.	เติมใบกะเพราทันทีหลังปิดไฟ ผัดใบกะเพราให้ได้ความร้อนเล็กน้อย',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title: '6.	ตักกะเพราเสิร์ฟพร้อมข้าวสวย และวางไข่ดาว เป็นอันเสร็จ',
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
                title: 'วัตถุดิบในการทำ กะเพราหมูสับ',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList14_1(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '1.หมูเนื้อแดงล้วน',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList14_2(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '2.กระเทียม',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList14_3(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '3.พริกจินดาแดง',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList14_4(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '4.น้ำปลา',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList14_5(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '5.ซีอิ๊วขาว',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList14_6(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '6.ซีอิ๊วดำ',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList14_7(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '7.น้ำมันหอยตราแม่ครัว',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList14_8(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '8.ใบกะเพรา',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuList14_9(userModel: userModel!),
            ),
          ),
          child: ShowTitle(title: '9.น้ำมันมรกต',
            textStyle: TextStyle(decoration: TextDecoration.underline),),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food14),
      );

  Widget buildHeda() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'กะเพราหมูสับ',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
