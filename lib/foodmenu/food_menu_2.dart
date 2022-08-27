import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu2 extends StatefulWidget {
  const FoodMenu2({Key? key}) : super(key: key);

  @override
  State<FoodMenu2> createState() => _FoodMenu2State();
}

class _FoodMenu2State extends State<FoodMenu2> {
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
                    title: 'ข้าวไข่เจียว',
                    textStyle: MyConstant().h1Style(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowImage(path: MyConstant.food2),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ShowTitle(
                              title: 'วัตถุดิบในการทำ ข้าวไข่เจียว',
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
                              title: 'วิธีทำข้าวไข่เจียว',
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
                                    '1. ตอกไข่ใส่ชาม ปรุงรสด้วยน้ำมันหอยกับซอสปรุงรส ใส่ต้นหอม ตีจนเข้ากัน',
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
                                    '2. ตั้งกระทะใส่น้ำมันพืช พอน้ำมันร้อนเทไข่ลงไป ทอดจนสุกทั้งสองด้าน',
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
