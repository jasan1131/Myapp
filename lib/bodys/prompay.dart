import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/navigator_confirm_add_wallet.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class Prompay extends StatefulWidget {
  const Prompay({Key? key}) : super(key: key);

  @override
  State<Prompay> createState() => _PrompayState();
}

class _PrompayState extends State<Prompay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BuildTitle(),
              buildCopyPrompay(),
              buildQRcodePromptpay(),
              buildDownload(),
              buildText(),
            ],
          ),
        ),
      ),
      floatingActionButton: NavigatorCFW(),
    );
  }

  Widget buildText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Text(
                  'หมายเหตุ :',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                'วิธีการชำระเงินแบบการโอนเงินผ่าน พร้อมเพย์ ',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '1. ทำการกดปุ่มคัดลอกเพื่อคัดลอกเบอร์โทรศัพท์ ',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ],
          ),
          Text(
            '2. ทำการเปิดแอปพลิดเคชันธนาคาร หรือ โมบายแบงค์กิ้ง และทำการชำระเงิน',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
          Text(
            '3. เมื่อทำการชำระเงินเสร็จสิ้นให้กับมาที่แอปพิเคชันเพื่อทำการเพิ่มบิลการชำระเงิน',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Text(
                  'วิธีการเพิ่มบิล',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                '1. ทำการกดปุ่มเพิ่มบิล',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '2. ทำการเพิ่มบิลการชำระเงิน และกดปุ่มอัพโหลดบิล',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton buildDownload() => ElevatedButton(
        onPressed: () async {
          final tempDir = await getTemporaryDirectory();
          final path = '${tempDir.path}/promptpay.png';
          String url = MyConstant.urlPromptpay;

          await GallerySaver.saveImage(url);
          await Dio().download(url, path).then(
                (value) => MyDialog().normalDialogCoppy1(
                    context,
                    'ดาวน์โหลด QRcode สำเร็จ !',
                    'กรุณาไปที่แอพธนาคาร เพื่อสแกน QRcode'),
              );
        },
        child: Text('ดาวน์โหลด คิวอาร์โค้ด'),
      );

  Container buildQRcodePromptpay() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: CachedNetworkImage(
        imageUrl: MyConstant.urlPromptpay,
        placeholder: (context, url) => ShowProgress(),
      ),
    );
  }

  Widget buildCopyPrompay() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: MyConstant.dark),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowTitle(
                    title: 'พร้อมเพย์ ',
                    textStyle: MyConstant().h2Stylebold(),
                  ),
                  Row(
                    children: [
                      ShowTitle(
                        title: 'ชื่อบัญชี : ',
                        textStyle: MyConstant().h3Stylebold(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: ShowTitle(
                          title: 'สุนทร รัศมีทองสายธาร',
                          textStyle: MyConstant().h3Style(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ShowTitle(
                        title: 'เบอร์โทรศัพท์ : ',
                        textStyle: MyConstant().h3Stylebold(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: ShowTitle(
                          title: '097-027-2217',
                          textStyle: MyConstant().h3Style(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: '0970272217'),
                      );
                      MyDialog().normalDialogCoppy1(
                        context,
                        'คัดลอกเลขบัญชี พร้อมเพย์ ไปยังคีย์บอร์ดสำเร็จแล้ว',
                        'กรุณาไปที่แอพธนาคาร เพื่อทำการชำระเงิน',
                      );
                    },
                    icon: Icon(
                      Icons.copy,
                      color: MyConstant.dark,
                    ),
                  ),
                  ShowTitle(
                    title: 'คัดลอก',
                    textStyle: MyConstant().h3Stylebold(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ShowTitle BuildTitle() {
    return ShowTitle(
      title: 'การโอนเงินโดยใช้ พร้อมเพย์ ',
      textStyle: MyConstant().h1Stylebold(),
    );
  }
}
