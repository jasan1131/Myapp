import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu16 extends StatefulWidget {
  const FoodMenu16({Key? key}) : super(key: key);

  @override
  State<FoodMenu16> createState() => _FoodMenu16State();
}

class _FoodMenu16State extends State<FoodMenu16> {
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
    return Column(
      children: [
        ShowTitle(
          title: 'วิธีทำลาบหมู',
          textStyle: MyConstant().h2Style(),
        ),
        ShowTitle(
          title:
              '1. นำหมูรวนและตับใส่ในชามผสม ปรุงรสด้วยน้ำมะนาว น้ำปลา น้ำตาลทราย พริกป่น และข้าวคั่ว คลุกเคล้าให้เข้ากัน',
          textStyle: MyConstant().h3Style(),
        ),
        ShowTitle(
          title:
              '2. จากนั้นตามด้วย หอมแดงซอย ผักชีฝรั่ง และใบมะกรูดซอย คลุกเคล้าเบา ๆ อีกครั้ง',
          textStyle: MyConstant().h3Style(),
        ),
        ShowTitle(
          title:
              '3. ก่อนเสิร์ฟโรยด้วยใบมะกรูดซอยและใบสะระแหน่ แต่งด้วยมะเขือเทศ',
          textStyle: MyConstant().h3Style(),
        ),
      ],
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
                title: 'วัตถุดิบในการทำ ลาบหมู',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(
            title: '1.เนื้อหมู',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(
            title: '2.ตับหมู',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(
            title: '3.หอมแดง',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(
            title: '4.ผักชีฝรั่ง',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(
            title: '5.น้ำปลา',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(
            title: '6.น้ำมะนาว ',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(
            title: '7.น้ำตาลทราย ',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(
            title: '8.พริก',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(
            title: '9.ใบมะกรูด',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(
            title: '10.ผักกาดขาว',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(
            title: '11.มะเขือเทศราชินี',
          ),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food16),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'ลาบหมู',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
