import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class ShowAboutAppcationBuyer extends StatefulWidget {
  const ShowAboutAppcationBuyer({Key? key}) : super(key: key);

  @override
  State<ShowAboutAppcationBuyer> createState() =>
      _ShowAboutAppcationBuyerState();
}

class _ShowAboutAppcationBuyerState extends State<ShowAboutAppcationBuyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        title: Text('เกี่ยวกับแอปพลิเคชัน'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  MyConstant.image1,
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.75,
                ),
              ],
            ),
            ShowTitle(title: 'v.1.0.0+1', textStyle: MyConstant().h1Stylebold(),)
          ],
        ),
      ),
    );
  }
}
