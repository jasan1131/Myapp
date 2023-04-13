import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/models/user_models.dart';

import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowConfirmOrderByRider extends StatefulWidget {
  final OrderModel orderModel;
  const ShowConfirmOrderByRider({Key? key, required this.orderModel})
      : super(key: key);

  @override
  State<ShowConfirmOrderByRider> createState() =>
      _ShowConfirmOrderByRiderState();
}

class _ShowConfirmOrderByRiderState extends State<ShowConfirmOrderByRider> {
  OrderModel? orderModel;
  UserModel? userModel;
  List<UserModel> userModels = [];
  String? idBuyer;
  bool loadData = false;
  bool haveData = false;
  double? lat1, lng1, lat2, lng2;
  CameraPosition? position;
  String? id;
  String? idRider;
  String? nameRider;
  GoogleMapController? mapController;

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
        LocationData? locationData = await finalLocationData();
        setState(() {
          lat1 = double.parse(model.lat);
          lng1 = double.parse(model.lng);
          lat2 = locationData!.latitude;
          lng2 = locationData.longitude;
          print('lat = $lat1, lng = $lng1, lat1 = $lat2, lng1 = $lng2');
        });
      }
    });
  }

  Future<LocationData?> finalLocationData() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } catch (e) {
      return null;
    }
  } // print('orderModel = ${orderModel!.nameProduct}');

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
              Column(
                children: [
                  Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              ShowTitle(
                                title: 'ชื่อ ',
                                textStyle: MyConstant().h2Stylebold(),
                              ),
                              ShowTitle(
                                title: '${userModels[index].name}',
                                textStyle: MyConstant().h2Style(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    ShowTitle(
                                      title: 'นามสกุล ',
                                      textStyle: MyConstant().h2Stylebold(),
                                    ),
                                    ShowTitle(
                                      title: '${userModels[index].seconname}',
                                      textStyle: MyConstant().h2Style(),
                                    ),
                                  ],
                                ),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: showmap(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                      // style: ButtonStyle(
                      //   backgroundColor: MaterialStateProperty.all(
                      //     Colors.white.withOpacity(0.75),
                      //   ),
                      // ),
                      onPressed: () {
                        confirmOrder(index);
                      },
                      child: ShowTitle(
                        title: 'ยืนยันการรับสินค้า',
                        textStyle: MyConstant().h3WhiteStyle(),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future confirmOrder(index) async {
    id = orderModel!.id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idRider = preferences.getString('id');
    nameRider = userModels[index].name;
    String status = 'riderConfirmOrder';
    String url =
        '${MyConstant.domain}/shopping/editStatusWhereId.php?isAdd=true&id=$id&idRider=$idRider&nameRider=$nameRider&status=$status';
    await Dio().get(url).then((value) {
      MyDialog()
          .normalDialogConfirmOrderOk(context, 'รับคำสั่งซื้อเรียบร้อยแล้ว');
    });
  }

  Container showmap() {
    if (lat1 != null) {
      LatLng latLng1 = LatLng(lat1!, lng1!);
      position = CameraPosition(
        target: latLng1,
        zoom: 13,
      );
    }
    Marker userMarker() {
      return Marker(
        markerId: MarkerId('userMarker'),
        position: LatLng(lat1!, lng1!),
        icon: BitmapDescriptor.defaultMarkerWithHue(150.0),
        infoWindow: InfoWindow(title: 'ลูกค้า'),
      );
    }

    Set<Marker> mySet() {
      return <Marker>[userMarker()].toSet();
    }

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 16,
      ),
      height: 250,
      child: lat1 == null
          ? ShowProgress()
          : GoogleMap(
              myLocationEnabled: true,
              initialCameraPosition: position!,
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              markers: mySet(),
            ),
    );
  }
}
