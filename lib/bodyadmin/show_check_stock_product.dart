import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/product_model.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckStockProduct extends StatefulWidget {
  const CheckStockProduct({Key? key}) : super(key: key);

  @override
  State<CheckStockProduct> createState() => _CheckStockProductState();
}

class _CheckStockProductState extends State<CheckStockProduct> {
  ProductModel? productModel;
  bool load = true;
  bool? haveData;
  List<ProductModel> productModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readProductModel();
  }

  Future<Null> readProductModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('id')!;
    String apiGetProductWhereIdProduct =
        '${MyConstant.domain}/shopping/getProductWhereIdProduct.php?isAdd=true&idproduct=$id';
    await Dio().get(apiGetProductWhereIdProduct).then(
      (value) {
        // print('### value ==> $value');

        if (value.toString() == 'null') {
          // No Data
          setState(() {
            load = false;
            haveData = false;
          });
        } else {
          // Have Data
          for (var item in json.decode(value.data)) {
            ProductModel model = ProductModel.fromMap(item);
            // print('### nameProduct ==> ${model.NameProduct}');

            setState(() {
              load = false;
              haveData = true;
              productModels.add(model);
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: load
          ? ShowProgress()
          : haveData!
              ? SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            buildHead(),
                            buildListView(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShowTitle(
                          title: 'ไม่มีสินค้า',
                          textStyle: MyConstant().h1Style()),
                      ShowTitle(
                          title: 'กรุณาเพิ่มสินค้า',
                          textStyle: MyConstant().h2Style()),
                    ],
                  ),
                ),
    );
  }

  Widget buildDivider() {
    return Divider(
      color: MyConstant.dark,
    );
  }

  Widget buildHead() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ShowTitle(
                  title: 'ชื่อสินค้า',
                  textStyle: MyConstant().h3Stylebold(),
                ),
              ),
              Expanded(
                flex: 2,
                child: ShowTitle(title: 'จำนวนสินค้า',
                  textStyle: MyConstant().h3Stylebold(),),
              ),
              Expanded(
                flex: 2,
                child: ShowTitle(title: 'ราคาสินค้า',
                  textStyle: MyConstant().h3Stylebold(),),
              ),
            ],
          ),
          buildDivider(),
        ],
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: productModels.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ShowTitle(title: productModels[index].nameproduct),
                ),
                Expanded(
                  flex: 2,
                  child: ShowTitle(
                      title:
                          '${productModels[index].numberproduct} ${productModels[index].unitproduct}'),
                ),
                buildDivider(),
                Expanded(
                  flex: 2,
                  child: ShowTitle(
                      title:
                          '${productModels[index].priceproduct} บาท / ${productModels[index].unitprice}'),
                ),
              ],
            ),
            buildDivider(),
          ],
        ),
      ),
    );
  }
}
