import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
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
        children: [
          buildTitle(),
          buildKBank(),
          buildSCB(),
        ],
      ),floatingActionButton: NavigatorCFW(),
    );
  }

  Widget buildKBank() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: MyConstant.dark),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('images/kbank.svg'),
              ),
            ),
            title: ShowTitle(
              title: 'ธนาคารกสิกรไทย',
              textStyle: MyConstant().h2Style(),
            ),
            subtitle: ShowTitle(
              title:
                  'ชื่อบัญชี : นายธงไชย รัศมีทองสายธาร เลขบัญชี : 045-1-21711-9',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSCB() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: MyConstant.dark),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.purple.shade700,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('images/scb.svg'),
              ),
            ),
            title: ShowTitle(
              title: 'ธนาคารไทยพาณิชย์',
              textStyle: MyConstant().h2Style(),
            ),
            subtitle: ShowTitle(
              title:
                  'ชื่อบัญชี : นายธงไชย รัศมีทองสายธาร เลขบัญชี : 430-0879496-6',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
        title: 'การโอนเงินเขา บัญชีธนาคาร',
        textStyle: MyConstant().h1Style(),
      ),
    );
  }
}
