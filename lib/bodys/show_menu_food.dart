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
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class ShowMenuFood extends StatefulWidget {
  const ShowMenuFood({Key? key}) : super(key: key);

  @override
  State<ShowMenuFood> createState() => _ShowMenuFoodState();
}

class _ShowMenuFoodState extends State<ShowMenuFood> {
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
            builder: (context) => FoodMenu1(),
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
            builder: (context) => FoodMenu2(),
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
            builder: (context) => FoodMenu3(),
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
            builder: (context) => FoodMenu4(),
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
            builder: (context) => FoodMenu5(),
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
            builder: (context) => FoodMenu6(),
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
            builder: (context) => FoodMenu7(),
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
            builder: (context) => FoodMenu8(),
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
            builder: (context) => FoodMenu9(),
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
            builder: (context) => FoodMenu10(),
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
            builder: (context) => FoodMenu11(),
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
                title: 'ผัดไทย',
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
            builder: (context) => FoodMenu12(),
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
            builder: (context) => FoodMenu13(),
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
                title: 'ยำมาม่ารวมมิตร',
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
            builder: (context) => FoodMenu14(),
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
            builder: (context) => FoodMenu15(),
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
                title: 'ยำวุ้นเส้นรวมมิตร',
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
            builder: (context) => FoodMenu16(),
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
            builder: (context) => FoodMenu17(),
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
            builder: (context) => FoodMenu18(),
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
                title: 'สันคอหมูย่าง',
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
            builder: (context) => FoodMenu19(),
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
                title: 'ปีกไก่ทอดโคล่า',
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
            builder: (context) => FoodMenu20(),
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
