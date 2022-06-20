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
        child: Column(
          children: [
            BuildTitle(),
            buildCopyPrompay(),
            buildQRcodePromptpay(),
            buildDownload(),
          ],
        ),
      ),floatingActionButton: NavigatorCFW(),
    );
  }

  ElevatedButton buildDownload() => ElevatedButton(
        onPressed: () async {
          final tempDir = await getTemporaryDirectory();
          final path = '${tempDir.path}/promptpay.png';
          String url = MyConstant.urlPromptpay;

          await GallerySaver.saveImage(url);
          await Dio().download(url, path).then(
                (value) => MyDialog().normalDialog(
                    context,
                    'ดาวน์โหลด QRcode สำเร็จ !',
                    'กรุณาไปที่แอพธนาคาร เพื่ออ่าน QRcode'),
              );
        },
        child: Text('Download QRcode'),
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
        child: ListTile(
          title: ShowTitle(
            title: '097-027-2217',
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(title: 'บัญชี Prompay'),
          trailing: IconButton(
            onPressed: () {
              Clipboard.setData(
                ClipboardData(text: '0970272217'),
              );
              MyDialog().normalDialog(
                context,
                'Copy Prompay ',
                'คัดลอก เลขบัญชี Prompay ไปยังคีย์บอร์ดสำเร็จแล้ว',
              );
            },
            icon: Icon(
              Icons.copy,
              color: MyConstant.dark,
            ),
          ),
        ),
      ),
    );
  }

  ShowTitle BuildTitle() {
    return ShowTitle(
      title: 'การโอนเงินโดยใช้ Prompay',
      textStyle: MyConstant().h1Style(),
    );
  }
}
