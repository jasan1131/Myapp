import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_1.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_10.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_11.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_12.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_13.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_14.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_15.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_16.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_17.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_18.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_19.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_2.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_20.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_3.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_4.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_5.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_6.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_7.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_8.dart';
import 'package:flutter_myappication_1/foodmenu/food_menu_9.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class ShowMenuFood extends StatefulWidget {
  final UserModel userModel;
  const ShowMenuFood({Key? key, required this.userModel}) : super(key: key);

  @override
  State<ShowMenuFood> createState() => _ShowMenuFoodState();
}

class _ShowMenuFoodState extends State<ShowMenuFood> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildFood1(context),
            buildFood2(context),
            buildFood3(context),
            buildFood4(context),
            buildFood5(context),
            buildFood6(context),
            buildFood7(context),
            buildFood8(context),
            buildFood9(context),
            buildFood10(context),
            buildFood11(context),
            buildFood12(context),
            buildFood13(context),
            buildFood14(context),
            buildFood15(context),
            buildFood16(context),
            buildFood17(context),
            buildFood18(context),
            buildFood19(context),
            buildFood20(context),
          ],
        ),
      ),
    );
  }

  Widget buildFood1(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu1(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food1,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'ผัดซีอิ๊วหมู  ',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood2(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu2(
              userModel: userModel!,
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food2,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'ข้าวไข่เจียว',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood3(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu3(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food3,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'ข้าวผัดทะเล',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood4(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu4(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food4,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'ข้าวผัดต้มยำ',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood5(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu5(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food5,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'สุกี้น้ำ',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood6(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu6(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food6,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'สุกี้แห้ง',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood7(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu7(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food7,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'ข้าวหมูกระเทียม',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood8(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu8(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food8,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'ข้าวผัดพริกแกงหมู',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood9(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu9(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food9,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'มะกะโรนีผัดซอส',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood10(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu10(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food10,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'ข้าวคะน้าหมูกรอบ',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood11(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu11(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food11,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'หมูผัดน้ำมันหอย',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood12(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu12(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food12,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'หมี่ผัดผักกระเฉด',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood13(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu13(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food13,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'ผัดเปรี้ยวหวานหมู',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood14(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu14(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food14,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'กะเพราหมูสับ',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood15(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu15(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food15,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'ผัดกะหล่ำปลีหมูกรอบ',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood16(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu16(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food16,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'ลาบหมู',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood17(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu17(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food17,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'น้ำตกหมู',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood18(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu18(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food18,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'แกงจืดไข่น้ำ',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood19(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu19(userModel: userModel!),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food19,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'หอยลายผัดน้ำพริกเผา',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFood20(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodMenu20(userModel: userModel!,),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                MyConstant.food20,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              ShowTitle(
                title: 'ผัดผักรวมมิตร',
                textStyle: MyConstant().h3Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
