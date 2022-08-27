import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu19 extends StatefulWidget {
  const FoodMenu19({Key? key}) : super(key: key);

  @override
  State<FoodMenu19> createState() => _FoodMenu19State();
}

class _FoodMenu19State extends State<FoodMenu19> {
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
                    title: 'ปีกไก่ทอดโคล่า',
                    textStyle: MyConstant().h1Style(),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowImage(path: MyConstant.food19),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ShowTitle(
                        title: 'วัตถุดิบในการทำ ปีกไก่ทอดโคล่า',
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
                        title: 'วิธีทำปีกไก่ทอดโคล่า',
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
                              '1. ล้างปีกไก่ให้สะอาด หมักด้วยซอสถั่วเหลืองและพริกไทยดำป่น คลุกเคล้าให้เข้ากัน ปิดฝากล่องใส่ตู้เย็น หมักไว้สักครู่ (พอซอสซึมเข้าเนื้อไก่ได้ที่ เนื้อไก่จะเปลี่ยนสีเล็กน้อย)',
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
                              '2. ใส่น้ำมันลงในกระทะ นำขึ้นตั้งไฟอ่อน ๆ ใส่ปีกไก่ที่หมักไว้ลงไปทอด พอได้ที่แล้วเอาไก่ขึ้นมาพักไว้ก่อน แล้วเทน้ำมันออก',
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
                              '3. เทน้ำอัดลมโคล่าลงไปแล้วตั้งไฟอ่อนไปเรื่อย ๆ ประมาณ 10 นาที โค้กก็จะเริ่มแห้ง กลายเป็นซอสเหนียว ๆ เหมือนเทอริยากิ จัดใส่จาน พร้อมเสิร์ฟ',
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
