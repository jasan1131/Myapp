import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/models/slip_model.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class ShowStatusMoney extends StatefulWidget {
  final OrderModel orderModel;
  const ShowStatusMoney({Key? key, required this.orderModel}) : super(key: key);

  @override
  State<ShowStatusMoney> createState() => _ShowStatusMoneyState();
}

class _ShowStatusMoneyState extends State<ShowStatusMoney> {
  OrderModel? orderModel;
  SlipModel? slipModel;
  List<SlipModel> slipModels = [];
  String? idBuyer;
  bool loadData = true;
  bool? haveData;

  get UserModel => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderModel = widget.orderModel;
    loadDataSlip();
  }

  Future<Null> loadDataSlip() async {
    idBuyer = orderModel!.id;
    String path =
        '${MyConstant.domain}/shopping/getSlipWhereId.php?isAdd=true&id=$idBuyer';
    await Dio().get(path).then((value) async {
      setState(() {
        loadData = false;
        haveData = false;
      });
      for (var item in json.decode(value.data)) {
        SlipModel model = SlipModel.fromMap(item);
        setState(() {
          loadData = false;
          haveData = true;
          slipModels.add(model);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('สานะการจ่ายเงิน'),
        backgroundColor: MyConstant.primary,
      ),
      body: loadData
          ? ShowProgress()
          : haveData!
              ? buildListView()
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShowTitle(
                          title: 'ไม่มีการสั่งซื้อ',
                          textStyle: MyConstant().h1Style()),
                      ShowTitle(
                          title: 'ไม่มีการสั่งสินค้าจากลูกค้า',
                          textStyle: MyConstant().h2Style()),
                    ],
                  ),
                ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
        itemCount: slipModels.length,
        itemBuilder: (context, index) => Column(
              children: [
                Container(
                  // margin: EdgeInsets.symmetric(vertical: ),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) =>
                        ShowImage(path: MyConstant.image1),
                    placeholder: (context, url) => ShowProgress(),
                    imageUrl:
                        '${MyConstant.domain}${slipModels[index].pathslip}',
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
                              title: 'ชื่อ - นามสกุล : ',
                              textStyle: MyConstant().h3Stylebold(),
                            ),
                            ShowTitle(
                              title: '${slipModels[index].namebuyer} ${slipModels[index].secondnamebuyer}',
                              textStyle: MyConstant().h3Style(),
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
                              title: 'วันที่ : ',
                              textStyle: MyConstant().h3Stylebold(),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3.5),
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: ShowTitle(
                                title: '${slipModels[index].dateDay}',
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
                              title: 'เวลา : ',
                              textStyle: MyConstant().h3Stylebold(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: ShowTitle(
                                title: '${slipModels[index].dateTime}',
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
                              title: 'สถานะ : ',
                              textStyle: MyConstant().h3Stylebold(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: ShowTitle(
                                title: '${slipModels[index].status}',
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
            ));
  }
}
