import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu17 extends StatefulWidget {
  const FoodMenu17({Key? key}) : super(key: key);

  @override
  State<FoodMenu17> createState() => _FoodMenu17State();
}

class _FoodMenu17State extends State<FoodMenu17> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShowTitle(
                    title: 'น้ำตกหมู',
                    textStyle: MyConstant().h1Style(),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowImage(path: MyConstant.food17),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ShowTitle(
                        title: 'วัตถุดิบในการทำ น้ำตกหมู',
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
                        title: 'วิธีทำน้ำตกหมู',
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
                              '1. ใส่น้ำซุปลงในหม้อ นำขึ้นตั้งไฟ ใส่เนื้อหมูลงรวนพอสุก ยกลงจากเตา ',
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
                              '2. ใส่พริกป่นและข้าวคั่ว ปรุงรสด้วยน้ำมะนาวและน้ำปลา คนผสมให้เข้ากัน ชิมรสตามชอบ',
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
                              '3. ใส่หอมแดงซอย ต้นหอมซอย ผักชีซอย ผักชีฝรั่งซอย และใบสะระแหน่ เคล้าผสมให้เข้ากันอีกครั้ง ตักใส่จาน เสิร์ฟ',
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
