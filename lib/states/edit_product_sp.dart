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

class EditProductSpecial extends StatefulWidget {
  final ProductModel productModel;
  const EditProductSpecial({Key? key, required this.productModel})
      : super(key: key);

  @override
  State<EditProductSpecial> createState() => _EditProductSpecialState();
}

class _EditProductSpecialState extends State<EditProductSpecial> {
  String? typeproDuct;
  ProductModel? productModel;

  TextEditingController NameController = TextEditingController();
  TextEditingController NumberController = TextEditingController();
  TextEditingController PriceController = TextEditingController();
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
    PriceController.text = productModel!.priceproduct;
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
        centerTitle: true,
        title: Text('Edit Product'),
        actions: [
          IconButton(
            onPressed: () => procesEdit(),
            icon: Icon(Icons.edit),
            tooltip: 'Edit Product',
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
                    buildTitle('General :'),
                    buildName(constraints),
                    buildTitle('Type Product :'),
                    buildProductVegetables(size),
                    buildProductMeet(size),
                    buildProductDryGoods(size),
                    buildProductCondiments(size),
                    buildNumber(constraints),
                    buildPrice(constraints),
                    buildDetail(constraints),
                    buildTitle('Image Product :'),
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
            label: Text('Edit Product'),
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

  Row buildName(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: constraints.maxWidth * 0.75,
          child: TextFormField(
            controller: NameController,
            decoration: InputDecoration(
              labelText: 'ชื่อ :',
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
            groupValue: typeproDuct,
            onChanged: (value) {
              setState(
                () {
                  typeproDuct = value as String?;
                },
              );
            },
            title: ShowTitle(
              title: 'ผักผลไม้',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildProductMeet(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'meet',
            groupValue: typeproDuct,
            onChanged: (value) {
              setState(
                () {
                  typeproDuct = value as String?;
                },
              );
            },
            title: ShowTitle(
              title: 'เนื้อสัตว์',
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
            value: 'dryGoods',
            groupValue: typeproDuct,
            onChanged: (value) {
              setState(
                () {
                  typeproDuct = value as String?;
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
            value: 'Condiments',
            groupValue: typeproDuct,
            onChanged: (value) {
              setState(
                () {
                  typeproDuct = value as String?;
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
              labelText: 'จำนวน :',
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
              labelText: 'ราคา :',
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
            maxLines: 3,
            controller: DetailController,
            decoration: InputDecoration(
              labelText: 'Detail :',
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

      String nameproDuct = NameController.text;
      String numberproDuct = NumberController.text;
      String priceproDuct = PriceController.text;
      String detailproDuct = DetailController.text;
      String iD = productModel!.id;
      String imageproDuct;
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

        imageproDuct = pathImages.toString();
        Navigator.pop(context);
      } else {
        imageproDuct = pathImages.toString();
        Navigator.pop(context);
      }

      String apiEditProduct =
          '${MyConstant.domain}/shopping/editProductSpWhereId.php?isAdd=true&iD=$iD&nameproDuct=$nameproDuct&typeproDuct=$typeproDuct&numberproDuct=$numberproDuct&priceproDuct=$priceproDuct&detailproDuct=$detailproDuct&imageproDuct=$imageproDuct';
      await Dio().get(apiEditProduct).then((value) => Navigator.pop(context));
    }
  }
}
