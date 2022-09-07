import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class FoodMenu12 extends StatefulWidget {
  const FoodMenu12({Key? key}) : super(key: key);

  @override
  State<FoodMenu12> createState() => _FoodMenu12State();
}

class _FoodMenu12State extends State<FoodMenu12> {
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
            title: 'วิธีทำหมี่ผัดผักกระเฉด',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title:
                '1. ตำพริกและกระเทียมแบบหยาบ ๆ และนำมันกุ้งมาผสมน้ำเปล่า น้ำปลา และน้ำมะนาว ให้ได้รสชาติตามที่ต้องการ',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. ตั้งน้ำในกระทะให้เดือดจัด แล้วนำเส้นหมี่ขาวที่แช่น้ำแล้วใส่ลงไปในน้ำเดือด จากนั้นนับ 1-10 ในใจ เมื่อครบแล้วก็ปิดไฟ นำกระชอนช้อนเส้นหมี่ขาวออกแล้วราดน้ำเย็น หรือเปิดน้ำเปล่าผ่านเส้นเพื่อหยุดความสุก สะเด็ดน้ำออก แล้วพักเส้นไว้ก่อน',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3. ตั้งกระทะเทน้ำมันใส่ลงไป พอร้อนใส่พริกและกระเทียมลงไปผัดให้เข้ากัน เทเครื่องปรุงมันกุ้งลงในกระทะแล้วคนให้เข้ากัน ใส่น้ำตาลปี๊บเคี่ยวจนละลาย ปรุงรสตามชอบ',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '4. ใส่กุ้งกับปลาหมึกลงไปผัด ใส่เส้นตามทันที ผัดจนเข้ากัน ดันเส้นที่ผัดแล้วไว้ข้างกระทะ แล้วใส่ผักกระเฉดลงไป กลบผักกระเฉดด้วยเส้นหมี่ขาว ทิ้งไว้ประมาณครึ่งนาที  ปิดไฟ คลุกเคล้าส่วนผสมทั้งหมดเข้าด้วยกัน',
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
                title: 'วัตถุดิบในการทำ หมี่ผัดผักกระเฉด',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '1.เส้นหมี่ขาว'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '2.ผักกระเฉด'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '3.กุ้ง         '),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '4.ปลาหมึก'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '5.กระเทียม'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '6.พริกขี้หนู'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '7.มะนาว'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '8.น้ำมันพืช'),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food12),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'หมี่ผัดผักกระเฉด',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
