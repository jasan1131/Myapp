import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/specialproduct/specail_product_10.dart';
import 'package:flutter_myappication_1/specialproduct/specail_product_20.dart';
import 'package:flutter_myappication_1/specialproduct/specail_product_30.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class BuyerSpecialProduct extends StatefulWidget {
  final UserModel userModel;
  const BuyerSpecialProduct({Key? key, required this.userModel})
      : super(key: key);

  @override
  State<BuyerSpecialProduct> createState() => _BuyerSpecialProductState();
}

class _BuyerSpecialProductState extends State<BuyerSpecialProduct> {
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
      body: Container(
        decoration: MyConstant().gradientRadioBackground(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildSpecialProduct10(context),
            buildSpecialProduct20(context),
            buildSpecialProduct30(context),
          ],
        ),
      ),
    );
  }

  Widget buildSpecialProduct10(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BuyerSpecialProduct10(userModel: userModel!),
            ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Card(
              color: MyConstant.light,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.orange.shade400, width: 10),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShowTitle(
                      title: 'ส่วนลด 10% ',
                      textStyle: MyConstant().h2BackStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSpecialProduct20(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BuyerSpecialProduct20(userModel: userModel!),
            ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Card(
              color: MyConstant.light,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.orange.shade400, width: 10),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShowTitle(
                      title: 'ส่วนลด 20%  ',
                      textStyle: MyConstant().h2BackStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSpecialProduct30(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  BuyerSpecialProduct30(userModel: userModel!),
            ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Card(
              color: MyConstant.light,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.orange.shade400, width: 10),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: ShowTitle(
                  title: 'ส่วนลด 30%  ',
                  textStyle: MyConstant().h2BackStyle(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
