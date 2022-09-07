import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu11 extends StatefulWidget {
  const FoodMenu11({Key? key}) : super(key: key);

  @override
  State<FoodMenu11> createState() => _FoodMenu11State();
}

class _FoodMenu11State extends State<FoodMenu11> {
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
            title: 'วิธีทำหมูผัดน้ำมันหอย',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title:
                '1. เอาหมูหมักกับน้ำมันหอย และซีอิ๊วขาวทิ้งไว้ ระหว่างนั้นเราก็ไปหั่นผัก สับกระเทียมไว้ครับเป็นการใช้เวลาให้คุ้มค่า(เกี่ยวไหมเนี่ย)',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. ใส่น้ำมันลงในกระทะ รอให้น้ำมันร้อนสักแปบนึง ใส่กระเทียมลงไป พอกระเทียมเริ่มส่งกลิ่นหอมมาเตะจมูก ใส่หมูที่เราหมักไว้แล้วลงไป',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3. ผัด ๆ  จนหมูเริ่มสุกก็เติมน้ำเปล่าลงไปประมาณ 1/2 ช้อนโต๊ะครับ เติมเครื่องปรุงอื่นๆ ลงไป',
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
                title: 'วัตถุดิบในการทำ หมูผัดน้ำมันหอย',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '1.เนื้อหมู'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '2.กระเทียม'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '3.ต้นหอม'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '4.น้ำมันหอย'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '5.ซีอิ๊วขาว'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '6.น้ำตาล'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '7.พริกไทย'),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: ShowImage(path: MyConstant.food11),
  );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'หมูผัดน้ำมันหอย',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
