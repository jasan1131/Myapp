import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/type/type_condiment.dart';
import 'package:flutter_myappication_1/type/type_dried_food.dart';
import 'package:flutter_myappication_1/type/type_meet.dart';
import 'package:flutter_myappication_1/type/type_vegetable.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
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
      body: Container(decoration: MyConstant().planBackground(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTypeVegatable(context),
              buildTypeMeet(context),
              buildTypeDriedFood(context),
              buildTypeCondiment(context),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Card(
              child: Center(
                child: ShowTitle(title: 'ผักผลไม้  '),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTypeMeet(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TypeMeet(userModel: userModel!),
            ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Card(
              child: Center(
                child: ShowTitle(title: 'เนื้อสัตว์  '),
              ),
            ),
          ),
        ],
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Card(
              child: Center(
                child: ShowTitle(title: 'ของแห้ง  '),
              ),
            ),
          ),
        ],
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Card(
              child: Center(
                child: ShowTitle(title: 'เครื่องปรุงรส  '),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
