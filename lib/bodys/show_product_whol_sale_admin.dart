import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/product_whole_sale_model.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowProductWholeSaleAdmin extends StatefulWidget {
  const ShowProductWholeSaleAdmin({ Key? key }) : super(key: key);

  @override
  State<ShowProductWholeSaleAdmin> createState() => _ShowProductWholeSaleAdminState();
}

class _ShowProductWholeSaleAdminState extends State<ShowProductWholeSaleAdmin> {
  bool load = true;
  bool? haveData;
  List<ProductWholeSaleModel> productwholesalemodel = [];

  @override
  void initState() {
    super.initState();
    loadValueFromApi();
  }

  Future<Null> loadValueFromApi() async {
    if (productwholesalemodel.length != 0) {
      productwholesalemodel.clear();
    } else {}

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String idproduct = preferences.getString('id')!;
    String apiGetProductSpWhereIdProductSp =
        '${MyConstant.domain}/shopping/getProductWSWhereIdProductWS.php?isAdd=true&idProduct=$idproduct';
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
            ProductWholeSaleModel model = ProductWholeSaleModel.fromMap(item);
            // print('### nameProduct ==> ${model.NameProduct}');

            setState(() {
              load = false;
              haveData = true;
              productwholesalemodel.add(model);
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
                          title: 'No Product',
                          textStyle: MyConstant().h1Style()),
                      ShowTitle(
                          title: 'Please Add Product',
                          textStyle: MyConstant().h2Style()),
                    ],
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyConstant.dark,
        onPressed: () =>
            Navigator.pushNamed(context, MyConstant.rounteAddProductWholeSale)
                .then((value) => loadValueFromApi()),
        child: Text('Add'),
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
      itemCount: productwholesalemodel.length,
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
                      title: productwholesalemodel[index].nameProduct,
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
                          imageUrl: createUrl(productwholesalemodel[index].imageProduct),
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
                    title: 'ราคา :${productwholesalemodel[index].priceProduct} THB',
                    textStyle: MyConstant().h2Style(),
                  ),
                  ShowTitle(
                    title: 'จำนวนสินค้า :${productwholesalemodel[index].numberProduct}',
                    textStyle: MyConstant().h3Style(),
                  ),
                  ShowTitle(
                    title:
                        'รายละเอียดสินค้า : ${productwholesalemodel[index].detailProduct}',
                    textStyle: MyConstant().h3Style(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          // print('## YOu Click Edit');
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => EditProdut(
                          //         ,
                          //       ),
                          //     )).then((value) => loadValueFromApi());
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
                          confirmDialogDelete(productwholesalemodel[index]);
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

  Future<Null> confirmDialogDelete(ProductWholeSaleModel productWholeSaleModel) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: CachedNetworkImage(
            imageUrl: createUrl(productWholeSaleModel.imageProduct),
            placeholder: (context, url) => ShowProgress(),
          ),
          title: ShowTitle(
            title: 'Delete ${productWholeSaleModel.nameProduct} ?',
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(
            title: productWholeSaleModel.detailProduct,
            textStyle: MyConstant().h3Style(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              print('## Confirm Delete at id ==> ${productWholeSaleModel.Id}');
              String apiDeleteProductWhereIDProduct =
                  '${MyConstant.domain}/shopping/deleteProductWhereId.php?isAdd=true&id=${productWholeSaleModel.Id}';
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