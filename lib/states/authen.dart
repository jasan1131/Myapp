import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/utility/my_dialog.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: Container(
              decoration: MyConstant().gradientRadioBackground(),
              child: ListView(
                children: [
                  buildImage(size),
                  // buildAppName(),
                  buildUser(size),
                  buildPassword(size),
                  buildLogin(size),
                  buildCreateAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'มีบัญชีหรือยัง ? ถ้ายังไม่มี กด',
          textStyle: MyConstant().h3BlackStyle(),
        ),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, MyConstant.rountePDPA),
          child: Text(
            'สมัครสมาชิก',
            style: TextStyle(decoration: TextDecoration.underline, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: size * 0.4,
          child: ElevatedButton(
            style: MyConstant().myButtonStyle(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                String user = userController.text;
                String password = passwordController.text;
                print('## user = $user, password = $password');
                checkAuthen(user: user, password: password);
              }
            },
            child: Text('เข้าสู่ระบบ'),
          ),
        ),
      ],
    );
  }

  Future<Null> checkAuthen({String? user, String? password}) async {
    String apiCheckAuthen =
        '${MyConstant.domain}/shopping/getUserWhereUser.php?isAdd=true&user=$user';
    await Dio().get(apiCheckAuthen).then((value) async {
      print('## value for Api ==>> $value');
      if (value.toString() == 'null') {
        MyDialog().normalDialog(context, 'ชื่อผู้ใช้ไม่ถูกต้อง !!!',
            'ไม่มีชื่อ $user นี้อยู่ในระบบ');
      } else {
        for (var item in json.decode(value.data)) {
          UserModel model = UserModel.fromMap(item);
          if (password == model.password) {
            // Success Auten
            String type = model.type;

            print('## Auten Success in type ==> $type');

            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setString(MyConstant().keyId, model.id);
            preferences.setString(MyConstant().keyType, type);
            preferences.setString(MyConstant().keyUser, model.user);
            preferences.setString(MyConstant().keyName, model.name);
            switch (type) {
              case 'buyer':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routeBuyerService, (route) => false);
                break;
              case 'rider':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routeRiderService, (route) => false);
                break;
              case 'admin':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routeAdminSever, (route) => false);
                break;
              default:
            }
          } else {
            // Auten False
            MyDialog().normalDialog(context, 'รหัสผ่านไม่ถูกต้อง !!!',
                'กรุณากรอกรหัสผ่านใหม่อีกครั้ง');
          }
        }
      }
    });
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // margin: EdgeInsets.only(top: 0),
          width: size * 0.75,
          child: TextFormField(
            controller: userController,
            validator: ((value) {
              if (value!.isEmpty) {
                return 'กรุณากรอกชื่อผู้ใช้';
              } else {
                return null;
              }
            }),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.75),
              hintText: 'ชื่อผู้ใช้ :',
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

  Row buildPassword(double size) {
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
                return 'กรุรากรอกรหัสผ่าน';
              } else {
                return null;
              }
            },
            obscureText: statusRedEye,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.75),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(
                    () {
                      statusRedEye = !statusRedEye;
                    },
                  );
                },
                icon: statusRedEye
                    ? Icon(
                        Icons.remove_red_eye,
                        color: MyConstant.dark,
                      )
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: MyConstant.dark,
                      ),
              ),
              hintText: 'รหัสผ่าน :',
              hintStyle: MyConstant().h3Style(),
              prefixIcon: Icon(
                Icons.lock_outlined,
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

  // Row buildAppName() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       ShowTitle(
  //         title: MyConstant.appName,
  //         textStyle: MyConstant().h1Style(),
  //       ),
  //     ],
  //   );
  // }

  Row buildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.9,
          child: ShowImage(path: MyConstant.image1),
        ),
      ],
    );
  }
}
