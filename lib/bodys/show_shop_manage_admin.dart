import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopManageAdmin extends StatefulWidget {
  final UserModel userModel;
  const ShopManageAdmin({Key? key, required this.userModel}) : super(key: key);

  @override
  State<ShopManageAdmin> createState() => _ShopManageAdminState();
}

class _ShopManageAdminState extends State<ShopManageAdmin> {
  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
  }

  Future<Null> refreshUserModel() async {
    print('## refreshUserModel Work');
    String apiGetUserWhereId =
        '${MyConstant.domain}/shoppingmall/getUserWhereId.php?isAdd=true&id=${userModel!.id}';
    await Dio().get(apiGetUserWhereId).then((value) {
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('หน้าร้าน'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyConstant.primary,
          child: Icon(Icons.edit_outlined),
          onPressed: () {
            Navigator.pushNamed(context, MyConstant.rounteEditProfileAdmin)
                .then((value) => refreshUserModel());
          },
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ShowTitle(
                      title: 'รูปโปรไฟล์ :',
                      textStyle: MyConstant().h2Style(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        width: constraints.maxWidth * 0.6,
                        child: CachedNetworkImage(
                          imageUrl: '${MyConstant.domain}${userModel!.avatar}',
                          placeholder: (context, url) => ShowProgress(),
                        ),
                      ),
                    ],
                  ),
                  ShowTitle(title: 'ชื่อ :', textStyle: MyConstant().h2Style()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ShowTitle(
                            title: userModel!.name,
                            textStyle: MyConstant().h2Style()),
                      ),
                    ],
                  ),
                  ShowTitle(
                    title: 'ที่อยู่ :',
                    textStyle: MyConstant().h2Style(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: constraints.maxWidth * 0.6,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ShowTitle(title: userModel!.address),
                        ),
                      ),
                    ],
                  ),
                  ShowTitle(
                    title: 'เบอร์โทรศัพท์ : ${userModel!.phone}',
                    textStyle: MyConstant().h2Style(),
                  ),
                  ShowTitle(
                      title: 'Location :', textStyle: MyConstant().h2Style()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        width: constraints.maxWidth * 0.6,
                        height: constraints.maxWidth * 0.6,
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                              double.parse(userModel!.lat),
                              double.parse(userModel!.lng),
                            ),
                            zoom: 16,
                          ),
                          markers: <Marker>[
                            Marker(
                                markerId: MarkerId('id'),
                                position: LatLng(
                                  double.parse(userModel!.lat),
                                  double.parse(userModel!.lng),
                                ),
                                infoWindow: InfoWindow(
                                    title: 'You Here ',
                                    snippet:
                                        'lat = ${userModel!.lat}, lng = ${userModel!.lng}')),
                          ].toSet(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
