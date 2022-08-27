import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu9 extends StatefulWidget {
  const FoodMenu9({Key? key}) : super(key: key);

  @override
  State<FoodMenu9> createState() => _FoodMenu9State();
}

class _FoodMenu9State extends State<FoodMenu9> {
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
                    title: 'มะกะโรนีผัดซอส',
                    textStyle: MyConstant().h1Style(),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowImage(path: MyConstant.food9),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ShowTitle(
                        title: 'วัตถุดิบในการทำ มะกะโรนีผัดซอส',
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
                        title: 'วิธีทำมะกะโรนีผัดซอส',
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
                              '1. ต้มน้ำให้เดือด ใส่มะกะโรนีลงไปต้มประมาณ 5 นาที เสร็จแล้วแช่ทิ้งไว้ในน้ำร้อนประมาณ 5 นาที จนนิ่มตามชอบ ตักขึ้นใส่ตะแกรงพักให้สะเด็ดน้ำ',
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
                              '2. ตั้งกระทะให้ร้อน ใส่น้ำมันลงไป ใส่เนื้อสัตว์ลงไปผัดพอสุก ตามด้วยหอมใหญ่และมะเขือเทศ',
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
                              '3. พอผักเริ่มนิ่มแล้วตอกไข่ใส่ลงไป คลุกเคล้าให้เข้ากันดีจนไข่สุก',
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
                              '4. ใส่มะกะโรนีลงไป ตามด้วยซอสมะเขือเทศ ปรุงรสด้วยเกลือป่น ผัดคลุกเคล้าให้เข้ากัน ใส่ต้นหอมลงไปคลุกเคล้าให้เข้ากันดี ตักใส่จานเสิร์ฟ',
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
