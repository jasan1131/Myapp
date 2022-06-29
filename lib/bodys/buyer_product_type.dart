import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class BuyerProductType extends StatefulWidget {
  const BuyerProductType({Key? key}) : super(key: key);

  @override
  State<BuyerProductType> createState() => _BuyerProductTypeState();
}

class _BuyerProductTypeState extends State<BuyerProductType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  top: 8,
                ),
                child: ShowTitle(
                  title: 'ประเภทสินค้า',
                  textStyle: MyConstant().h2Style(),
                ),
              ),
            ],
          ),
          buildTypeVegetables(context),
          buildTypeMeet(context),
          buildTypeDryGoods(context),
          buildTypeCondiments(context),
        ],
      ),
    );
  }

  Column buildTypeCondiments(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, MyConstant.rounteTypeCondiments),
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowTitle(
                    title: 'เครื่องปรุงรส',
                    textStyle: MyConstant().h2Style(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildTypeDryGoods(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, MyConstant.rounteTypeDryGoods),
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowTitle(
                    title: 'ของแห้ง',
                    textStyle: MyConstant().h2Style(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildTypeMeet(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, MyConstant.rounteTypeMeet),
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowTitle(
                    title: 'เนื้อสัตว์  ',
                    textStyle: MyConstant().h2Style(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildTypeVegetables(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, MyConstant.rounteTypeVegetables),
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowTitle(
                    title: 'ผักผลไม้  ',
                    textStyle: MyConstant().h2Style(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
