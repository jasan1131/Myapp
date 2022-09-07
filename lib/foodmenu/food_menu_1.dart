import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenuList1/food_menu_list1.1.dart';
import 'package:flutter_myappication_1/foodmenuList1/food_menu_list1.10.dart';
import 'package:flutter_myappication_1/foodmenuList1/food_menu_list1.11.dart';
import 'package:flutter_myappication_1/foodmenuList1/food_menu_list1.2.dart';
import 'package:flutter_myappication_1/foodmenuList1/food_menu_list1.3.dart';
import 'package:flutter_myappication_1/foodmenuList1/food_menu_list1.4.dart';
import 'package:flutter_myappication_1/foodmenuList1/food_menu_list1.5.dart';
import 'package:flutter_myappication_1/foodmenuList1/food_menu_list1.6.dart';
import 'package:flutter_myappication_1/foodmenuList1/food_menu_list1.7.dart';
import 'package:flutter_myappication_1/foodmenuList1/food_menu_list1.8.dart';
import 'package:flutter_myappication_1/foodmenuList1/food_menu_list1.9.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu1 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu1({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu1> createState() => _FoodMenu1State();
}

class _FoodMenu1State extends State<FoodMenu1> {
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
              buildhead(),
              buildImage(),
              buildStaple(),
              buildTitle(),
            ],
          ),
        ));
  }

  Widget buildImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ShowImage(path: MyConstant.food1),
        ],
      ),
    );
  }

  Widget buildhead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'ผัดซีอิ๊วหมู',
        textStyle: MyConstant().h1Style(),
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
                title: 'วิธีทำผัดซีอิ๊วหมู',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
          ShowTitle(
            title:
                '1. ใส่น้ำมันพืชและกระเทียมลงในชามกระเบื้อง คนผสมให้กระเทียมโดนน้ำมันจนทั่ว จากนั้นนำเข้าเตาไมโครเวฟ ใช้ไฟแรง เจียวกระเทียมประมาณ 2 นาที ยกออกจากเตา',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. ใส่หมู คนผสมเข้ากัน นำกลับเข้าเตาไมโครเวฟ นานประมาณ 1 นาที นำออกจากเตา',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3. ใส่เส้นก๋วยเตี๋ยว ซีอิ๊วดำ ซอสปรุงรส และน้ำตาลทราย คนผสมจนเข้ากัน นำกลับเข้าเตาไมโครเวฟ ประมาณ 2 นาที นำออกจากเตา ผัดให้เข้ากัน',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '4. ใส่ไข่ไก่ นำเข้าเตาไมโครเวฟ ประมาณ 1 นาที นำออกจากเตา ใส่คะน้าและแครอต คนให้เข้ากัน นำกลับเข้าไมโครเวฟ ประมาณ 2 นาที นำออกมา ผัดให้เข้ากันอีกครั้ง จากนั้นตักใส่จาน โรยพริกไทยป่น',
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
                title: 'วัตถุดิบในการทำ ผัดซีอิ๊วหมู',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodMenuList1_1(userModel: userModel!),
              )),
          child: ShowTitle(
            title: '1.น้ำมันมรกต',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodMenuList1_2(userModel: userModel!),
              )),
          child: ShowTitle(
            title: '2.กระเทียม',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodMenuList1_3(userModel: userModel!),
              )),
          child: ShowTitle(
            title: '3.หมูเนื้อแดงล้วน',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodMenuList1_4(userModel: userModel!),
              )),
          child: ShowTitle(
            title: '4.ก๋วยเตี๋ยวเส้นใหญ่ ',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodMenuList1_5(userModel: userModel!),
              )),
          child: ShowTitle(
            title: '5.ซีอิ๊วดำ',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodMenuList1_6(userModel: userModel!),
              )),
          child: ShowTitle(
            title: '6.ซอสปรุงรสฝาเขียว ตรา ภูเขาทอง(ขวดใหญ่)',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodMenuList1_7(userModel: userModel!),
              )),
          child: ShowTitle(
            title: '7.น้ำตาลทราย',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodMenuList1_8(userModel: userModel!),
              )),
          child: ShowTitle(
            title: '8.ไข่ไก่  ',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodMenuList1_9(userModel: userModel!),
              )),
          child: ShowTitle(
            title: '9.คะน้าต้น',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodMenuList1_10(userModel: userModel!),
              )),
          child: ShowTitle(
            title: '10.แครอต',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodMenuList1_11(userModel: userModel!),
              )),
          child: ShowTitle(
            title: '11.พริกไทย',
            textStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
