import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/product_model.dart';
import 'package:flutter_myappication_1/models/splite_model.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/states/show_cart.dart';
import 'package:flutter_myappication_1/utility/my_api.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/sqlite_helpper.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuyerShowAllProduct extends StatefulWidget {
  final UserModel userModel;
  const BuyerShowAllProduct({Key? key, required this.userModel})
      : super(key: key);

  @override
  State<BuyerShowAllProduct> createState() => _BuyerShowAllProductState();
}

class _BuyerShowAllProductState extends State<BuyerShowAllProduct> {
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
  final urlImages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
    readApiAllShop();
    findLocation();
  }

  Future<Null> findLocation() async {
    location.onLocationChanged.listen((event) {
      lat1 = event.latitude;
      lng1 = event.longitude;
    });
  }

  Future<Null> readApiAllShop() async {
    String urlAPI =
        '${MyConstant.domain}/shopping/getProductWhereIdSeller.php?isAdd=true&idproduct=${userModel!.id}';
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
            print(strings);
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
      body: load
          ? ShowProgress()
          : haveData!
              ? listProduct()
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShowTitle(title: 'ไม่มีข้อมูลของสินค้า'),
                    ],
                  ),
                ),
    );
  }

  Widget listProduct() {
    return Container(
      decoration: MyConstant().planBackground(),
      child: ListView.builder(
        itemCount: productmodels.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.3,
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShowTitle(
                                title: 'ชื่อรายการสินค้า : ',
                                textStyle: MyConstant().h3Stylebold(),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ShowTitle(
                                    title: productmodels[index].nameproduct),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                ShowTitle(
                                  title: 'จำนวนสินค้า : ',
                                  textStyle: MyConstant().h3Stylebold(),
                                ),
                                ShowTitle(
                                  title:
                                      '${productmodels[index].numberproduct} / ${productmodels[index].unitproduct}',
                                  textStyle: MyConstant().h3Style(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                ShowTitle(
                                  title: 'ราคา : ',
                                  textStyle: MyConstant().h3Stylebold(),
                                ),
                                ShowTitle(
                                  title:
                                      '${productmodels[index].priceproduct} บาท / ${productmodels[index].unitprice}',
                                  textStyle: MyConstant().h3Style(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShowTitle(
                                  title: 'รายละเอียดสินค้า : ',
                                  textStyle: MyConstant().h3Stylebold(),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: ShowTitle(
                                    title: cutWord(
                                        productmodels[index].detailproduct),
                                    textStyle: MyConstant().h3Style(),
                                  ),
                                ),
                              ],
                            ),
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
        builder: (context, setState) {
          return AlertDialog(
            content: Container(
              width: MediaQuery.of(context).size.width * 1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    imagePath(productmodel),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              ShowTitle(
                                title: 'ชื่อรายการสินค้า : ',
                                textStyle: MyConstant().h3Stylebold(),
                              ),
                              ShowTitle(
                                title: productmodel.nameproduct,
                                textStyle: MyConstant().h3Style(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              ShowTitle(
                                title: 'จำนวนของสินค้า : ',
                                textStyle: MyConstant().h3Stylebold(),
                              ),
                              ShowTitle(
                                title:
                                    '${productmodel.numberproduct} / ${productmodel.unitproduct}',
                                textStyle: MyConstant().h3Style(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              ShowTitle(
                                title: 'ราคาของสินค้า : ',
                                textStyle: MyConstant().h3Stylebold(),
                              ),
                              ShowTitle(
                                title:
                                    '${productmodel.priceproduct} / ${productmodel.unitprice}',
                                textStyle: MyConstant().h3Style(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShowTitle(
                                title: 'รายละเอียดสินค้า :',
                                textStyle: MyConstant().h3Stylebold(),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: ShowTitle(
                                  title: productmodel.detailproduct,
                                  textStyle: MyConstant().h3Style(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: [
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
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () async {
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        String address = preferences.getString('address')!;
                        String phone = preferences.getString('phone')!;
                        String facebook = preferences.getString('facebook')!;
                        String line = preferences.getString('line')!;

                        String idSeller = userModel!.id;
                        String nameSeller = userModel!.nameseller;
                        String idProduct = productmodel.id;
                        String nameProduct = productmodel.nameproduct;
                        String priceProduct = productmodel.priceproduct;
                        String number = productmodel.numberproduct;
                        int minunInt = int.parse(number) - amountInt;
                        String numberProduct = minunInt.toString();
                        String amount = amountInt.toString();
                        int sumInt = int.parse(priceProduct) * amountInt;
                        String sum = sumInt.toString();

                        lat2 = double.parse(userModel!.lat);
                        lng2 = double.parse(userModel!.lng);

                        double distance = MyAPI()
                            .calculateDistance(lat1!, lng1!, lat2!, lng2!);

                        var myFormat = NumberFormat('##0.0#', 'en_US');
                        String distancestring = myFormat.format(distance);

                        int transport = MyAPI().calculateTransport(distance);
                        // print(
                        //     'idproduct = $idProduct, nameproduct = $nameProduct, numberproduct = $numberProduct, priceproduct = $priceProduct, amount = $amount, sum = $sum, distance = $distancestring, transport = $transport');

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
                            transport: transport.toString(),
                            address: address,
                            phone: phone,
                            facebook: facebook,
                            line: line
                            );
                        await SQLiteHelpper()
                            .insertValueSQLite(sqLiteModel)
                            .then((value) {
                          amountInt = 1;
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowCart(),
                              ));
                        });
                      },
                      child: ShowTitle(
                        title: 'เพิ่มสินค้า',
                        textStyle: MyConstant().h2BlueStyle(),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: ShowTitle(
                        title: 'ยกเลิกสินค้า',
                        textStyle: MyConstant().h2RedStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget imagePath(ProductModel productModel) {
    final CarouselController imgController = CarouselController();
    String image = productModel.imagesproduct;
    List<String> images = image.split('[');
    String imagess = images.join();
    List<String> imagesss = imagess.split(']');
    String imagessss = imagesss.join();
    List<String> watherImage = imagessss.split(',');
    String imageAPI = watherImage.join();

    dynamic imgl = watherImage.length;
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            height: MediaQuery.of(context).size.height * 0.3,
            enableInfiniteScroll: false,
            disableCenter: false,
          ),
          carouselController: imgController,
          items: watherImage
              .map((item) => CachedNetworkImage(
                    imageUrl: '${MyConstant.domain}/shopping${item.toString()}',
                    placeholder: (context, url) => ShowProgress(),
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ...Iterable<int>.generate(watherImage.length).map(
              (int pageIndex) => Flexible(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: MyConstant.primary,
                      shape: CircleBorder(),
                      fixedSize: const Size(25, 25),
                    ),
                    onPressed: () => imgController.animateToPage(pageIndex),
                    child: ShowTitle(
                      title: '${pageIndex + 1}',
                      textStyle: MyConstant().h2WhiteStyle(),
                    )),
              ),
            ),
          ],
        )
      ],
    ));
  }

  String cutWord(String string) {
    String result = string;
    if (result.length >= 100) {
      result = result.substring(0, 100);
      result = '$result ...';
    }
    return result;
  }
}
