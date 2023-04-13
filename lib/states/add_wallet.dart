import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/bodys/bank.dart';
import 'package:flutter_myappication_1/bodys/cash_on_delivery.dart';
import 'package:flutter_myappication_1/bodys/prompay.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';

class AddWallet extends StatefulWidget {
  const AddWallet({Key? key}) : super(key: key);

  @override
  State<AddWallet> createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  List<Widget> widgets = [
    Bank(),
    Prompay(),
    CashOnDelivery(),
  ];

  List<IconData> icons = [
    Icons.account_balance_outlined,
    Icons.currency_ruble_outlined,
    Icons.credit_card_outlined,
  ];

  List<String> titles = ['ธนาคาร', 'พร้อมเพย์ ', 'เก็บเงินปลายทาง'];

  int indexPosition = 0;

  List<BottomNavigationBarItem> bottomNavigationBarItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    int i = 0;
    for (var item in titles) {
      bottomNavigationBarItems
          .add(createBottomNavigationBarItem(icons[i], item));
      i++;
    }
  }

  BottomNavigationBarItem createBottomNavigationBarItem(
          IconData iconData, String string) =>
      BottomNavigationBarItem(
        icon: Icon(iconData),
        label: string,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        centerTitle: true,
        title: Text('ชำระเงินแบบ ${titles[indexPosition]}'),
      ),
      body: widgets[indexPosition],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: MyConstant.primary,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: bottomNavigationBarItems,
        currentIndex: indexPosition,
        onTap: (value) {
          setState(() {
            indexPosition = value;
          });
        },
      ),
    );
  }
}
