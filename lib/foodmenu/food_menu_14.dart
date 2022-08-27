import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu14 extends StatefulWidget {
  const FoodMenu14({Key? key}) : super(key: key);

  @override
  State<FoodMenu14> createState() => _FoodMenu14State();
}

class _FoodMenu14State extends State<FoodMenu14> {
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
                    title: 'กะเพราหมูสับ',
                    textStyle: MyConstant().h1Style(),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowImage(path: MyConstant.food14),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ShowTitle(
                        title: 'วัตถุดิบในการทำ กะเพราหมูสับ',
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
                        title: 'วิธีทำกะเพราหมูสับ',
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
                              '1.	โขลกพริกและกระเทียมพอหยาบๆ เพื่อกระจายความเผ็ด',
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
                              '2.	เทน้ำมันพืชลงในกระทะ จากนั้นตั้งไฟปานกลาง ใส่พริก กระเทียมที่โขลกเตรียมไว้ลงไปผัดจนกระเทียมจนสีเหลืองทอง มีกลิ่นหอม',
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
                              '3.	นำหมูบดลงใส่กระทะ ผัดให้สุกทั่วถึง ตามด้วยเครื่องปรุงรสทั้งหมด ได่แก่ น้ำปลา น้ำตาล ซีอิ๊วขาว ซีอิ๊วดำ และน้ำมันหอย คลุกให้ซอสเข้ากันกับเนื้อหมู ตามด้วยน้ำซุป/น้ำเปล่า เพื่อเพิ่มความฉ่ำ ไม่จำเป็นต้องใส่หากชอบผัดแบบแห้ง',
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
                              '4.	หากต้องการเติมผักประเภทอื่นๆ ใส่ลงในกระทะแล้วผัดต่อประมาณ 2-3 นาที',
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
                              '5.	เติมใบกะเพราทันทีหลังปิดไฟ ผัดใบกะเพราให้ได้ความร้อนเล็กน้อย',
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
                              '6.	ตักกะเพราเสิร์ฟพร้อมข้าวสวย และวางไข่ดาว เป็นอันเสร็จ',
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
