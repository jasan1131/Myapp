import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu7 extends StatefulWidget {
  const FoodMenu7({Key? key}) : super(key: key);

  @override
  State<FoodMenu7> createState() => _FoodMenu7State();
}

class _FoodMenu7State extends State<FoodMenu7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowTitle(
                    title: 'ข้าวหมูกระเทียม',
                    textStyle: MyConstant().h1Style(),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowImage(path: MyConstant.food7),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ShowTitle(
                        title: 'วัตถุดิบในการทำ ข้าวหมูกระเทียม',
                        textStyle: MyConstant().h2Style(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ShowTitle(
                        title: 'วิธีทำข้าวหมูกระเทียม',
                        textStyle: MyConstant().h2Style(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.655,
                        child: ShowTitle(
                          title:
                              '1. โขลกกระเทียม พริกไทยดำและเกลือทะเล เข้าด้วยกันจนละเอียด',
                          textStyle: MyConstant().h3Style(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.655,
                        child: ShowTitle(
                          title:
                              '2. นำส่วนผสมโขลกไว้ลงไปผสมคลุกเคล้ากับเนื้อหมู ใส่ซีอิ๊วขาว น้ำตาลทราย และน้ำมันพืช คลุกเคล้าให้ส่วนผสมเข้ากัน หมักทิ้งไว้ 30 นาที ถึง 1 ชั่วโมง',
                          textStyle: MyConstant().h3Style(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.655,
                        child: ShowTitle(
                          title:
                              '3. นำกระทะขึ้นตั้งไฟ ใส่น้ำมันพืชลงไปเล็กน้อย พอร้อนใส่หมูที่หมักไว้ลงไปทอดให้สุกเหลือง ตักราดลงบนข้าวสวยร้อน ๆ เสิร์ฟพร้อมแตงกวาและพริกน้ำปลา',
                          textStyle: MyConstant().h3Style(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
