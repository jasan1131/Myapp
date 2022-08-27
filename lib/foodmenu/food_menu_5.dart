import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu5 extends StatefulWidget {
  const FoodMenu5({Key? key}) : super(key: key);

  @override
  State<FoodMenu5> createState() => _FoodMenu5State();
}

class _FoodMenu5State extends State<FoodMenu5> {
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
                    title: 'สุกี้น้ำ',
                    textStyle: MyConstant().h1Style(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowImage(path: MyConstant.food5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ShowTitle(
                              title: 'วัตถุดิบในการทำ สุกี้น้ำ',
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
                              title: 'วิธีทำสุกี้น้ำ',
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
                                    '1. ตั้งน้ำซุปใส่หม้อใบย่อม ๆ พอน้ำซุปเดือดใส่พวกหมูหรือเนื้อต่าง ๆ ที่หมักไว้ลงในหม้อ รอเดือด',
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
                                    '2. ใส่ผักต่าง ๆ ตามชอบ เพิ่มความเข้มข้นของน้ำซุปด้วยไข่ตีแตกอีกสัก 1 ฟอง ตอกใส่หม้อแล้วคน ๆ ให้เข้ากัน',
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
                                    '3. ใส่วุ้นเส้นแช่น้ำลงไป เติมน้ำจิ้มสุกี้ คนให้เข้ากัน ตักเสิร์ฟ',
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
          ],
        ),
      ),
    );
  }
}
