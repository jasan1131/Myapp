import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/splite_model.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/sqlite_helpper.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  List<SQLiteModel> sqliteModels = [];
  bool load = true;
  int? total;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    processReadSQLite();
  }

  Future<Null> processReadSQLite() async {
    if (sqliteModels.isNotEmpty) {
      sqliteModels.clear();
    }

    await SQLiteHelpper().readSQLite().then((value) {
      // print('### value on processReadSQlite ==>> $value');
      setState(() {
        load = false;
        sqliteModels = value;
        calculateTotal();
      });
    });
  }

  void calculateTotal() async {
    total = 0;
    for (var item in sqliteModels) {
      int sumInt = int.parse(item.sum.trim());
      setState(() {
        total = total! + sumInt;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Confirm Order'),
      ),
      body: load
          ? ShowProgress()
          : sqliteModels.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ShowTitle(
                          title: 'ไม่มีสินค้า',
                          textStyle: MyConstant().h1Style()),
                    ),
                  ],
                )
              : buildContent(),
    );
  }

  SingleChildScrollView buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShowTitle(
                  title: 'รายการสินค้าที่สั่ง',
                  textStyle: MyConstant().h1Style(),
                ),
              ),
            ],
          ),
          buildHead(),
          listProductOrder(),
          buildDivider(),
          buildTotal(),
          buildDivider(),
          buttonController(),
        ],
      ),
    );
  }

  Row buttonController() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(left: 4, right: 8),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, MyConstant.rounteAddWallet);
            },
            child: Text('ConfirmOrder'),
          ),
        ),
      ],
    );
  }

  Row buildTotal() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ShowTitle(
                title: 'Total :',
                textStyle: MyConstant().h2Style(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: ShowTitle(
            title: total == null ? '' : total.toString(),
            textStyle: MyConstant().h2Style(),
          ),
        ),
      ],
    );
  }

  Divider buildDivider() {
    return Divider(
      color: MyConstant.dark,
    );
  }

  ListView listProductOrder() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: sqliteModels.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 4),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: ShowTitle(
                  title: sqliteModels[index].nameProduct,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: ShowTitle(
                  title: sqliteModels[index].priceProduct,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ShowTitle(
                  title: sqliteModels[index].amount,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ShowTitle(
                  title: sqliteModels[index].sum,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildHead() {
    return Container(
      decoration: BoxDecoration(color: MyConstant.light),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: ShowTitle(
                  title: 'สินค้า',
                  textStyle: MyConstant().h2Style(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: 'ราคา',
                textStyle: MyConstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: 'จำนวน',
                textStyle: MyConstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: ShowTitle(
                  title: 'รวม',
                  textStyle: MyConstant().h2Style(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
