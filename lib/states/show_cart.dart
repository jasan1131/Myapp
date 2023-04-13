import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/splite_model.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/sqlite_helpper.dart';
import 'package:flutter_myappication_1/widgets/navigator_add_order.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:intl/intl.dart';

class ShowCart extends StatefulWidget {
  const ShowCart({Key? key}) : super(key: key);

  @override
  State<ShowCart> createState() => _ShowCartState();
}

class _ShowCartState extends State<ShowCart> {
  UserModel? userModel;
  String? distance;
  List<SQLiteModel> sqliteModels = [];
  bool load = true;
  int? total;
  int? result;

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
      print('### value on processReadSQlite ==>> $value');
      setState(() {
        load = false;
        sqliteModels = value;
        calculateTotal();
      });
    });
  }

  void calculateTotal() async {
    result = 0;
    total = 0;
    for (var item in sqliteModels) {
      int sql = int.parse(item.transport);
      int sumInt = int.parse(item.sum.trim());
      setState(() {
        result = result! + sumInt;
        total = result! + sql;
      });
      // print('total = $total');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        centerTitle: true,
        title: Text('ตระกร้าสินค้า'),
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
              : buildContent(),floatingActionButton: NavigatorAddOrder(),
    );
  }

  Widget buildContent() {
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
                  textStyle: MyConstant().h1Stylebold(),
                ),
              ),
            ],
          ),
          buildDivider(),
          buildNameShop(),
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



  Widget buildNameShop() {
    return Container(
      margin: EdgeInsets.only(left: 8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Row(
                children: [
                  ShowTitle(
                    title: 'ชื่อร้าน : ',
                    textStyle: MyConstant().h3Stylebold(),
                  ),
                  ShowTitle(
                    title: '${sqliteModels[0].nameSeller}',
                    textStyle: MyConstant().h3Style(),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              children: <Widget>[
                Row(
                  children: [
                    ShowTitle(
                      title: 'ระยะทาง : ',
                      textStyle: MyConstant().h3Stylebold(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: ShowTitle(
                        title: '${sqliteModels[0].distance} กิโลเมตร',
                        textStyle: MyConstant().h3Style(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: <Widget>[
                Row(
                  children: [
                    ShowTitle(
                      title: 'ค่าจัดส่ง : ',
                      textStyle: MyConstant().h3Stylebold(),
                    ),
                    ShowTitle(
                      title: 'ค่าจัดส่ง : ${sqliteModels[0].transport} บาท',
                      textStyle: MyConstant().h3Style(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> confirmEmptyCart() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.imageeror),
          title: ShowTitle(
            title: 'คุณต้องการจะ ลบ ?',
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(
            title: 'สินค้า ทั้งหมด ในตะกร้า',
            textStyle: MyConstant().h3Style(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await SQLiteHelpper().emptySQLite().then((value) {
                Navigator.pop(context);
                processReadSQLite();
              });
            },
            child: Text('ลบ'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ยกเลิก'),
          ),
        ],
      ),
    );
  }

  Row buttonController() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, MyConstant.rounteAddWallet);
          },
          child: Text('ยืนยัน'),
        ),
        Container(
          margin: EdgeInsets.only(left: 4, right: 8),
          child: ElevatedButton(
            onPressed: () => confirmEmptyCart(),
            child: Text('ลบทั้งหมด'),
          ),
        ),
      ],
    );
  }

  Widget buildTotal() {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    return Row(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShowTitle(
                title: 'ยอดรวมสินค้า :',
                textStyle: MyConstant().h3Stylebold(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: ShowTitle(
                title: total == null ? '' : myFormat.format(total),
                textStyle: MyConstant().h3Style(),
              ),
            ),
            ShowTitle(title: ' บาท')
          ],
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
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ShowTitle(
                title: sqliteModels[index].nameProduct,
                textStyle: MyConstant().h3Style(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(),
                child: ShowTitle(
                  title: sqliteModels[index].amount,
                  textStyle: MyConstant().h3Style(),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ShowTitle(
                title: sqliteModels[index].priceProduct,
                textStyle: MyConstant().h3Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowTitle(
                title: sqliteModels[index].sum,
                textStyle: MyConstant().h3Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () async {
                  int idSQLite = sqliteModels[index].id!;
                  print('### Delete idSQLite ==>> $idSQLite');
                  await SQLiteHelpper()
                      .deleteSQLiteWhereId(idSQLite)
                      .then((value) => processReadSQLite());
                },
                icon: Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.red.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHead() {
    return Container(
      decoration: BoxDecoration(color: MyConstant.light),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ShowTitle(
                title: 'รายชื่อสินค้า',
                textStyle: MyConstant().h3Stylebold(),
              ),
            ),
            Expanded(
              flex: 2,
              child: ShowTitle(
                title: 'จำนวน',
                textStyle: MyConstant().h3Stylebold(),
              ),
            ),
            Expanded(
              flex: 2,
              child: ShowTitle(
                title: 'ราคา/บาท',
                textStyle: MyConstant().h3Stylebold(),
              ),
            ),
            Expanded(
              flex: 0,
              child: ShowTitle(
                title: 'ราคารวม/บาท',
                textStyle: MyConstant().h3Stylebold(),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
