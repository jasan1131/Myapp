import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/type/type_condiment.dart';
import 'package:flutter_myappication_1/type/type_dried_food.dart';
import 'package:flutter_myappication_1/type/type_fruit.dart';
import 'package:flutter_myappication_1/type/type_meet.dart';
import 'package:flutter_myappication_1/type/type_vegetable.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class BuyerProductType extends StatefulWidget {
  final UserModel userModel;
  const BuyerProductType({Key? key, required this.userModel}) : super(key: key);

  @override
  State<BuyerProductType> createState() => _BuyerProductTypeState();
}

class _BuyerProductTypeState extends State<BuyerProductType> {
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
        child: Container(
          decoration: MyConstant().gradientRadioBackground(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTypeVegatable(context),
                    buildTypeFruit(context),
                    buildTypeMeet(context),
                    buildTypeDriedFood(context),
                    buildTypeCondiment(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTypeVegatable(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TypeVegatables(userModel: userModel!),
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ShowTitle(
                  title: 'ผัก ',
                  textStyle: MyConstant().h2BackStyle(),
                ),
              ),
              Container(
                child: Image.asset(
                  MyConstant.vegetable,
                  width: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTypeFruit(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TypeFruit(userModel: userModel!),
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ShowTitle(
                  title: 'ผลไม้ ',
                  textStyle: MyConstant().h2BackStyle(),
                ),
              ),
              Container(
                child: Image.asset(
                  MyConstant.fruit,
                  width: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTypeMeet(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TypeMeet(
                userModel: userModel!,
              ),
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ShowTitle(
                  title: 'เนื้อสัตว์ ',
                  textStyle: MyConstant().h2BackStyle(),
                ),
              ),
              Container(
                child: Image.asset(
                  MyConstant.meet,
                  width: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTypeDriedFood(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TypeDriedGoods(userModel: userModel!),
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ShowTitle(
                  title: 'อาหารแห้ง ',
                  textStyle: MyConstant().h2BackStyle(),
                ),
              ),
              Container(
                child: Image.asset(
                  MyConstant.driedfood,
                  width: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTypeCondiment(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TypeCondiments(userModel: userModel!),
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ShowTitle(
                  title: 'เครื่องปรุงรส ',
                  textStyle: MyConstant().h2BackStyle(),
                ),
              ),
              Container(
                child: Image.asset(
                  MyConstant.condiment,
                  width: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
