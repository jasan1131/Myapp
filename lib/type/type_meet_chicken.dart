import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/product_model.dart';
import 'package:flutter_myappication_1/models/splite_model.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_api.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/sqlite_helpper.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class TypeMeetChicken extends StatefulWidget {
  final UserModel userModel;
  const TypeMeetChicken({Key? key, required this.userModel}) : super(key: key);

  @override
  State<TypeMeetChicken> createState() => _TypeMeetChickenState();
}

class _TypeMeetChickenState extends State<TypeMeetChicken> {
  UserModel? userModel;
  bool load = true;
  bool? haveData;
  List<ProductModel> productmodels = [];
  List<List<String>> listImages = [];
  int indexImage = 0;
  int amountInt = 1;
  double? lat1, lng1, lat2, lng2;
  Location location = Location();
  String? currentIdSeller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
    readApiAllShop();
    // findLocation();
  }

  // Future<Null> findLocation() async {
  //   location.onLocationChanged.listen((event) {
  //     lat1 = event.latitude;
  //     lng1 = event.longitude;
  //   });
  // }

  Future<Null> readApiAllShop() async {
    String urlAPI =
        '${MyConstant.domain}/shopping/getProductWhereTypeChicken.php';
    await Dio().get(urlAPI).then(
      (value) {
        if (value.toString() == 'null') {
          setState(() {
            haveData = false;
            load = false;
          });
        } else {
          for (var item in json.decode(value.data)) {
            ProductModel model = ProductModel.fromMap(item);

            String string = model.imagesproduct;
            string = string.substring(1, string.length - 1);
            List<String> strings = string.split(',');
            int i = 0;
            for (var item in strings) {
              strings[i] = item.trim();
              i++;
            }
            listImages.add(strings);

            setState(() {
              haveData = true;
              load = false;
              productmodels.add(model);
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyConstant.primary,
        title: Text('ประเภทเนื้อไก่ '),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return load
                ? ShowProgress()
                : haveData!
                    ? listProduct()
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ShowTitle(
                              title: 'NO DATA',
                              textStyle: MyConstant().h1Style(),
                            ),
                          ],
                        ),
                      );
          } else {
            return load
                ? ShowProgress()
                : haveData!
                    ? listProductHolizon()
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ShowTitle(
                              title: 'NO DATA',
                              textStyle: MyConstant().h1Style(),
                            ),
                          ],
                        ),
                      );
          }
        },
      ),
    );
  }

  Container listProduct() {
    return Container(
      decoration: MyConstant().planBackground(),
      child: GridView.builder(
        itemCount: productmodels.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 2 / 5,
          maxCrossAxisExtent: 360,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            // print('### YOu Click Index ===>> $index');
            ShowAlertDialog(
              productmodels[index],
              listImages[index],
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: MyConstant.dark),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4 - 8,
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl:
                            findUrlImage(productmodels[index].imagesproduct),
                        placeholder: (context, url) => ShowProgress(),
                        errorWidget: (context, url, error) =>
                            ShowImage(path: MyConstant.imageeror),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShowTitle(
                            title: productmodels[index].nameproduct,
                            textStyle: MyConstant().h2Style(),
                          ),
                          // Row(
                          //   children: [
                          //     ShowTitle(
                          //       title:
                          //           'จำนวนสินค้า : ${productmodels[index].numberproduct} ',
                          //       textStyle: MyConstant().h3Style(),
                          //     ),
                          //     ShowTitle(
                          //       title: productmodels[index].unitproduct,
                          //       textStyle: MyConstant().h3Style(),
                          //     ),
                          //   ],
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShowTitle(
                                title: 'ราคา : ',
                                textStyle: MyConstant().h3Style(),
                              ),
                              ShowTitle(
                                title:
                                    '${productmodels[index].priceproduct} บาท / ${productmodels[index].unitprice}',
                                textStyle: MyConstant().h3Style(),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShowTitle(
                                title: 'รายระเอียดสินค้า :',
                                textStyle: MyConstant().h3Style(),
                              ),
                              ShowTitle(
                                title:
                                    cutWord(productmodels[index].detailproduct),
                                textStyle: MyConstant().h3Style(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container listProductHolizon() {
    return Container(
      child: GridView.builder(
        itemCount: productmodels.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 2 / 2,
          maxCrossAxisExtent: 500,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            // print('### YOu Click Index ===>> $index');
            ShowAlertDialog(
              productmodels[index],
              listImages[index],
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: MyConstant.dark),
              borderRadius: BorderRadius.circular(16),
            ),
            shadowColor: MyConstant.dark,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3 - 8,
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl:
                            findUrlImage(productmodels[index].imagesproduct),
                        placeholder: (context, url) => ShowProgress(),
                        errorWidget: (context, url, error) =>
                            ShowImage(path: MyConstant.imageeror),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShowTitle(
                            title: productmodels[index].nameproduct,
                            textStyle: MyConstant().h2Style(),
                          ),
                          // Row(
                          //   children: [
                          //     ShowTitle(
                          //       title:
                          //           'จำนวนสินค้า : ${productmodels[index].numberproduct} ',
                          //       textStyle: MyConstant().h3Style(),
                          //     ),
                          //     ShowTitle(
                          //       title: productmodels[index].unitproduct,
                          //       textStyle: MyConstant().h3Style(),
                          //     ),
                          //   ],
                          // ),
                          Row(
                            children: [
                              ShowTitle(
                                title:
                                    'ราคา : ${productmodels[index].priceproduct} บาท /',
                                textStyle: MyConstant().h3Style(),
                              ),
                              ShowTitle(
                                title: productmodels[index].unitprice,
                                textStyle: MyConstant().h3Style(),
                              ),
                            ],
                          ),
                          ShowTitle(
                            title: cutWord(
                                'รายระเอียดสินค้า : ${productmodels[index].detailproduct}'),
                            textStyle: MyConstant().h3Style(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String findUrlImage(String arrayImage) {
    String string = arrayImage.substring(1, arrayImage.length - 1);
    List<String> strings = string.split(',');
    int index = 0;
    for (var item in strings) {
      strings[index] = item.trim();
      index++;
    }
    String result = '${MyConstant.domain}/shopping${strings[0]}';
    // print('### result ===>> $result');
    return result;
  }

  Future<Null> ShowAlertDialog(
      ProductModel productmodel, List<String> images) async {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: ListTile(
            leading: ShowImage(path: MyConstant.image1),
            title: ShowTitle(
              title: productmodel.nameproduct,
              textStyle: MyConstant().h2Style(),
            ),
            subtitle: ShowTitle(
              title: 'ราคา ${productmodel.priceproduct} บาท',
              textStyle: MyConstant().h3Style(),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      '${MyConstant.domain}/shopping${images[indexImage]}',
                  placeholder: (context, url) => ShowProgress(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              indexImage = 0;
                              print('### indexImage ==>> $indexImage');
                            },
                          );
                        },
                        icon: Icon(Icons.filter_1),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              indexImage = 1;
                              print('### indexImage ==>> $indexImage');
                            },
                          );
                        },
                        icon: Icon(Icons.filter_2),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              indexImage = 2;
                              print('### indexImage ==>> $indexImage');
                            },
                          );
                        },
                        icon: Icon(Icons.filter_3),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              indexImage = 3;
                              print('### indexImage ==>> $indexImage');
                            },
                          );
                        },
                        icon: Icon(Icons.filter_4),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    ShowTitle(
                      title: 'รายระเอียดสินค้า :',
                      textStyle: MyConstant().h2Style(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 200,
                        child: ShowTitle(
                          title: productmodel.detailproduct,
                          textStyle: MyConstant().h3Style(),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (amountInt != 1) {
                          setState(() {
                            amountInt--;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: MyConstant.dark,
                      ),
                    ),
                    ShowTitle(
                      title: amountInt.toString(),
                      textStyle: MyConstant().h1Style(),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          amountInt++;
                        });
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: MyConstant.dark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () async {
                    String idSeller = userModel!.id;
                    String nameSeller = userModel!.name;
                    String idProduct = productmodel.id;
                    String nameProduct = productmodel.nameproduct;
                    String priceProduct = productmodel.priceproduct;
                    String number = productmodel.numberproduct;
                    int minunInt = int.parse(number) - amountInt ;
                    String numberProduct = minunInt.toString();
                    String amount = amountInt.toString();
                    int sumInt = int.parse(priceProduct) * amountInt;
                    String sum = sumInt.toString();

                    lat2 = double.parse(userModel!.lat);
                    lng2 = double.parse(userModel!.lng);

                    double distance =
                        MyAPI().calculateDistance(lat1!, lng1!, lat2!, lng2!);

                    var myFormat = NumberFormat('##0.0#', 'en_US');
                    String distancestring = myFormat.format(distance);

                    int transport = MyAPI().calculateTransport(distance);
                    print(
                        'idproduct = $idProduct, nameproduct = $nameProduct, numberproduct = $numberProduct, priceproduct = $priceProduct, amount = $amount, sum = $sum, distance = $distancestring, transport = $transport');

                    SQLiteModel sqLiteModel = SQLiteModel(
                        idSeller: idSeller,
                        nameSeller: nameSeller,
                        idProduct: idProduct,
                        nameProduct: nameProduct,
                        numberProduct: numberProduct,
                        priceProduct: priceProduct,
                        amount: amount,
                        sum: sum,
                        distance: distancestring,
                        transport: transport.toString());
                    await SQLiteHelpper()
                        .insertValueSQLite(sqLiteModel)
                        .then((value) {
                      amountInt = 1;
                      Navigator.pop(context);
                    });
                  },
                  child: ShowTitle(
                    title: 'Add',
                    textStyle: MyConstant().h2BlueStyle(),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: ShowTitle(
                    title: 'Cancel',
                    textStyle: MyConstant().h2RedStyle(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String cutWord(String string) {
    String result = string;
    if (result.length >= 100) {
      result = result.substring(0, 100);
      result = '$result ... ';
    }
    return result;
  }
}
