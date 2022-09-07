import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowAboutSeller extends StatefulWidget {
  final UserModel userModel;
  const ShowAboutSeller({Key? key, required this.userModel}) : super(key: key);

  @override
  State<ShowAboutSeller> createState() => _ShowAboutSellerState();
}

class _ShowAboutSellerState extends State<ShowAboutSeller> {
  UserModel? userModel;
  double? lat1, lng1, lat2, lng2, distance;
  String? distanceString;
  int? transport;
  CameraPosition? position;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
    findLat1Lng1();
  }

  Future<Null> findLat1Lng1() async {
    LocationData? locationData = await finalLocationData();
    setState(() {
      lat1 = locationData!.latitude;
      lng1 = locationData.longitude;
      lat2 = double.parse(userModel!.lat);
      lng2 = double.parse(userModel!.lng);
      print('lat1 = $lat1, lng1 = $lng1, lat2 = $lat2, lng2 = $lng2');
      distance = calculateDistance(lat1!, lng1!, lat2!, lng2!);

      var myFormat = NumberFormat('##.0#', 'en_US');
      distanceString = myFormat.format(distance);

      transport = calculateTransport(distance!);

      print('distance = $distance');
      print('transport ==> $transport');
    });
  }

  int calculateTransport(double distance) {
    int transport;
    if (distance < 1.0) {
      transport = 5;
      return transport;
    } else {
      transport = 5 + (distance - 1).round() * 1;
      return transport;
    }
  }

  double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    double distance = 0;

    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lng2 - lng1) * p)) / 2;
    distance = 12742 * asin(sqrt(a));

    return distance;
  }

  Future<LocationData?> finalLocationData() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        centerTitle: true,
        title: Text(userModel!.name),
      ),
      body: userModel == null
          ? ShowProgress()
          : Container(
              decoration: MyConstant().gradientRadioBackground(),
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 16),
                                width: constraints.maxWidth * 0.6,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${MyConstant.domain}${userModel!.avatar}',
                                  placeholder: (context, url) => ShowProgress(),
                                ),
                              ),
                            ],
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.home_outlined,
                              color: Colors.black,
                            ),
                            title: ShowTitle(
                              title: userModel!.address,
                              textStyle: MyConstant().h3BlackStyle(),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.phone_outlined,
                              color: Colors.black,
                            ),
                            title: ShowTitle(
                              title: userModel!.phone,
                              textStyle: MyConstant().h3BlackStyle(),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.facebook_outlined,
                              color: Colors.black,
                            ),
                            title: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                ),
                                children: [
                                  TextSpan(
                                    style: TextStyle(),
                                    text: 'jasan1131@gmail.com',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        String url =
                                            'https://www.facebook.com/profile.php?id=100006300521203';
                                        var urllaunchable =
                                            await canLaunch(url);
                                        if (urllaunchable) {
                                          await launch(url);
                                        } else {
                                          print('URL can mot be launched');
                                        }
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ListTile(
                            leading: ImageIcon(
                                AssetImage(
                                  MyConstant.line,
                                ),
                                color: Colors.black),
                            title: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                ),
                                children: [
                                  TextSpan(
                                    style: TextStyle(),
                                    text: 'jasan032',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        String url =
                                            'https://l.facebook.com/l.php?u=https%3A%2F%2Fline.me%2FR%2Fti%2Fg%2FOzWP4EQuSU%3Ffbclid%3DIwAR26_yVDZff6Y9X-Uy9W-PpdGiGUYBetRlvKSQKRznKRTJKy7iw6UGrJnBA&h=AT1SNG3QgF5n4Z7KLYGC9ZSMkC_CyvcclV61FDAxdOOcZRRkH0wfO9AzI1-dHH2nyInjujajLk8s9gsrhh6R9Ggvoy-tREWfUQY_aIfjg1XAGqfkunKRyuX1oMFMnJVq38_r2DqWzu7eYfQ';
                                        var urllaunchable =
                                            await canLaunch(url);
                                        if (urllaunchable) {
                                          await launch(url);
                                        } else {
                                          print('URL can mot be launched');
                                        }
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ListTile(
                            leading: ImageIcon(
                                AssetImage(
                                  MyConstant.instagram,
                                ),
                                color: Colors.black),
                            title: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'jason thongchai',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        String url =
                                            'https://www.instagram.com/jasonthongchai/';
                                        var urllaunchable =
                                            await canLaunch(url);
                                        if (urllaunchable) {
                                          await launch(url);
                                        } else {
                                          print('URL can mot be launched');
                                        }
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ListTile(
                            leading: ImageIcon(
                                AssetImage(
                                  MyConstant.twitter,
                                ),
                                color: Colors.black),
                            title: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'jasan Thongchai',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        String url =
                                            'https://twitter.com/JasanPotter';
                                        var urllaunchable =
                                            await canLaunch(url);
                                        if (urllaunchable) {
                                          await launch(url);
                                        } else {
                                          print('URL can mot be launched');
                                        }
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.local_shipping_outlined,
                              color: Colors.black,
                            ),
                            title: ShowTitle(
                              title: distance == null
                                  ? ''
                                  : '$distanceString กิโลเมตร',
                              textStyle: MyConstant().h3BlackStyle(),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.transfer_within_a_station,
                              color: Colors.black,
                            ),
                            title: ShowTitle(
                              title: transport == null ? '' : '$transport บาท',
                              textStyle: MyConstant().h3BlackStyle(),
                            ),
                          ),
                          showmap(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Container showmap() {
    if (lat1 != null) {
      LatLng latLng2 = LatLng(lat2!, lng2!);
      position = CameraPosition(
        target: latLng2,
        zoom: 18,
      );
    }
    Marker userMarker() {
      return Marker(
        markerId: MarkerId('userMarker'),
        position: LatLng(lat1!, lng1!),
        icon: BitmapDescriptor.defaultMarkerWithHue(60.0),
        infoWindow: InfoWindow(title: 'คุณอยู่ที่นี้'),
      );
    }

    Marker shopMarker() {
      return Marker(
        markerId: MarkerId('shopMarker'),
        position: LatLng(lat2!, lng2!),
        icon: BitmapDescriptor.defaultMarkerWithHue(150.0),
        infoWindow: InfoWindow(title: userModel!.name),
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
