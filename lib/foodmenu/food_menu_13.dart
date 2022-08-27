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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowTitle(
                    title: 'ยำมาม่ารวมมิตร',
                    textStyle: MyConstant().h1Style(),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowImage(path: MyConstant.food13),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ShowTitle(
                        title: 'วัตถุดิบในการทำ ยำมาม่ารวมมิตร',
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
                        title: 'วิธีทำยำมาม่ารวมมิตร',
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
                              '1.	ลวกเนื้อสัตว์ต่างๆ ทีละชนิดแล้วพักไว้ โดยเน้นลวกให้พอสุก เพื่อให้เนื้อกุ้ง หมึก และเนื้อหมูยังมีรสหวาน อีกทั้งเพื่อไม่ให้แข็งจนเกินไป จากนั้นเก็บน้ำจากการลวกเนื้อสัตว์ไว้',
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
                              '2.	ลวกเส้นมาม่า ระวังอย่าให้นิ่มเละเกินไป จากนั้นเทน้ำออก แล้วพักเส้นไว้ให้สะเด็ดน้ำ',
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
                              '3.	ขั้นตอนต่อไปให้เตรียมทำน้ำยา โดยนำเครื่องปรุงต่างๆ มาใส่รวมกันในชามผสม ได้แก่ น้ำมะนาว น้ำปลา น้ำตาล ผงปรุงรสมาม่า และพริก คนส่วนผสมน้ำยาให้เข้ากันดี ชิมรสตามชอบ',
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
                              '4.	ใส่ผักต่างๆ ลงไป ได้แก่ หัวหอมใหญ่ แครอทซอย มะเขือเทศ และขึ้นฉ่ายมาผสมให้เข้ากัน',
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
                              '5.	คลุกเคล้าส่วนผสมทั้งหมดให้เข้ากัน ใครชอบรสชาติแบบไหนก็ปรุงแต่งรสตามชอบอีกครั้งได้ค่ะ เพียงเท่านี้ก็เป็นอันเสร็จ ตักใส่จานพร้อมเสิร์ฟ',
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
