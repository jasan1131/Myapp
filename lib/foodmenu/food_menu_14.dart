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
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        centerTitle: true,
        title: Text('เมนูอาหาร'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeda(),
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
            title: 'วิธีทำกะเพราหมูสับ',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title: '1.	โขลกพริกและกระเทียมพอหยาบๆ เพื่อกระจายความเผ็ด',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2.	เทน้ำมันพืชลงในกระทะ จากนั้นตั้งไฟปานกลาง ใส่พริก กระเทียมที่โขลกเตรียมไว้ลงไปผัดจนกระเทียมจนสีเหลืองทอง มีกลิ่นหอม',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3.	นำหมูบดลงใส่กระทะ ผัดให้สุกทั่วถึง ตามด้วยเครื่องปรุงรสทั้งหมด ได่แก่ น้ำปลา น้ำตาล ซีอิ๊วขาว ซีอิ๊วดำ และน้ำมันหอย คลุกให้ซอสเข้ากันกับเนื้อหมู ตามด้วยน้ำซุป/น้ำเปล่า เพื่อเพิ่มความฉ่ำ ไม่จำเป็นต้องใส่หากชอบผัดแบบแห้ง',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '4.	หากต้องการเติมผักประเภทอื่นๆ ใส่ลงในกระทะแล้วผัดต่อประมาณ 2-3 นาที',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '5.	เติมใบกะเพราทันทีหลังปิดไฟ ผัดใบกะเพราให้ได้ความร้อนเล็กน้อย',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title: '6.	ตักกะเพราเสิร์ฟพร้อมข้าวสวย และวางไข่ดาว เป็นอันเสร็จ',
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
                title: 'วัตถุดิบในการทำ กะเพราหมูสับ',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '1.เนื้อหมู'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '2.กระเทียม'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '3.พริกชี้ฟ้า'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '4.น้ำปลา'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '5.ซีอิ๊วขาว'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '6.ซีอิ๊วดำ'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '7.น้ำมันหอย'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '8.ใบกะเพรา'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '9.น้ำมันพืช'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '10.เนื้อหมู'),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food14),
      );

  Widget buildHeda() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'กะเพราหมูสับ',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
