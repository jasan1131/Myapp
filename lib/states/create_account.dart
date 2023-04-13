import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String type = 'buyer';
  String avatar = '';
  File? file;
  double? lat, lng;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController seconnameController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController lineController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  Future<Null> checkPermission() async {
    bool locationService;
    LocationPermission locationPermission;

    locationService = await Geolocator.isLocationServiceEnabled();
    if (locationService) {
      print('Service Locotion Open');

      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
              context, 'ไม่อนุญาติแชร์ ตำแหน่ง', 'อนุญาติแชร์ ตำแหน่ง');
        } else {
          // Find LatLag
          findLatLng();
        }
      } else {
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
              context, 'ไม่อนุญาติแชร์ ตำแหน่ง', 'อนุญาติแชร์ ตำแหน่ง');
        } else {
          // Find LatLng
          findLatLng();
        }
      }
    } else {
      print('Service Location Closs');
      MyDialog().alertLocationService(
          context,
          'ตำแหน่งปัจจุบันของคุณ ปิดอยู่ ?',
          'กรุณาเปิด ตำแหน่งปัจจุบันของคุณ ด้วย');
    }
  }

  Future<Null> findLatLng() async {
    print('findLatLng ==> Work');
    Position? position = await findPosition();
    setState(() {
      lat = position!.latitude;
      lng = position.longitude;
      print('lat =$lat, lng = $lng');
    });
  }

  Future<Position?> findPosition() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      return null;
    }
  }

  // Build UserID
  Row buildUserID(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.75,
          child: TextFormField(
            controller: userController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก ชื่อบัญชี ด้วย';
              } else {}
            },
            decoration: InputDecoration(
              hintText: 'ชื่อบัญชี :',
              hintStyle: MyConstant().h3Style(),
              prefixIcon: Icon(
                Icons.mail,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyConstant.dark,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // build Name
  Row buildUserName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.75,
          child: TextFormField(
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก ชื่อ ด้วย';
              } else {}
            },
            decoration: InputDecoration(
              hintText: 'ชื่อ :',
              hintStyle: MyConstant().h3Style(),
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyConstant.dark,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Build Secon Name
  Row buildSeconName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.75,
          child: TextFormField(
            controller: seconnameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก นามสกุล ด้วย';
              } else {}
            },
            decoration: InputDecoration(
              hintText: 'นามสกุล :',
              hintStyle: MyConstant().h3Style(),
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyConstant.dark,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Build PassWord
  Row buildPassWord(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.75,
          child: TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก รหัสผ่าน ด้วย';
              } else {}
            },
            decoration: InputDecoration(
              hintText: 'รหัสผ่าน :',
              hintStyle: MyConstant().h3Style(),
              prefixIcon: Icon(
                Icons.lock,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyConstant.dark,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // build Address
  Row buildAddress(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.75,
          child: TextFormField(
            controller: addressController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก ที่อยู่ ด้วย';
              } else {}
            },
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'ที่อยู่ :',
              hintStyle: MyConstant().h3Style(),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
                child: Icon(
                  Icons.home,
                  color: MyConstant.dark,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyConstant.dark,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // build Phone
  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.75,
          child: TextFormField(
            controller: phoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก เบอร์โทรศัพท์ ด้วย';
              } else {}
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'เบอร์โทร์ศัพท์ :',
              hintStyle: MyConstant().h3Style(),
              prefixIcon: Icon(
                Icons.phone,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyConstant.dark,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildFacebook(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.75,
          child: TextFormField(
            controller: facebookController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก เฟสบุ๊ก ด้วย';
              } else {}
            },
            decoration: InputDecoration(
              hintText: 'facebook :',
              hintStyle: MyConstant().h3Style(),
              prefixIcon: Icon(
                Icons.facebook_outlined,
                color: MyConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyConstant.dark,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildLine(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          width: size * 0.75,
          child: TextFormField(
            controller: lineController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก ไลน์ ด้วย';
              } else {}
            },
            decoration: InputDecoration(
              hintText: 'line ID :',
              hintStyle: MyConstant().h3Style(),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: ImageIcon(
                  AssetImage(
                    MyConstant.line,
                  ),
                  color: MyConstant.dark,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyConstant.dark,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        centerTitle: true,
        actions: [
          buildCreateNewAccount(),
        ],
        title: Text('สมัครสมาชิก'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTitle('รูปภาพ'),
                buildSubTitle(),
                buildAvatarIcon(size),
                buildTitle('ข้อมูลพื้นของผู้ใช้ :'),
                buildUserName(size),
                buildSeconName(size),
                buildUserID(size),
                buildPassWord(size),
                buildAddress(size),
                buildPhone(size),
                buildFacebook(size),
                buildLine(size),
                buildTitle('แสดงพิกัดที่คุณอยู่'),
                buildMap(),
                builCreate(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container builCreate(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      width: MediaQuery.of(context).size.width * 0.75,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            uploadPictureAndInsertData();
          }
        },
        child: Text('สมัครสมาชิก'),
      ),
    );
  }

  IconButton buildCreateNewAccount() {
    return IconButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          uploadPictureAndInsertData();
        }
      },
      icon: Icon(
        Icons.cloud_upload,
      ),
    );
  }

  Future<Null> uploadPictureAndInsertData() async {
    String name = nameController.text;
    String seconname = seconnameController.text;
    String user = userController.text;
    String password = passwordController.text;
    String address = addressController.text;
    String phone = phoneController.text;
    String facebook = facebookController.text;
    String line = lineController.text;
    print(
        '## name = $name, seconname = $seconname, user = $user, password = $password, address = $address, phone = $phone');
    String path =
        '${MyConstant.domain}/shopping/getUserWhereUser.php?isAdd=true&user=$user';
    await Dio().get(path).then(
      (value) async {
        print('## value ==>> $value');
        if (value.toString() == 'null') {
          print('## user OK');

          if (file == null) {
            // NO Avatar
            processInsertMySQL(
              name: name,
              seconname: seconname,
              user: user,
              password: password,
              address: address,
              phone: phone,
              facebook: facebook,
              line: line
            );
          } else {
            // have Avatar
            print('### process Upload Avatar');
            String apiSaveAvtar =
                '${MyConstant.domain}/shopping/saveAvatar.php';
            int i = Random().nextInt(100000);
            String nameAvatar = 'avatar$i.jpg';
            Map<String, dynamic> map = Map();
            map['file'] =
                await MultipartFile.fromFile(file!.path, filename: nameAvatar);
            FormData data = FormData.fromMap(map);
            await Dio().post(apiSaveAvtar, data: data).then(
              (value) {
                avatar = '/shopping/avatar/$nameAvatar';
                processInsertMySQL(
                  name: name,
                  seconname: seconname,
                  user: user,
                  password: password,
                  address: address,
                  phone: phone,
                  facebook: facebook,
                  line: line
                );
              },
            );
          }
        } else {
          MyDialog().normalDialog(context, 'ชื่อผู้ใช้ ไม่ถูกต้อง ?',
              'กรุณาเปลี่ยน ชื่อผู้ใช้ใหม่');
        }
      },
    );
  }

  Future<Null> processInsertMySQL(
      {String? name,
      String? seconname,
      String? user,
      String? password,
      String? address,
      String? phone,
      String? facebook,
      String? line}) async {
    print('## ProcessInsertMySQL Work and avatar ==> $avatar');
    String apiInsertUser =
        '${MyConstant.domain}/shopping/insertUser.php?isAdd=true&avatar=$avatar&type=$type&name=$name&seconname=$seconname&user=$user&password=$password&address=$address&phone=$phone&facebook=$facebook&line=$line&lat=$lat&lng=$lng';
    await Dio().get(apiInsertUser).then((value) {
      if (value.toString() == 'true') {
        MyDialog().normalDialogOk(
          context,
          'สมัครสมาชิกเสร็จสิ้น',
          '',
        );
      } else {
        MyDialog().normalDialog(
            context, 'การสมัครสมาชิกล้มเหลว !!! ', 'กรุณาลองใหม่อีครั้ง');
      }
    });
  }

  Set<Marker> setMarker() => <Marker>[
        Marker(
          markerId: MarkerId('id'),
          position: LatLng(lat!, lng!),
          infoWindow: InfoWindow(
              title: 'คุณอยู่ที่นี้', snippet: 'Lat = $lat, Lng = $lng'),
        ),
      ].toSet();

  Widget buildMap() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: 300,
      child: lat == null
          ? ShowProgress()
          : GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(lat!, lng!),
                zoom: 15,
              ),
              onMapCreated: (controller) {},
              markers: setMarker(),
            ),
    );
  }

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(
        () {
          file = File(result!.path);
        },
      );
    } catch (e) {}
  }

  Widget buildAvatarIcon(double size) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.5,
          child: file == null
              ? ShowImage(
                  path: MyConstant.avatar,
                )
              : Image.file(file!),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => chooseImage(ImageSource.camera),
              icon: Icon(
                Icons.add_a_photo_outlined,
                size: 56,
                color: MyConstant.light,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: IconButton(
                onPressed: () => chooseImage(ImageSource.gallery),
                icon: Icon(
                  Icons.add_photo_alternate,
                  size: 56,
                  color: MyConstant.light,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  ShowTitle buildSubTitle() {
    return ShowTitle(
      title:
          'เป็นรูปภาพ ที่แสดงตัวตนของผู้ใช้ (แต่ถ้าไม่สะดวกแชร์ เราจะแสดงภาพเป็น ค่าเริ่มต้น แทน)',
      textStyle: MyConstant().h3Style(),
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: MyConstant().h2Style(),
      ),
    );
  }
}
