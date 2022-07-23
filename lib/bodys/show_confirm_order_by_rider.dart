import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

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
      appBar: AppBar(),
      body: Container(
        decoration: MyConstant().planBackground(),
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
                          textStyle: MyConstant().h1Style(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: ShowTitle(
                            title: 'นามสกุล ${userModels[index].seconname}',
                            textStyle: MyConstant().h1Style(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(
                      title: 'ที่อยู่ : ${userModels[index].address}',
                      textStyle: MyConstant().h2Style(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(
                      title: 'เบอรืโทรศัพท์ : ${userModels[index].phone}',
                      textStyle: MyConstant().h2Style(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: showmap(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container showmap() {
    if (lat1 != null) {
      LatLng latLng1 = LatLng(lat1!, lng1!);
      position = CameraPosition(
        target: latLng1,
        zoom: 10,
      );
    }
    Marker userMarker() {
      return Marker(
        markerId: MarkerId('userMarker'),
        position: LatLng(lat1!, lng1!),
        icon: BitmapDescriptor.defaultMarkerWithHue(150.0),
        infoWindow: InfoWindow(title: 'คุณอยู่ที่นี้'),
      );
    }

    Marker shopMarker() {
      return Marker(
        markerId: MarkerId('shopMarker'),
        position: LatLng(lat2!, lng2!),
        icon: BitmapDescriptor.defaultMarkerWithHue(60.0),
        infoWindow: InfoWindow(title: 'คุณอยู่ที่นี้'),
      );
    }

    Set<Marker> mySet() {
      return <Marker>[userMarker(), shopMarker()].toSet();
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
              initialCameraPosition: position!,
              mapType: MapType.normal,
              onMapCreated: (context) {},
              markers: mySet(),
            ),
    );
  }
}
