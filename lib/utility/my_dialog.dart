import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/states/admin.dart';
import 'package:flutter_myappication_1/states/authen.dart';
import 'package:flutter_myappication_1/states/buyer_sevice.dart';
import 'package:flutter_myappication_1/states/rider_service.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';
import 'package:geolocator/geolocator.dart';

class MyDialog {
  final Function()? funcAction;

  MyDialog({this.funcAction});

  Future<Null> showProgressDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => WillPopScope(
        child: Center(
          child: CircularProgressIndicator(
            color: MyConstant.dark,
          ),
        ),
        onWillPop: () async {
          return false;
        },
      ),
    );
  }

  Future<Null> alertLocationService(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.image4),
          title: ShowTitle(
            title: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(
            title: message,
            textStyle: MyConstant().h3Style(),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              // Navigator.pop(context);
              await Geolocator.openLocationSettings();
              exit(0);
            },
            child: ShowTitle(
              title: 'ปิด',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> normalDialogCoppy1(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Column(
          children: [
            Image.asset(
              MyConstant.ok,
              height: 150,
            ),
            Container(width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                children: [
                  ShowTitle(title: title),
                  ShowTitle(title: message),
                ],
              ),
            )
          ],
        ),
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: ShowTitle(
              title: 'ปิด',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> normalDialogCoppy(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Column(
          children: [
            Image.asset(
              MyConstant.ok,
              height: 150,
            ),
            ShowTitle(title: title)
          ],
        ),
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: ShowTitle(
              title: 'ปิด',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> normalDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: ShowImage(
            path: MyConstant.imageeror,
          ),
          title: ShowTitle(
            title: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(
            title: message,
            textStyle: MyConstant().h3Style(),
          ),
        ),
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: ShowTitle(
              title: 'ปิด',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> normalDialogOk(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Column(
          children: [
            Image.asset(
              MyConstant.ok,
              height: 150,
            ),
            ListTile(
              title: ShowTitle(
                title: title,
                textStyle: MyConstant().h2Style(),
              ),
              subtitle: ShowTitle(
                title: message,
                textStyle: MyConstant().h3Style(),
              ),
            ),
          ],
        ),
        children: [
          TextButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Authen(),
                ),
                (route) => false),
            child: ShowTitle(
              title: 'ปิด',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> normalDialogOrderOk(BuildContext context, String title) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Column(
          children: [
            Image.asset(
              MyConstant.ok,
              height: 150,
            ),
            ShowTitle(title: title)
          ],
        ),
        children: [
          TextButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminServer(),
                ),
                (route) => false),
            child: ShowTitle(
              title: 'ปิด',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> normalDialogConfirmOrderOk(
      BuildContext context, String title) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Column(
          children: [
            Image.asset(
              MyConstant.ok,
              height: 150,
            ),
            ShowTitle(title: title)
          ],
        ),
        children: [
          TextButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => RiderService(),
                ),
                (route) => false),
            child: ShowTitle(
              title: 'ปิด',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> normalDialog1(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          title: ShowTitle(
            title: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(
            title: message,
            textStyle: MyConstant().h3Style(),
          ),
        ),
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: ShowTitle(
              title: 'ปิด',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> normalDialogNavigator(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Column(
          children: [
            Image.asset(
              MyConstant.ok,
              height: 150,
            ),
            ListTile(
              title: ShowTitle(
                title: title,
                textStyle: MyConstant().h2Style(),
              ),
              subtitle: ShowTitle(
                title: message,
                textStyle: MyConstant().h3Style(),
              ),
            ),
          ],
        ),
        children: [
          TextButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => BuyerService(),
                ),
                (route) => false),
            child: ShowTitle(
              title: 'ปิด',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> normalDialogNavigatorAdmin(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          title: ShowTitle(
            title: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(
            title: message,
            textStyle: MyConstant().h3Style(),
          ),
        ),
        children: [
          TextButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminServer(),
                ),
                (route) => false),
            child: ShowTitle(
              title: 'ปิด',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> actionDialog(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Column(
          children: [
            Image.asset(
              MyConstant.ok,
              height: 150,
            ),
            ListTile(
              title: ShowTitle(
                title: title,
                textStyle: MyConstant().h2Style(),
              ),
              subtitle: ShowTitle(
                title: message,
                textStyle: MyConstant().h3Style(),
              ),
            ),
          ],
        ),
        children: [
          TextButton(
            onPressed: funcAction,
            child: ShowTitle(
              title: 'ปิด',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ],
      ),
    );
  }
}
