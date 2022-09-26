import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/navigator_confirm_add_wallet.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:flutter_svg/svg.dart';

class Bank extends StatefulWidget {
  const Bank({Key? key}) : super(key: key);

  @override
  State<Bank> createState() => _BankState();
}

class _BankState extends State<Bank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [buildTitle(), buildKBank(), buildSCB(), buildText()],
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
                'วิธีการชำระเงินแบบการโอนเงินผ่าน บัญชีธนาคาร',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '1. ทำการกดปุ่มคัดลอกเพื่อคัดลอกเลขบัญชี',
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

  Widget buildKBank() {
    return Container(
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: MyConstant.dark),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green.shade700,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('images/kbank.svg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShowTitle(
                      title: 'ธนาคารกสิกรไทย',
                      textStyle: MyConstant().h2Stylebold(),
                    ),
                    Row(
                      children: [
                        ShowTitle(
                          title: 'ชื่อบัญชี : ',
                          textStyle: MyConstant().h3Stylebold(),
                        ),
                        ShowTitle(title: 'นายธงไชย รัศมีทองสายธาร'),
                      ],
                    ),
                    Row(
                      children: [
                        ShowTitle(
                          title: 'เลขบัญชีบัญชี : ',
                          textStyle: MyConstant().h3Stylebold(),
                        ),
                        ShowTitle(title: '045-121-7119'),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: '0451217119'),
                        );
                        MyDialog().normalDialogCoppy1(
                          context,
                          'คัดลอกเลขบัญชี ธนาคารกสิกรไทย ไปยังคีย์บอร์ดสำเร็จแล้ว',
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
      ),
    );
  }

  Widget buildSCB() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: MyConstant.dark),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.purple.shade700,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('images/scb.svg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShowTitle(
                      title: 'ธนาคารไทยพาณิชย์  ',
                      textStyle: MyConstant().h2Stylebold(),
                    ),
                    Row(
                      children: [
                        ShowTitle(
                          title: 'ชื่อบัญชี : ',
                          textStyle: MyConstant().h3Stylebold(),
                        ),
                        ShowTitle(title: 'นายธงไชย รัศมีทองสายธาร'),
                      ],
                    ),
                    Row(
                      children: [
                        ShowTitle(
                          title: 'เลขบัญชีบัญชี : ',
                          textStyle: MyConstant().h3Stylebold(),
                        ),
                        ShowTitle(title: '430-087949-6'),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: '4300879496'),
                        );
                        MyDialog().normalDialogCoppy1(
                          context,
                          'คัดลอกเลขบัญชี ธนาคารไทยพาณิชย์ ไปยังคีย์บอร์ดสำเร็จแล้ว',
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
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'การโอนเงินผ่าน บัญชีธนาคาร',
        textStyle: MyConstant().h1Stylebold(),
      ),
    );
  }
}
