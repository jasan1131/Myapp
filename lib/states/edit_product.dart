import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/product_model.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:image_picker/image_picker.dart';

class EditProdut extends StatefulWidget {
  final ProductModel productModel;
  const EditProdut({Key? key, required this.productModel}) : super(key: key);

  @override
  State<EditProdut> createState() => _EditProdutState();
}

class _EditProdutState extends State<EditProdut> {
  String? typeproduct;
  ProductModel? productModel;

  TextEditingController NameController = TextEditingController();
  TextEditingController NumberController = TextEditingController();
  TextEditingController UnitProductController = TextEditingController();
  TextEditingController PriceController = TextEditingController();
  TextEditingController UnitPriceController = TextEditingController();
  TextEditingController DetailController = TextEditingController();

  List<String> pathImages = [];
  List<File?> files = [];
  bool statusImage = false; // false => Not Change Image

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productModel = widget.productModel;
    // print('### image from mssql ===>> ${productModel!.Image}');
    convertStringToArry();
    NameController.text = productModel!.nameproduct;
    NumberController.text = productModel!.numberproduct;
    UnitProductController.text = productModel!.unitproduct;
    PriceController.text = productModel!.priceproduct;
    UnitPriceController.text = productModel!.unitprice;
    DetailController.text = productModel!.detailproduct;
  }

  void convertStringToArry() {
    String string = productModel!.imagesproduct;
    // print('### string ก่อนตัด ===>> $string');
    string = string.substring(1, string.length - 1);
    // print('### string หลังตัด ===>> $string');
    List<String> strings = string.split(',');
    for (var item in strings) {
      pathImages.add(item.trim());
      files.add(null);
    }
    // print('### pathImages ==>> $pathImages');
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        centerTitle: true,
        title: Text('แก้ไขข้อมูลสินค้า'),
        actions: [
          IconButton(
            onPressed: () => procesEdit(),
            icon: Icon(Icons.edit),
            tooltip: 'แก้ไขข้อมูลสินค้า',
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(
                FocusScopeNode(),
              ),
              behavior: HitTestBehavior.opaque,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTitle('ชื่อสินค้า :'),
                    buildName(constraints),
                    buildTitle('ประเภทสินค้า :'),
                    buildProductVegetables(size),
                    buildProductFruit(size),
                    buildProductMeetPork(size),
                    buildProductMeetBeef(size),
                    buildProductMeetChicken(size),
                    buildProductSeaFood(size),
                    buildProductDryGoods(size),
                    buildProductCondiments(size),
                    buildNumber(constraints),
                    buildUnitProduct(constraints),
                    buildPrice(constraints),
                    buildUnitPrice(constraints),
                    buildDetail(constraints),
                    buildTitle('รูปภาพขิงสินค้า :'),
                    buildImage(constraints, 0),
                    buildImage(constraints, 1),
                    buildImage(constraints, 2),
                    buildImage(constraints, 3),
                    buildEditProduct(constraints),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildEditProduct(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: constraints.maxWidth * 0.75,
          child: ElevatedButton.icon(
            onPressed: () => procesEdit(),
            icon: Icon(Icons.edit),
            label: Text('แก้ไขข้อมูลสินค้า'),
          ),
        ),
      ],
    );
  }

  Future<Null> chooseImage(int index, ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        files[index] = File(result!.path);
        statusImage = true;
      });
    } catch (e) {}
  }

  Container buildImage(BoxConstraints constraints, int index) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: MyConstant.primary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => chooseImage(index, ImageSource.camera),
            icon: Icon(Icons.add_a_photo),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            width: constraints.maxWidth * 0.5,
            child: files[index] == null
                ? CachedNetworkImage(
                    imageUrl:
                        '${MyConstant.domain}/shopping/${pathImages[index]}',
                    placeholder: (context, url) => ShowProgress(),
                  )
                : Image.file(files[index]!),
          ),
          IconButton(
            onPressed: () => chooseImage(index, ImageSource.gallery),
            icon: Icon(Icons.add_photo_alternate),
          ),
        ],
      ),
    );
  }

  Row buildUnitProduct(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
          width: constraints.maxWidth * 0.75,
          child: TextFormField(
            controller: UnitProductController,
            decoration: InputDecoration(
              labelText: 'หน่วยสินค้า :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildUnitPrice(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
          width: constraints.maxWidth * 0.75,
          child: TextFormField(
            controller: UnitPriceController,
            decoration: InputDecoration(
              labelText: 'หน่วยสินค้า :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildName(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: constraints.maxWidth * 0.75,
          child: TextFormField(
            controller: NameController,
            decoration: InputDecoration(
              labelText: 'ชื่อสินค้า :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildProductVegetables(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'vegetables',
            groupValue: typeproduct,
            onChanged: (value) {
              setState(
                () {
                  typeproduct = value as String?;
                },
              );
            },
            title: ShowTitle(
              title: 'ผัก',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildProductFruit(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'fruit',
            groupValue: typeproduct,
            onChanged: (value) {
              setState(
                () {
                  typeproduct = value as String?;
                },
              );
            },
            title: ShowTitle(
              title: 'ผลไม้',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildProductMeetPork(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'pork',
            groupValue: typeproduct,
            onChanged: (value) {
              setState(
                () {
                  typeproduct = value as String?;
                },
              );
            },
            title: ShowTitle(
              title: 'เนื้อหมู',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildProductMeetBeef(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'beef',
            groupValue: typeproduct,
            onChanged: (value) {
              setState(
                () {
                  typeproduct = value as String?;
                },
              );
            },
            title: ShowTitle(
              title: 'เนื้อวัว',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildProductMeetChicken(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'chicken',
            groupValue: typeproduct,
            onChanged: (value) {
              setState(
                () {
                  typeproduct = value as String?;
                },
              );
            },
            title: ShowTitle(
              title: 'เนื้อไก่',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildProductSeaFood(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'seafood',
            groupValue: typeproduct,
            onChanged: (value) {
              setState(
                () {
                  typeproduct = value as String?;
                },
              );
            },
            title: ShowTitle(
              title: 'อาหารทะเล',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildProductDryGoods(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'driedFoods',
            groupValue: typeproduct,
            onChanged: (value) {
              setState(
                () {
                  typeproduct = value as String?;
                },
              );
            },
            title: ShowTitle(
              title: 'ของแห้ง',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildProductCondiments(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'condiments',
            groupValue: typeproduct,
            onChanged: (value) {
              setState(
                () {
                  typeproduct = value as String?;
                },
              );
            },
            title: ShowTitle(
              title: 'เครื่องปรุงรส',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildNumber(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: constraints.maxWidth * 0.75,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            controller: NumberController,
            decoration: InputDecoration(
              labelText: 'จำนวลสินค้า :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPrice(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
          width: constraints.maxWidth * 0.75,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            controller: PriceController,
            decoration: InputDecoration(
              labelText: 'ราคาสินค้า :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildDetail(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: constraints.maxWidth * 0.75,
          child: TextFormField(
            maxLines: 5,
            controller: DetailController,
            decoration: InputDecoration(
              labelText: 'รายละเอียดสินค้า :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildTitle(String title) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ShowTitle(
            title: title,
            textStyle: MyConstant().h2Style(),
          ),
        ),
      ],
    );
  }

  Future<Null> procesEdit() async {
    if (formKey.currentState!.validate()) {
      MyDialog().showProgressDialog(context);

      String nameproduct = NameController.text;
      String numberproduct = NumberController.text;
      String unitproduct = UnitProductController.text;
      String priceproduct = PriceController.text;
      String unitprice = UnitPriceController.text;
      String detailproduct = DetailController.text;
      String id = productModel!.id;
      String imagesproduct;
      if (statusImage) {
        // upload Image and Refresh arrey pathImage
        int index = 0;
        for (var item in files) {
          if (item != null) {
            int i = Random().nextInt(1000000);
            String nameImage = 'productEdit$i.jpg';
            String apiUploadImage =
                '${MyConstant.domain}/shopping/saveProduct.php';

            Map<String, dynamic> map = {};
            map['file'] =
                await MultipartFile.fromFile(item.path, filename: nameImage);
            FormData formData = FormData.fromMap(map);
            await Dio().post(apiUploadImage, data: formData).then((value) {
              pathImages[index] = '/product/$nameImage';
            });
          }
          index++;
        }

        imagesproduct = pathImages.toString();
        Navigator.pop(context);
      } else {
        imagesproduct = pathImages.toString();
        Navigator.pop(context);
      }

      String apiEditProduct =
          '${MyConstant.domain}/shopping/editProductWhereId.php?isAdd=true&id=$id&nameproduct=$nameproduct&typeproduct=$typeproduct&numberproduct=$numberproduct&unitproduct=$unitproduct&priceproduct=$priceproduct&unitprice=$unitprice&detailproduct=$detailproduct&imagesproduct=$imagesproduct';
      await Dio().get(apiEditProduct).then((value) => Navigator.pop(context));
    }
  }
}
