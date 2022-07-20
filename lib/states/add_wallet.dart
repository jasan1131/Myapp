import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/bodys/bank.dart';
import 'package:flutter_myappication_1/bodys/credic.dart';
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
    Credic(),
  ];

  List<IconData> icons = [
    Icons.account_balance_outlined,
    Icons.currency_ruble_outlined,
    Icons.credit_card_outlined,
  ];

  List<String> titles = ['ธนาคาร', 'พร้อมเพ', 'เก็บเงินปลายทาง'];

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
        centerTitle: true,
        title: Text('ชำระเงินแบบ ${titles[indexPosition]}'),
      ),
      body: widgets[indexPosition],
      bottomNavigationBar: BottomNavigationBar(
        // selectedIconTheme: IconThemeData(color: MyConstant.dark),
        // unselectedIconTheme: IconThemeData(color: MyConstant.light),
        selectedItemColor: MyConstant.dark,
        unselectedItemColor: MyConstant.light,
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
