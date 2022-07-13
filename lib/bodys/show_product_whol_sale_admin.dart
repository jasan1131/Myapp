import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/product_model.dart';
import 'package:flutter_myappication_1/states/edit_product_ws.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowProductWholeSaleAdmin extends StatefulWidget {
  const ShowProductWholeSaleAdmin({Key? key}) : super(key: key);

  @override
  State<ShowProductWholeSaleAdmin> createState() =>
      _ShowProductWholeSaleAdminState();
}

class _ShowProductWholeSaleAdminState extends State<ShowProductWholeSaleAdmin> {
  bool load = true;
  bool? haveData;
  List<ProductModel> productmodel = [];

  @override
  void initState() {
    super.initState();
    loadValueFromApi();
  }

  Future<Null> loadValueFromApi() async {
    if (productmodel.length != 0) {
      productmodel.clear();
    } else {}

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String idproduct = preferences.getString('id')!;
    String apiGetProductSpWhereIdProductSp =
        '${MyConstant.domain}/shopping/getProductWSWhereIdProductWS.php';
    await Dio().get(apiGetProductSpWhereIdProductSp).then(
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
              productmodel.add(model);
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
              ? LayoutBuilder(
                  builder: (context, constraints) => buildListView(constraints),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShowTitle(
                          title: 'ไม่มีสินค้า',
                          textStyle: MyConstant().h1Style()),
                      ShowTitle(
                          title: 'กรุราเพิ่มสินค้า',
                          textStyle: MyConstant().h2Style()),
                    ],
                  ),
                ),
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          backgroundColor: MyConstant.dark,
          onPressed: () =>
              Navigator.pushNamed(context, MyConstant.rounteAddProductWholeSale)
                  .then((value) => loadValueFromApi()),
          child: ShowTitle(
            title: 'เพิ่มสินค้า',
            textStyle: MyConstant().h3WhiteStyle(),
          ),
        ),
      ),
    );
  }

  String createUrl(String string) {
    String result = string.substring(1, string.length - 1);
    List<String> strings = result.split(',');
    String url = '${MyConstant.domain}/shopping${strings[0]}';
    return url;
  }

  ListView buildListView(BoxConstraints constraints) {
    return ListView.builder(
      itemCount: productmodel.length,
      itemBuilder: (context, index) => Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: MyConstant.dark),
            borderRadius: BorderRadius.circular(14)),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              width: constraints.maxWidth * 0.5 - 4,
              height: constraints.maxWidth * 0.5,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ShowTitle(
                      title: productmodel[index].nameproduct,
                      textStyle: MyConstant().h2Style(),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: MyConstant.dark),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      width: constraints.maxWidth * 0.5,
                      height: constraints.maxWidth * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: createUrl(
                              productmodel[index].imagesproduct),
                          placeholder: (context, url) => ShowProgress(),
                          errorWidget: (context, url, error) =>
                              ShowImage(path: MyConstant.imageeror),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: constraints.maxWidth * 0.5 - 4,
              height: constraints.maxWidth * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowTitle(
                    title:
                        'ราคา :${productmodel[index].priceproduct} THB',
                    textStyle: MyConstant().h2Style(),
                  ),
                  ShowTitle(
                    title:
                        'จำนวนสินค้า :${productmodel[index].numberproduct}',
                    textStyle: MyConstant().h3Style(),
                  ),
                  ShowTitle(
                    title:
                        'รายละเอียดสินค้า : ${productmodel[index].detailproduct}',
                    textStyle: MyConstant().h3Style(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          print('## YOu Click Edit');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProductWholeSale(
                                  productModel:
                                      productmodel[index],
                                ),
                              )).then((value) => loadValueFromApi());
                        },
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 36,
                          color: MyConstant.dark,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print('## You Click Delete from index = $index');
                          confirmDialogDelete(productmodel[index]);
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          size: 36,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> confirmDialogDelete(
      ProductModel productModel) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: CachedNetworkImage(
            imageUrl: createUrl(productModel.imagesproduct),
            placeholder: (context, url) => ShowProgress(),
          ),
          title: ShowTitle(
            title: 'Delete ${productModel.nameproduct} ?',
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(
            title: productModel.detailproduct,
            textStyle: MyConstant().h3Style(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              print('## Confirm Delete at id ==> ${productModel.id}');
              String apiDeleteProductWhereIDProduct =
                  '${MyConstant.domain}/shopping/deleteProductWSWhereId.php?isAdd=true&Id=${productModel.id}';
              await Dio().get(apiDeleteProductWhereIDProduct).then((value) {
                Navigator.pop(context);
                loadValueFromApi();
              });
            },
            child: Text('Delete'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
