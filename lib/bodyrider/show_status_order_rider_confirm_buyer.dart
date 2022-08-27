import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/order_model.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowStatusOrderRiderConfirmBuyer extends StatefulWidget {
  final OrderModel orderModel;
  const ShowStatusOrderRiderConfirmBuyer({Key? key, required this.orderModel})
      : super(key: key);

  @override
  State<ShowStatusOrderRiderConfirmBuyer> createState() =>
      _ShowStatusOrderRiderConfirmBuyerState();
}

class _ShowStatusOrderRiderConfirmBuyerState
    extends State<ShowStatusOrderRiderConfirmBuyer> {
  UserModel? userModel;
  OrderModel? orderModel;
  double? lat1, lng1, lat2, lng2;
  double distance = 0.0;
  bool? loadData;
  CameraPosition? position;
  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();
  String googleApiKey = "AIzaSyDnIQCYp-e4OoLMf-Q5YrfKNyTo94Lvpfg";
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  String? idRider;
  String? idBuyer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderModel = widget.orderModel;
    readLocation();
  }

  Future<Null> readLocation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idBuyer = preferences.getString('id');
    idRider = orderModel!.idRider;
    print('idBuyer = $idBuyer');
    try {
      String pathURL =
          '${MyConstant.domain}/shopping/getUserWhereId.php?isAdd=true&id=$idBuyer';
      await Dio().get(pathURL).then((value) async {
        setState(() {
          loadData = false;
        });
        for (var item in json.decode(value.data)) {
          UserModel models = UserModel.fromMap(item);

          LocationData? locationData = await finalLocationData();
          setState(() {
            lat1 = double.parse(models.lat);
            lng1 = double.parse(models.lng);
            print('lat1 = $lat1, lng1 = $lng1');
          });
        }
      });
    } catch (e) {}

    try {
      String pathAPI =
          '${MyConstant.domain}/shopping/getUserWhereId.php?isAdd=true&id=$idRider';
      await Dio().get(pathAPI).then((value) async {
        setState(() {
          loadData = false;
        });
        for (var item in json.decode(value.data)) {
          UserModel model = UserModel.fromMap(item);

          LocationData? locationData = await finalLocationData();
          setState(() {
            lat2 = double.parse(model.lat);
            lng2 = double.parse(model.lng);
            print('lat2 = $lat2, lng2 = $lng2');
          });
          PolylineResult result =
              await polylinePoints.getRouteBetweenCoordinates(
            googleApiKey,
            PointLatLng(lat1!, lng1!),
            PointLatLng(lat2!, lng2!),
            travelMode: TravelMode.driving,
          );
          if (result.points.isNotEmpty) {
            result.points.forEach((PointLatLng point) {
              polylineCoordinates.add(
                LatLng(point.latitude, point.longitude),
              );
            });
          } else {
            print(result.errorMessage);
          }

          double totalDistance = 0;
          for (var i = 0; i < polylineCoordinates.length - 1; i++) {
            totalDistance += calculateDistance(
                polylineCoordinates[i].latitude,
                polylineCoordinates[i].longitude,
                polylineCoordinates[i + 1].latitude,
                polylineCoordinates[i + 1].longitude);
          }
          print(totalDistance);
          setState(() {
            distance = totalDistance;
          });
          addPolyLine(polylineCoordinates);
        }
      });
    } catch (e) {}
  }

  void addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 4,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  double calculateDistance(lat1, lng1, lat2, lng2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lng2 - lng1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<LocationData?> finalLocationData() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } catch (e) {
      return null;
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          showmap(),
          Positioned(
              top: 10,
              left: 125,
              child: Card(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ShowTitle(
                      title: 'Total Distance: ' +
                          distance.toStringAsFixed(2) +
                          ' km',
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Container showmap() {
    if (lat1 != null) {
      LatLng latLng1 = LatLng(lat1!, lng1!);
      position = CameraPosition(
        target: latLng1,
        zoom: 15,
      );
    }
    Marker userMarker() {
      return Marker(
        markerId: MarkerId('userMarker'),
        position: LatLng(lat1!, lng1!),
        icon: BitmapDescriptor.defaultMarkerWithHue(200.0),
        infoWindow: InfoWindow(title: 'คุณอยู่ที่นี้'),
      );
    }

    Marker riderMarker() {
      return Marker(
        markerId: MarkerId('userMarker'),
        position: LatLng(lat2!, lng2!),
        icon: BitmapDescriptor.defaultMarkerWithHue(150.0),
        infoWindow: InfoWindow(title: 'คนส่งสินค้า'),
      );
    }

    Set<Marker> mySet() {
      return <Marker>[userMarker(), riderMarker()].toSet();
    }

    return Container(
      child: lat1 == null
          ? ShowProgress()
          : GoogleMap(
              zoomControlsEnabled: true,
              initialCameraPosition: position!,
              mapType: MapType.normal,
              // myLocationEnabled: true,
              onMapCreated: _onMapCreated,
              markers: mySet(),
              polylines: Set<Polyline>.of(polylines.values),
            ),
    );
  }
}
