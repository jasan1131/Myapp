import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/states/edit_profile_buyer.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowManageBuyer extends StatefulWidget {
  final UserModel userModel;
  const ShowManageBuyer({Key? key, required this.userModel}) : super(key: key);

  @override
  State<ShowManageBuyer> createState() => _ShowManageBuyerState();
}

class _ShowManageBuyerState extends State<ShowManageBuyer> {
  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
  }

  Future<Null> refreshUserModel() async {
    print('## refreshUserModel Work');
    String path =
        '${MyConstant.domain}/shoppingmall/getUserWhereId.php?isAdd=true&id=${userModel!.id}';
    await Dio().get(path).then((value) {
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
          backgroundColor: MyConstant.primary,
          title: Text('ข้อมูลส่วนตัว'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyConstant.primary,
          child: Icon(Icons.edit_outlined),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileBuyer(),
                )).then((value) => refreshUserModel());
          },
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowTitle(
                        title: 'รูปโปรไฟล์ :',
                        textStyle: MyConstant().h2Stylebold(),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: constraints.maxWidth * 0.6,
                        height: constraints.maxWidth * 0.6,
                        child: CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              ShowImage(path: MyConstant.avatar),
                          imageUrl: '${MyConstant.domain}${userModel!.avatar}',
                          placeholder: (context, url) => ShowProgress(),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        ShowTitle(
                          title: 'ชื่อ - นามกสุล : ',
                          textStyle: MyConstant().h2Stylebold(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: ShowTitle(
                            title: '${userModel!.name} ${userModel!.seconname}',
                            textStyle: MyConstant().h2Style(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShowTitle(
                          title: 'ที่อยู่ : ',
                          textStyle: MyConstant().h2Stylebold(),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: ShowTitle(
                                title: userModel!.address,
                                textStyle: MyConstant().h2Style(),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        ShowTitle(
                          title: 'เบอร์โทรศัพท์ : ',
                          textStyle: MyConstant().h2Stylebold(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: ShowTitle(
                            title: userModel!.phone,
                            textStyle: MyConstant().h2Style(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        ShowTitle(
                          title: 'เฟสบุ๊ก : ',
                          textStyle: MyConstant().h2Stylebold(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: ShowTitle(
                            title: userModel!.facebook,
                            textStyle: MyConstant().h2Style(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        ShowTitle(
                          title: 'ไลน์ไอดี : ',
                          textStyle: MyConstant().h2Stylebold(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: ShowTitle(
                            title: userModel!.line,
                            textStyle: MyConstant().h2Style(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShowTitle(
                            title: 'แผนที่ : ',
                            textStyle: MyConstant().h2Stylebold()),
                        Container(
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
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
