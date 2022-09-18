import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.1.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.10.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.11.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.12.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.13.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.14.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.15.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.2.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.3.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.4.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.5.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.6.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.7.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.8.dart';
import 'package:flutter_myappication_1/foodmenulist/foodmenulist6/food_menu_list6.9.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu6 extends StatefulWidget {
  final UserModel userModel;
  const FoodMenu6({Key? key, required this.userModel}) : super(key: key);

  @override
  State<FoodMenu6> createState() => _FoodMenu6State();
}

class _FoodMenu6State extends State<FoodMenu6> {
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
            title: 'วิธีทำสุกี้แห้ง',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title:
                '1. ตอกไข่ 3 ฟองลงในอ่างผสม ตีจนเข้ากัน ปรุงรสด้วยน้ำมันหอย ซีอิ๊วขาว น้ำมันงา และพริกไทยป่น คนจนเข้ากันดี',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. ทำน้ำหมักโดยผสมไข่ไก่ แป้งมัน พริกไทย น้ำตาลทรายแดง น้ำมันงา ซอสปรุงรส ซีอิ๊วขาว และน้ำเปล่า ใส่หมูนุ่ม ลูกชิ้นปลา เต้าหู้ปลา ปูอัด และกุ้งสด ลงไปหมัก คลุกให้เข้ากัน นำใส่ตู้เย็นอย่างน้อย 15 นาที',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3. ตั้งกระทะใส่น้ำมันพืช เอากระเทียมลงเจียวให้หอม ตักเครื่องหมักใส่ลงในกระทะ ผัดให้สุก ใส่ผักตามชอบ ตามด้วยวุ้นเส้นแช่น้ำ เติมน้ำจิ้มสุกี้ลงกระทะ ผัดให้เข้ากัน เสิร์ฟพร้อมน้ำจิ้มสุกี้',
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
                title: 'วัตถุดิบในการทำ สุกี้แห้ง',
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
                        FoodMenuList6_1(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '1.ไข่ไก่',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList6_2(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '2.น้ำมันหอยตราแม่ครัว',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList6_3(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '3.ซีอิ๊วขาวตราเด็กสมบูรณ์ สูตร 1',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList6_4(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '4.พริกไทย',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList6_5(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '5.เนื้อหมู',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList6_6(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '6.กุ้งขาว',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList6_7(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '7.น้ำมันมรกต',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList6_8(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '8.กระเทียม',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList6_9(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '9.ผักบุ้งจีน',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList6_10(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '10.ผักกาดขาว',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList6_11(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '11.เห็ดฟาง',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList6_12(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '12.ต้นหอม',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList6_13(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '13.น้ำจิ้มสุขกี้ ',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList6_14(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '14.วุ้นเส้นวุ้นเส้นตราต้นสน',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
        TextButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodMenuList6_15(userModel: userModel!),
                  ),
                ),
            child: ShowTitle(
              title: '15.รสดีหมู',
              textStyle: TextStyle(decoration: TextDecoration.underline),
            )),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food6),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'สุกี้แห้ง',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
