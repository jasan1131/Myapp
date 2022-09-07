import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu13 extends StatefulWidget {
  const FoodMenu13({Key? key}) : super(key: key);

  @override
  State<FoodMenu13> createState() => _FoodMenu13State();
}

class _FoodMenu13State extends State<FoodMenu13> {
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
        children: [
          Row(
            children: [
              ShowTitle(
                title: 'วิธีทำผัดเปรี้ยวหวานหมู',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
          ShowTitle(
            title:
                '1.	เจียวกระเทียมสับในน้ำมันพืชจนหอม ใส่เนื้อหมูลงไปผัดจนสุก',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2.	ใส่สับปะรด แตงกวา หอมใหญ่ พริกฝรั่ง ต้นหอม และมะเขือเทศ ลงไปผัดจนสุก',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3.	ปรุงรสด้วยซอสมะเขือเทศ น้ำตาลทราย และเกลือป่น ใส่น้ำเปล่าลงไปเล็กน้อย ผัดให้เข้ากัน ชิมรสตามชอบ พร้อมเสิร์ฟ',
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
                title: 'วัตถุดิบในการทำ ผัดเปรี้ยวหวานหมู',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '1.กระเทียม'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '2.เนื้อหมู'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '3.สับปะรด'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '4.แตงกวา'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '5.หอมใหญ่'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '6.มะเขือเทศ'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '7.ซอสมะเขือเทศ'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '8.น้ำตาลทราย'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '9.น้ำปลา'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '10.น้ำมันพืช'),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food13),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'ผัดเปรี้ยวหวานหมู',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
