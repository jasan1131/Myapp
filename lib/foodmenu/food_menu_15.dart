import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu15 extends StatefulWidget {
  const FoodMenu15({Key? key}) : super(key: key);

  @override
  State<FoodMenu15> createState() => _FoodMenu15State();
}

class _FoodMenu15State extends State<FoodMenu15> {
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
            title: 'วิธีทำผัดกะหล่ำปลีหมูกรอบ',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title:
                '1.	ตั้งกระทะใส่น้ำมันบนไฟปานกลาง ใส่กระเทียมผัดจนหอม ใส่หมู แครอทผัดให้เข้ากัน',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2.	ใส่กะหล่ำปลีที่หั่นเตรียมไว้ เร่งเป็นไฟแรง เติมน้ำเล็กน้อย',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3.	ปรุงรสให้กลมกล่อมด้วย “รสดี” รสหมู ผัดให้เข้ากันอีกครั้ง ปิดไฟ ตักใส่จาน พร้อมเสิร์ฟ',
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
                title: 'วัตถุดิบในการทำ ผัดกะหล่ำปลีหมูกรอบ',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '1.กะหล่ำปลี'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '2.รสดีหมู'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '3.แครอท'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '4.เนื้อหมู'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '5.กระเทียม'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '6.น้ำมันพืช'),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: ShowImage(path: MyConstant.food15),
  );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'ผัดกะหล่ำปลีหมูกรอบ',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
