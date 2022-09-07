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
            title: 'วิธีทำหอยลายผัดน้ำพริกเผา',
            textStyle: MyConstant().h2Style(),
          ),
          ShowTitle(
            title:
                '1. นำหอยลายมาล้างให้สะอาด จากนั้นนำหอยไปลวกในน้ำเดือดให้สุก แล้วนำขั้นมาพักให้สะเด็ดน้ำ',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '2. เด็ดใบโหระพาแล้วล้างให้สะอาด',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '3. ตั้งกระทะ ใส่น้ำมันและกระเทียมผัดให้พอได้กลิ่นหอม จากนั้นใส่น้ำพริกเผาผัดให้เข้ากัน',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '4. ใส่หอยลายลงไป จากนั้นผัดให้เข้ากัน',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '5. จากนั้นปรุงรสตามชอบ ด้วย น้ำตาลทราย ซีอิ้วขาว และน้ำมันหอย แล้วผัดให้เข้ากัน จากนั้นเติมน้ำเปล่า',
            textStyle: MyConstant().h3Style(),
          ),
          ShowTitle(
            title:
                '6. ใส่พริกขี้หนูเพิ่มรสเผ็ด และใบโหระพา จากนั้นผัดต่ออักสักพัก แล้วตักใส่จาน พร้อมรับทาน',
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
                title: 'วัตถุดิบในการทำ หอยลายผัดน้ำพริกเผา',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '1.หอยลาย'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '2.กระเทียม'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '3.พริกเผา'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '4.น้ำตาลทราย'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '5.ซีอิ้วขาว'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '6.น้ำมันหอย'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '7.พริกขี้หนู'),
        ),
        TextButton(
          onPressed: () {},
          child: ShowTitle(title: '8.ใบโหระพา'),
        ),
      ],
    );
  }

  Widget buildImage() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowImage(path: MyConstant.food19),
      );

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'หอยลายผัดน้ำพริกเผา',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
