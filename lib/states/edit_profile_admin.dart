import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/states/admin.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileAdmin extends StatefulWidget {
  const EditProfileAdmin({Key? key}) : super(key: key);

  @override
  State<EditProfileAdmin> createState() => _EditProfileAdminState();
}

class _EditProfileAdminState extends State<EditProfileAdmin> {
  UserModel? userModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController userBuyerController = TextEditingController();
  TextEditingController seconnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController lineController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  LatLng? latLng;
  final formKey = GlobalKey<FormState>();
  File? file;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUser();
    findLatLng();
  }

  Future<Null> findLatLng() async {
    Position? position = await findPosition();
    if (position != null) {
      setState(() {
        latLng = LatLng(position.latitude, position.longitude);
        print('lat = ${latLng!.latitude}');
      });
    }
  }

  Future<Position?> findPosition() async {
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition();
    } catch (e) {
      position = null;
    }
    return position;
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String user = preferences.getString('user')!;

    String apiGetUser =
        '${MyConstant.domain}/shopping/getUserWhereUser.php?isAdd=true&user=$user';
    await Dio().get(apiGetUser).then((value) {
      print('### value from APi ===> $value');
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
          userBuyerController.text = userModel!.nameseller;
          nameController.text = userModel!.name;
          seconnameController.text = userModel!.seconname;
          addressController.text = userModel!.address;
          phoneController.text = userModel!.phone;
          facebookController.text = userModel!.facebook;
          lineController.text = userModel!.line;
          instagramController.text = userModel!.instargarm;
          twitterController.text = userModel!.twitter;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        centerTitle: true,
        title: Text('แก้ไขข้อมูล'),
        actions: [
          IconButton(
            onPressed: () => processEditProfileAdmin(),
            icon: Icon(Icons.edit),
            tooltip: 'แก้ไขข้อมูล แอดมิน',
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                buildTitle('รูปผู้ใช้ :'),
                buildAvatar(constraints),
                buildTitle('ข้อมูลแอดมิน :'),
                buildNameSeller(constraints),
                buildName(constraints),
                buildSeconname(constraints),
                buildAddress(constraints),
                buildPhone(constraints),
                buildFacebook(constraints),
                buildLine(constraints),
                buildInStagram(constraints),
                buildTwitter(constraints),
                buildTitle('แผนที่ :'),
                // buildMap(constraints),
                buildButtonEdit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> processEditProfileAdmin() async {
    print('### ==>> processEditProfileAdmin Work');

    MyDialog().showProgressDialog(context);

    if (formKey.currentState!.validate()) {
      if (file == null) {
        print('## User Current Avatar');
        editValueToMySQL(userModel!.avatar);
      } else {
        String apiSaveAvatar = '${MyConstant.domain}/shopping/saveAvatar.php';

        List<String> nameAvatars = userModel!.avatar.split('/');
        String nameFile = nameAvatars[nameAvatars.length - 1];
        nameFile = 'edit${Random().nextInt(100)}$nameFile';

        print('## User New Avatar nameFile ==>> $nameFile');

        Map<String, dynamic> map = {};
        map['file'] =
            await MultipartFile.fromFile(file!.path, filename: nameFile);
        FormData formData = FormData.fromMap(map);
        await Dio().post(apiSaveAvatar, data: formData).then((value) {
          print('## Upload Success');
          String pathAvatar = '/shopping/avatar/$nameFile';
          editValueToMySQL(pathAvatar);
        });
      }
    }
  }

  Future<Null> editValueToMySQL(String pathAvatar) async {
    print('## pathAvatar ==>> $pathAvatar');
    String apiEditProfile =
        '${MyConstant.domain}/shopping/editProfileAdminWhereId.php?isAdd=true&id=${userModel!.id}&avatar=$pathAvatar&name=${nameController.text}&seconname=${seconnameController.text}&address=${addressController.text}&phone=${phoneController.text}&facebook=${facebookController.text}&line=${lineController.text}&instargarm=${instagramController.text}&twitter=${twitterController.text}&lat=${latLng!.latitude}&lng=${latLng!.longitude}';
    await Dio().get(apiEditProfile).then(
      (value) {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminServer(),
            ));
      },
    );
  }

  ElevatedButton buildButtonEdit() {
    return ElevatedButton.icon(
      onPressed: () => processEditProfileAdmin(),
      icon: Icon(Icons.edit),
      label: Text('แก้ไขข้อมูล'),
    );
  }

  // Row buildMap(BoxConstraints constraints) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(color: MyConstant.primary),
  //         ),
  //         margin: EdgeInsets.symmetric(vertical: 16),
  //         width: constraints.maxWidth * 0.6,
  //         height: constraints.maxWidth * 0.5,
  //         child: latLng == null
  //             ? ShowProgress()
  //             : GoogleMap(
  //                 initialCameraPosition: CameraPosition(
  //                   target: latLng!,
  //                   zoom: 16,
  //                 ),
  //                 onMapCreated: (controller) {},
  //                 markers: <Marker>[
  //                   Marker(
  //                     markerId: MarkerId('id'),
  //                     position: latLng!,
  //                     infoWindow: InfoWindow(
  //                       title: userModel!.address,
  //                       snippet:
  //                           'lat = ${latLng!.latitude}, lng = ${latLng!.longitude}',
  //                     ),
  //                   ),
  //                 ].toSet(),
  //               ),
  //       ),
  //     ],
  //   );
  // }

  Future<Null> createAvatar({ImageSource? source}) async {
    try {
      var result = await ImagePicker().getImage(
        source: source!,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Row buildAvatar(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              iconSize: 45,
              onPressed: () => createAvatar(source: ImageSource.camera),
              icon: Icon(
                Icons.add_a_photo,
                color: MyConstant.dark,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: MyConstant.primary),
              ),
              height: constraints.maxWidth * 0.6,
              width: constraints.maxWidth * 0.6,
              child: userModel == null
                  ? ShowProgress()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: userModel!.avatar == null
                          ? ShowImage(path: MyConstant.avatar)
                          : file == null
                              ? buildShowImageNetwork()
                              : Image.file(file!),
                    ),
            ),
            IconButton(
              iconSize: 45,
              onPressed: () => createAvatar(source: ImageSource.gallery),
              icon: Icon(
                Icons.add_photo_alternate,
                color: MyConstant.dark,
              ),
            ),
          ],
        ),
      ],
    );
  }

  CachedNetworkImage buildShowImageNetwork() {
    return CachedNetworkImage(
      imageUrl: '${MyConstant.domain}${userModel!.avatar}',
      placeholder: (context, url) => ShowProgress(),
    );
  }

  Row buildNameSeller(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: constraints.maxWidth * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก ชื่อบัญชี';
              } else {
                return null;
              }
            },
            controller: userBuyerController,
            decoration: InputDecoration(
              labelText: 'ชื่อบัญชี :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildName(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: constraints.maxWidth * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก ชื่อ';
              } else {
                return null;
              }
            },
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'ชื่อ :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildSeconname(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: constraints.maxWidth * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก นามสกุล';
              } else {
                return null;
              }
            },
            controller: seconnameController,
            decoration: InputDecoration(
              labelText: 'นามสกุล :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildAddress(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: constraints.maxWidth * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก ที่อยู่';
              } else {
                return null;
              }
            },
            maxLines: 5,
            controller: addressController,
            decoration: InputDecoration(
              labelText: 'ที่อยู่ :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPhone(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: constraints.maxWidth * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก เบอร์โทรศัพท์';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.phone,
            controller: phoneController,
            decoration: InputDecoration(
              labelText: 'เบอร์โทรศัพท์ :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildFacebook(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: constraints.maxWidth * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก เฟสบุ๊ก';
              } else {
                return null;
              }
            },
            controller: facebookController,
            decoration: InputDecoration(
              labelText: 'เฟสบุ๊ก :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildLine(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: constraints.maxWidth * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก ไลน์ไอดี';
              } else {
                return null;
              }
            },
            controller: lineController,
            decoration: InputDecoration(
              labelText: 'ไลน์ไอดี :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildInStagram(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: constraints.maxWidth * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก อินสตราแกรม';
              } else {
                return null;
              }
            },
            controller: instagramController,
            decoration: InputDecoration(
              labelText: 'อินสตราแกรม :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildTwitter(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: constraints.maxWidth * 0.6,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก ทิตเตอร์';
              } else {
                return null;
              }
            },
            controller: twitterController,
            decoration: InputDecoration(
              labelText: 'ทวิตเตอร์ :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  ShowTitle buildTitle(String title) {
    return ShowTitle(
      title: title,
      textStyle: MyConstant().h2Style(),
    );
  }
}
