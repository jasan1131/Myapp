import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu6 extends StatefulWidget {
  const FoodMenu6({Key? key}) : super(key: key);

  @override
  State<FoodMenu6> createState() => _FoodMenu6State();
}

class _FoodMenu6State extends State<FoodMenu6> {
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
                    title: 'สุกี้แห้ง',
                    textStyle: MyConstant().h1Style(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowImage(path: MyConstant.food6),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ShowTitle(
                              title: 'วัตถุดิบในการทำ สุกี้แห้ง',
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
                              title: 'วิธีทำสุกี้แห้ง',
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
                                    '1. ตอกไข่ 3 ฟองลงในอ่างผสม ตีจนเข้ากัน ปรุงรสด้วยน้ำมันหอย ซีอิ๊วขาว น้ำมันงา และพริกไทยป่น คนจนเข้ากันดี',
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
                                    '2. ทำน้ำหมักโดยผสมไข่ไก่ แป้งมัน พริกไทย น้ำตาลทรายแดง น้ำมันงา ซอสปรุงรส ซีอิ๊วขาว และน้ำเปล่า ใส่หมูนุ่ม ลูกชิ้นปลา เต้าหู้ปลา ปูอัด และกุ้งสด ลงไปหมัก คลุกให้เข้ากัน นำใส่ตู้เย็นอย่างน้อย 15 นาที',
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
                                    '3. ตั้งกระทะใส่น้ำมันพืช เอากระเทียมลงเจียวให้หอม ตักเครื่องหมักใส่ลงในกระทะ ผัดให้สุก ใส่ผักตามชอบ ตามด้วยวุ้นเส้นแช่น้ำ เติมน้ำจิ้มสุกี้ลงกระทะ ผัดให้เข้ากัน เสิร์ฟพร้อมน้ำจิ้มสุกี้',
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
