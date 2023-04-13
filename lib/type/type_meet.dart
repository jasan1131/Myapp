import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/type/type_meet_beef.dart';
import 'package:flutter_myappication_1/type/type_meet_chicken.dart';
import 'package:flutter_myappication_1/type/type_meet_pork.dart';
import 'package:flutter_myappication_1/type/type_meet_seafood.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class TypeMeet extends StatefulWidget {
  final UserModel userModel;
  const TypeMeet({Key? key, required this.userModel}) : super(key: key);

  @override
  State<TypeMeet> createState() => _TypeMeetState();
}

class _TypeMeetState extends State<TypeMeet> {
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
        title: Text('ประเภทเนื้อสัตว์   '),
      ),
      body: Container(
        decoration: MyConstant().gradientRadioBackground(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTypePork(context),
              buildTypeChicken(context),
              buildTypeBeef(context),
              buildTypeSeafood(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTypePork(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TypeMeetPork(userModel: userModel!),
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: ShowTitle(
                  title: 'เนื้อหมู ',
                  textStyle: MyConstant().h2BackStyle(),
                ),
              ),
              Container(
                child: Image.asset(
                  MyConstant.pook,
                  width: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTypeChicken(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TypeMeetBeef(userModel: userModel!),
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: ShowTitle(
                  title: 'เนื้อวัว ',
                  textStyle: MyConstant().h2BackStyle(),
                ),
              ),
              Container(
                child: Image.asset(
                  MyConstant.beef,
                  width: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTypeBeef(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TypeMeetChicken(userModel: userModel!),
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: ShowTitle(
                  title: 'เนื้อไก่ ',
                  textStyle: MyConstant().h2BackStyle(),
                ),
              ),
              Container(
                child: Image.asset(
                  MyConstant.chicken,
                  width: 250,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTypeSeafood(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TypeMeetSeaFood(userModel: userModel!),
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
                  title: 'อาหารทะเล ',
                  textStyle: MyConstant().h2BackStyle(),
                ),
              ),
              Container(
                child: Image.asset(
                  MyConstant.seafood,
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
