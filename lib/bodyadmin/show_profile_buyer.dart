import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowProfileBuyer extends StatefulWidget {
  final OrderModel orderModel;
  const ShowProfileBuyer({Key? key, required this.orderModel})
      : super(key: key);

  @override
  State<ShowProfileBuyer> createState() => _ShowProfileBuyerState();
}

class _ShowProfileBuyerState extends State<ShowProfileBuyer> {
  OrderModel? orderModel;
  UserModel? userModel;
  List<UserModel> userModels = [];
  String? idBuyer;
  bool loadData = false;
  bool haveData = false;
  CameraPosition? position;
  String? id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderModel = widget.orderModel;
    loadDataBuyer();
    ;
  }

  Future<Null> loadDataBuyer() async {
    idBuyer = orderModel!.idBuyer;
    String pathAPI =
        '${MyConstant.domain}/shopping/getUserWhereId.php?isAdd=true&id=$idBuyer';
    await Dio().get(pathAPI).then((value) async {
      setState(() {
        loadData = false;
      });
      for (var item in json.decode(value.data)) {
        UserModel model = UserModel.fromMap(item);
        setState(() {
          userModels.add(model);
        });
      }
    });
  }

// print('orderModel = ${orderMod
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('รายการสินค้าที่ลูกค้าสั่ง'),
        backgroundColor: MyConstant.primary,
      ),
      body: Container(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: userModels.length,
          itemBuilder: (context, index) => Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.35,
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) =>
                      ShowImage(path: MyConstant.avatar),
                  placeholder: (context, url) => ShowProgress(),
                  imageUrl: '${MyConstant.domain}${userModels[index].avatar}',
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          ShowTitle(
                            title: 'ชื่อ - นามสกุล ',
                            textStyle: MyConstant().h2Stylebold(),
                          ),
                          ShowTitle(
                            title:
                                '${userModels[index].name} ${userModels[index].seconname}',
                            textStyle: MyConstant().h2Style(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShowTitle(
                            title: 'ที่อยู่ : ',
                            textStyle: MyConstant().h3Stylebold(),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 1),
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: ShowTitle(
                              title: '${userModels[index].address}',
                              textStyle: MyConstant().h3Style(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          ShowTitle(
                            title: 'เบอร์โทรศัพท์ : ',
                            textStyle: MyConstant().h3Stylebold(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: ShowTitle(
                              title: '${userModels[index].phone}',
                              textStyle: MyConstant().h3Style(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          ShowTitle(
                            title: 'เฟสบุ๊ก : ',
                            textStyle: MyConstant().h3Stylebold(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: ShowTitle(
                              title: '${userModels[index].facebook}',
                              textStyle: MyConstant().h3Style(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          ShowTitle(
                            title: 'ไลน์ : ',
                            textStyle: MyConstant().h3Stylebold(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: ShowTitle(
                              title: '${userModels[index].line}',
                              textStyle: MyConstant().h3Style(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
