import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu8 extends StatefulWidget {
  const FoodMenu8({Key? key}) : super(key: key);

  @override
  State<FoodMenu8> createState() => _FoodMenu8State();
}

class _FoodMenu8State extends State<FoodMenu8> {
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
                    title: 'ข้าวผัดพริกแกงหมู',
                    textStyle: MyConstant().h1Style(),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowImage(path: MyConstant.food8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ShowTitle(
                          title: 'วัตถุดิบในการทำ ข้าวผัดพริกแกงหมู',
                          textStyle: MyConstant().h2Style(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ShowTitle(
                        title: 'วิธีทำข้าวผัดพริกแกงหมู',
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
                              '1. ลวกถั่วฝักยาวในน้ำเดือด ประมาณ 20 วินาที ตักขึ้นใส่ลงแช่ในน้ำเย็น ตักขึ้นสะเด็ดน้ำ เตรียมไว้',
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
                              '2. ใส่น้ำมันพืชลงในกระทะ นำขึ้นตั้งไฟปานกลางพอร้อน ใส่น้ำพริกแกงลงผัดจนหอม ปรุงรสด้วยน้ำปลาและน้ำตาลปี๊บ จากนั้นใส่หมูลงผัดจนสุก ใส่ถั่วฝักยาวและใบมะกรูดลงผัดสักครู่ ราดข้าว พร้อมเสิร์ฟ',
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
