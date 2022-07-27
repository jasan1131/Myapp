import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/bodys/rider_map.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowOrderShippedByRider extends StatefulWidget {
  final OrderModel orderModel;
  const ShowOrderShippedByRider({Key? key, required this.orderModel})
      : super(key: key);

  @override
  State<ShowOrderShippedByRider> createState() =>
      _ShowOrderShippedByRiderState();
}

class _ShowOrderShippedByRiderState extends State<ShowOrderShippedByRider> {
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
        backgroundColor: MyConstant.primary,
      ),
      body: Container(
        decoration: MyConstant().gradientRadioBackground(),
        child: ListView.builder(
          itemCount: userModels.length,
          itemBuilder: (context, index) => Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.35,
                child: CachedNetworkImage(
                  imageUrl: '${MyConstant.domain}${userModels[index].avatar}',
                  placeholder: (context, url) => ShowProgress(),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ShowTitle(
                          title: 'ชื่อ ${userModels[index].name}',
                          textStyle: MyConstant().h1BackStyle(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: ShowTitle(
                            title: 'นามสกุล ${userModels[index].seconname}',
                            textStyle: MyConstant().h1BackStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(
                      title: 'ที่อยู่ : ${userModels[index].address}',
                      textStyle: MyConstant().h2BackStyle(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(
                      title: 'เบอรืโทรศัพท์ : ${userModels[index].phone}',
                      textStyle: MyConstant().h2BackStyle(),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 16),
                  //   child: showmap(),
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyConstant.light)),
                      onPressed: () {
                        confirmOrder(index);
                      },
                      child: ShowTitle(
                        title: 'ยันยันการส่งสินค้า',
                        textStyle: MyConstant().h3BlackStyle(),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            print('idBuyer = $idBuyer');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RiderMaps(orderModel: orderModel!),
                ));
          },
          tooltip: 'Incrment',
          child: Icon(
            Icons.near_me,
            size: 35,
            color: MyConstant.dark,
          ),
        ),
      ),
    );
  }

  Future confirmOrder(index) async {}
}
