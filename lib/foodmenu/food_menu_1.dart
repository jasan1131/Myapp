import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu1 extends StatefulWidget {
  const FoodMenu1({Key? key}) : super(key: key);

  @override
  State<FoodMenu1> createState() => _FoodMenu1State();
}

class _FoodMenu1State extends State<FoodMenu1> {
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
                    title: 'ผัดซีอิ๊วหมู',
                    textStyle: MyConstant().h1Style(),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowImage(path: MyConstant.food1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ShowTitle(
                        title: 'วัตถุดิบในการทำ ผัดซีอิ๊วหมู',
                        textStyle: MyConstant().h2Style(),
                      ),
                    ],
                  ),
                ),
                TextButton(onPressed: () {}, child: ShowTitle(title: 'title')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ShowTitle(
                        title: 'วิธีทำผัดซีอิ๊วหมู',
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
                              '1. ใส่น้ำมันพืชและกระเทียมลงในชามกระเบื้อง คนผสมให้กระเทียมโดนน้ำมันจนทั่ว จากนั้นนำเข้าเตาไมโครเวฟ ใช้ไฟแรง เจียวกระเทียมประมาณ 2 นาที ยกออกจากเตา',
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
                              '2. ใส่หมู คนผสมเข้ากัน นำกลับเข้าเตาไมโครเวฟ นานประมาณ 1 นาที นำออกจากเตา',
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
                              '3. ใส่เส้นก๋วยเตี๋ยว ซีอิ๊วดำ ซอสปรุงรส และน้ำตาลทราย คนผสมจนเข้ากัน นำกลับเข้าเตาไมโครเวฟ ประมาณ 2 นาที นำออกจากเตา ผัดให้เข้ากัน',
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
                              '4. ใส่ไข่ไก่ นำเข้าเตาไมโครเวฟ ประมาณ 1 นาที นำออกจากเตา ใส่คะน้าและแครอต คนให้เข้ากัน นำกลับเข้าไมโครเวฟ ประมาณ 2 นาที นำออกมา ผัดให้เข้ากันอีกครั้ง จากนั้นตักใส่จาน โรยพริกไทยป่น',
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
