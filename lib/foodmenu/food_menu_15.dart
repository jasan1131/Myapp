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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowTitle(
                    title: 'ยำวุ้นเส้นรวมมิตร',
                    textStyle: MyConstant().h1Style(),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowImage(path: MyConstant.food15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ShowTitle(
                        title: 'วัตถุดิบในการทำ ยำวุ้นเส้นรวมมิตร',
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
                        title: 'วิธีทำยำวุ้นเส้นรวมมิตร',
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
                              '1.	ทำน้ำยำ โดยผสมส่วนผสมน้ำยำทุกอย่างเข้าด้วยกัน ชิมรสตามชอบ พักไว้',
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
                              '2.	เทน้ำลงในหม้อ นำไปตั้งไฟให้ร้อน แล้วรวนหมูสับให้สุก เติมน้ำปลาลงไปเล็กน้อย คนให้เข้ากัน ยกลงจากเตาพักไว้',
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
                              '3.	ลวกวุ้นเส้น กุ้ง ปลาหมึก ปูอัด หมูยอ เห็ดหูหนูขาว และผักกระเฉดในน้ำเดือดพอสุก ตักทุกอย่างใส่อ่างผสม',
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
                              '4.	ใส่หมูรวนลงในอ่างผสม ตามด้วยน้ำยำเคล้าให้เข้ากัน แล้วใส่หอมเล็ก ต้นหอม และขึ้นฉ่ายเคล้าให้เข้ากันอีกครั้ง ตักใส่จานเสิร์ฟได้ทันที',
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
