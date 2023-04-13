import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/states/edit_profile_admin.dart';
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
    refreshUserModel();
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
                  builder: (context) => EditProfileAdmin(),
                )).then((value) => refreshUserModel());
          },
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildImage(constraints),
                  buildHomePage(),
                  buildNameANDSeconName(),
                  buildAddress(context),
                  buildPhone(),
                  buildFacebook(),
                  buildLine(),
                  buildInstaGram(),
                  buildTwitter(),
                  buildMap(constraints),
                ],
              ),
            ),
          ),
        ));
  }

  Padding buildTwitter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          ShowTitle(
            title: 'ทวิตเตอร์ : ',
            textStyle: MyConstant().h2Stylebold(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: ShowTitle(
              title: userModel!.twitter,
              textStyle: MyConstant().h2Style(),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildInstaGram() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          ShowTitle(
            title: 'อินสตราแกรม : ',
            textStyle: MyConstant().h2Stylebold(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: ShowTitle(
              title: userModel!.instargarm,
              textStyle: MyConstant().h2Style(),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          ShowTitle(
            title: 'ไอดีไลน์ : ',
            textStyle: MyConstant().h2Stylebold(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: ShowTitle(
              title: userModel!.line,
              textStyle: MyConstant().h2Style(),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildFacebook() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          ShowTitle(
            title: 'เฟสบุ๊ก : ',
            textStyle: MyConstant().h2Stylebold(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: ShowTitle(
              title: userModel!.facebook,
              textStyle: MyConstant().h2Style(),
            ),
          ),
        ],
      ),
    );
  }



  Padding buildMap(BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowTitle(title: 'แผนที่ : ', textStyle: MyConstant().h2Stylebold()),
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
    );
  }

  Padding buildPhone() {
    return Padding(
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
    );
  }

  Padding buildAddress(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowTitle(
            title: 'ที่อยู่ :',
            textStyle: MyConstant().h2Stylebold(),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: ShowTitle(
                title: userModel!.address,
                textStyle: MyConstant().h2Style(),
              )),
        ],
      ),
    );
  }

  Padding buildNameANDSeconName() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          ShowTitle(
            title: 'ชื่อ - นามกสุล : ',
            textStyle: MyConstant().h2Stylebold(),
          ),
          ShowTitle(
            title: '${userModel!.name} ${userModel!.seconname}',
            textStyle: MyConstant().h2Style(),
          ),
        ],
      ),
    );
  }

  Padding buildHomePage() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          ShowTitle(
            title: 'ชื่อร้าน : ',
            textStyle: MyConstant().h2Stylebold(),
          ),
          ShowTitle(
            title: '${userModel!.nameseller}',
            textStyle: MyConstant().h2Style(),
          ),
        ],
      ),
    );
  }

  Row buildImage(BoxConstraints constraints) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShowTitle(
          title: 'รูปโปรไฟล์ :',
          textStyle: MyConstant().h2Stylebold(),
        ),
        Container(
          width: constraints.maxWidth * 0.6,
          height: constraints.maxWidth * 0.6,
          child: CachedNetworkImage(
            imageUrl: '${MyConstant.domain}${userModel!.avatar}',
            placeholder: (context, url) => ShowProgress(),
          ),
        ),
      ],
    );
  }
}
