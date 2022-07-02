import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProductWholeSale extends StatefulWidget {
  const AddProductWholeSale({ Key? key }) : super(key: key);

  @override
  State<AddProductWholeSale> createState() => _AddProductWholeSaleState();
}

class _AddProductWholeSaleState extends State<AddProductWholeSale> {
  String? typeProduct;
  final formKey = GlobalKey<FormState>();
  List<File?> files = [];
  File? file;

  TextEditingController NameProductController = TextEditingController();
  TextEditingController NumberProductController = TextEditingController();
  TextEditingController PriceProductController = TextEditingController();
  TextEditingController DetailProductController = TextEditingController();

  List<String> paths = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialFile();
  }

  void initialFile() {
    for (var i = 0; i < 4; i++) {
      files.add(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => processAddProduct(),
            icon: Icon(Icons.cloud_upload),
          ),
        ],
        title: Text('เพิ่มสินค้า'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            FocusScopeNode(),
          ),
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    buildProductName(constraints),
                    buildTitle('ชนิดของสินค้า'),
                    buildProductVegetables(size),
                    buildProductMeet(size),
                    buildProductDryGoods(size),
                    buildProductCondiments(size),
                    buildProductNumber(constraints),
                    buildProductPrice(constraints),
                    buildProductDetail(constraints),
                    buildImage(constraints),
                    addProductButtom(constraints),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container addProductButtom(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.7,
      child: ElevatedButton(
        style: MyConstant().myButtonStyle(),
        onPressed: () {
          processAddProduct();
        },
        child: Text('Add Product'),
      ),
    );
  }

  Future<Null> processAddProduct() async {
    if (formKey.currentState!.validate()) {
      bool checkFile = true;
      for (var item in files) {
        if (item == null) {
          checkFile = false;
        }
      }
      if (checkFile) {
        MyDialog().showProgressDialog(context);

        String apiSaveProduct = '${MyConstant.domain}/shopping/saveProduct.php';

        int loop = 0;
        for (var item in files) {
          int i = Random().nextInt(1000000);
          String nameFile = 'product$i.jpg';

          paths.add('/product/$nameFile');

          Map<String, dynamic> map = {};
          map['file'] =
              await MultipartFile.fromFile(item!.path, filename: nameFile);
          FormData data = FormData.fromMap(map);
          await Dio().post(apiSaveProduct, data: data).then((value) async {
            print('Upload Success');
            loop++;
            if (loop >= files.length) {
              SharedPreferences preference =
                  await SharedPreferences.getInstance();

              String idProduct = preference.getString('id')!;
              String nameProduct = NameProductController.text;
              String numberProduct = NumberProductController.text;
              String priceProduct = PriceProductController.text;
              String detailProduct = DetailProductController.text;
              String imageProduct = paths.toString();

              String path =
                  '${MyConstant.domain}/shopping/insertProductWholeSale.php?isAdd=true&idProduct=$idProduct&nameProduct=$nameProduct&typeProduct=$typeProduct&numberProduct=$numberProduct&priceProduct=$priceProduct&detailProduct=$detailProduct&imageProduct=$imageProduct';

              await Dio().get(path).then((value) => Navigator.pop(context));

              Navigator.pop(context);
            }
          });
        }
      } 
    }
  }

  Future<Null> processImagePicker(ImageSource source, int index) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
        files[index] = file;
      });
    } catch (e) {}
  }

  Future<Null> chooseSourceImageDialog(int index) async {
    print('Click From index ==>> $index');
    showDialog(
      context: context,
      builder: (contex) => AlertDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.product),
          title: ShowTitle(
            title: 'Source Image ${index + 1}?',
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(
              title: 'Please Tap on Camera or Gallery',
              textStyle: MyConstant().h3Style()),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  processImagePicker(ImageSource.camera, index);
                },
                child: Text('Camera'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  processImagePicker(ImageSource.gallery, index);
                },
                child: Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column buildImage(BoxConstraints constraints) {
    return Column(
      children: [
        Container(
          width: constraints.maxWidth * 0.75,
          height: constraints.maxWidth * 0.75,
          child: file == null
              ? Image.asset(MyConstant.product)
              : Image.file(file!),
        ),
        Container(
          width: constraints.maxWidth * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48,
                height: 48,
                child: InkWell(
                  onTap: () => chooseSourceImageDialog(0),
                  child: files[0] == null
                      ? Image.asset(MyConstant.product)
                      : Image.file(
                          files[0]!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Container(
                width: 48,
                height: 48,
                child: InkWell(
                  onTap: () => chooseSourceImageDialog(1),
                  child: files[1] == null
                      ? Image.asset(MyConstant.product)
                      : Image.file(
                          files[1]!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Container(
                width: 48,
                height: 48,
                child: InkWell(
                  onTap: () => chooseSourceImageDialog(2),
                  child: files[2] == null
                      ? Image.asset(MyConstant.product)
                      : Image.file(
                          files[2]!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Container(
                width: 48,
                height: 48,
                child: InkWell(
                  onTap: () => chooseSourceImageDialog(3),
                  child: files[3] == null
                      ? Image.asset(MyConstant.product)
                      : Image.file(
                          files[3]!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildProductName(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.75,
      margin: EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: NameProductController,
        decoration: InputDecoration(
          hintText: 'ชื่อสินค้า :',
          hintStyle: MyConstant().h3Style(),
          prefixIcon: Icon(
            Icons.production_quantity_limits_outlined,
            color: MyConstant.dark,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyConstant.dark,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyConstant.light),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Widget buildProductNumber(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.75,
      margin: EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: NumberProductController,
        decoration: InputDecoration(
          hintText: 'จำนวนสินค้า :',
          hintStyle: MyConstant().h3Style(),
          prefixIcon: Icon(
            Icons.production_quantity_limits_outlined,
            color: MyConstant.dark,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyConstant.dark,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyConstant.light),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Widget buildProductPrice(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.75,
      margin: EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: PriceProductController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'ราคาสินค้า :',
          hintStyle: MyConstant().h3Style(),
          prefixIcon: Icon(
            Icons.money,
            color: MyConstant.dark,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyConstant.dark,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyConstant.light),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Widget buildProductDetail(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.75,
      margin: EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: DetailProductController,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: 'รายระเอียดสินค้า :',
          hintStyle: MyConstant().h3Style(),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
            child: Icon(
              Icons.details_rounded,
              color: MyConstant.dark,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyConstant.dark,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyConstant.light),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
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
            groupValue: typeProduct,
            onChanged: (value) {
              setState(
                () {
                  typeProduct = value as String?;
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
            groupValue: typeProduct,
            onChanged: (value) {
              setState(
                () {
                  typeProduct = value as String?;
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
            groupValue: typeProduct,
            onChanged: (value) {
              setState(
                () {
                  typeProduct = value as String?;
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
            groupValue: typeProduct,
            onChanged: (value) {
              setState(
                () {
                  typeProduct = value as String?;
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

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: MyConstant().h2Style(),
      ),
    );
  }
}