import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu20 extends StatefulWidget {
  const FoodMenu20({Key? key}) : super(key: key);

  @override
  State<FoodMenu20> createState() => _FoodMenu20State();
}

class _FoodMenu20State extends State<FoodMenu20> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        centerTitle: true,
        title: Text('เมนูอาหาร'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHead(),
            buildImage(),
            buildStaple(),
            buildTitle(),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowTitle(
            title: 'วิธีทำผัดผักรวมมิตร',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title:
                '2. กุ้ง ล้างทำความสะอาด ทำการปอกเปลือกกุ้ง เอาหัวกุ้งออก เหลือแต่ส่วนหางกุ้งไว้ ผ่าเอาเส้นดำหลังกุ้งออก ตอนล้างกุ้งเราเคล้าเกลือป่นเล็กน้อยเพื่อดับกลิ่นคาว',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '1. เริ่มต้นเราล้างทำความสะอาดผักทั้งหมด ตอนล้างผักเราแช่น้ำเกลือทิ้งไว้ประมาณหนึ่งชั่วโมง เพื่อเป็นการล้างสารตกค้างที่อาจปนเปื้อนมากับผักของเรา',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3. ตั้งน้ำให้เดือดเพื่อทำการลวกผัก เราจะใส่บรอกโคลี่ ถั่วหวาน ลงไปลวกในน้ำเดือดจัดพร้อมกัน ตามด้วยแคร์รอต คะน้าฮ่องกง เราจะลวกไม่นาน (ให้สังเกตุผักจะเริ่มเปลี่ยนสีเป็นสีเขียวสด ลวกประมาณ 2 นาที ให้รีบนำขึ้น) ลวกเสร็จแล้วให้นำมาแช่ในน้ำเย็นจัดเพื่อเป็นการรักษาสารอาหารที่อยู่ในผัก และจะทำให้ผักมีสีเขียวสดน่ารับประทานยิ่งขึ้น',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '4. ใส่น้ำมันพืชลงไป ใช้ไฟกลางในการผัด ตามด้วยกระเทียมสับผัดให้กระเทียมมีสีเหลืองอ่อน พอกระเทียมเริ่มส่งกลิ่นหอม ให้ใส่กุ้งลงไปผัด จังหวะนี้เราจะเร่งไฟแรงขึ้น ผัดให้กุ้งสุก ใส่เห็ดฟางตามลงไปแล้วผัดต่อ ใส่ผักที่เราแช่น้ำเย็นจัดลงไปผัดรวมกันทั้งหมด (ผักที่แช่น้ำเย็นไว้ เราเทน้ำออกให้ผักสะเด็ดน้ำ) เราจะใช้เวลาผัดไม่นาน ประมาณ 5 นาที ที่ใช้เวลาผัดไม่นานเพราะเราได้ทำการลวกผักไว้ก่อนแล้ว',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '5. ปรุงรสชาติด้วยซอสหอยนางรม ซอสปรุงรส น้ำปลา น้ำตาลทราย รสชาติผัดผักของเราจะมีรสชาติออกหวานเล็กน้อย เค็มตาม ชิมให้รสชาติกลมกล่อมตามแบบที่เราชอบทานเลย ผัดให้ทุกอย่างเข้ากันดี ก็เป็นอันเสร็จเรียบร้อย',
            textStyle: MyConstant().h3Style(),
          ),
        ],
      ),
    );
  }

  Widget buildStaple() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ShowTitle(
                title: 'วัตถุดิบในการทำ ผัดผักรวมมิตร',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '1.เห็ดฟาง'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '2.แคร์รอต'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '3.บรอกโคลี่'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '4.ถั่วหวาน'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '5.คะน้าฮ่องกง'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '6.ซอสหอยนางรม'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '7.กระเทียม'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '8.ซอสปรุงรส'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '9.น้ำตาลทราย'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '10.น้ำมันพืช'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '11.น้ำปลา'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '12.กุ้ง'),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food20),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'ผัดผักรวมมิตร',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
