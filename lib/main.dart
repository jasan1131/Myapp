import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/bodys/my_money.dart';
import 'package:flutter_myappication_1/states/add_product.dart';
import 'package:flutter_myappication_1/states/add_wallet.dart';
import 'package:flutter_myappication_1/states/admin.dart';
import 'package:flutter_myappication_1/states/authen.dart';
import 'package:flutter_myappication_1/states/buyer_sevice.dart';
import 'package:flutter_myappication_1/states/confirm_add_wallet.dart';
import 'package:flutter_myappication_1/states/confirm_order.dart';
import 'package:flutter_myappication_1/states/create_account.dart';
import 'package:flutter_myappication_1/states/edit_profile_admin.dart';
import 'package:flutter_myappication_1/states/pdpa.dart';
import 'package:flutter_myappication_1/states/rider_service.dart';
import 'package:flutter_myappication_1/states/show_cart.dart';
import 'package:flutter_myappication_1/type/type_condiment.dart';
import 'package:flutter_myappication_1/type/type_dry_good.dart';
import 'package:flutter_myappication_1/type/type_vegetable.dart';
import 'package:flutter_myappication_1/type/type_meet.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Map<String, WidgetBuilder> map = {
  '/admin': (BuildContext context) => AdminServer(),
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/buyerService': (BuildContext context) => BuyerService(),
  '/riderService': (BuildContext context) => RiderService(),
  '/addProduct': (BuildContext context) => AddProduct(),
  '/editProfileAdmin': (BuildContext context) => EditProfileAdmin(),
  '/typemeet' : (BuildContext context) => TypeMeet(),
  '/typevegetables' :(BuildContext context) => TypeVegatables(),
  '/typedrygoods' : (BuildContext context) => TypeDryGoods(),
  '/typecondiments' : (BuildContext context) => TypeCondiments(),




  '/confirmorder' :(BuildContext context) => ConfirmOrder(),
  '/showcart' :(BuildContext context) => ShowCart(),
  '/addwallet' :(BuildContext context) => AddWallet(),
  '/confirmaddwallet' :(BuildContext context) => ConfirmAddWallet(),
  '/mymoney' :(BuildContext context) => MYMoney(),
  '/pdpa' :(BuildContext context) => PDPA(),
};

String? initlalRoute;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? type = preferences.getString('type');
  print('## type ===>> $type');
  if (type?.isEmpty ?? true) {
    initlalRoute = MyConstant.routeAuthen;
    runApp(MyApp());
  } else {
    switch (type) {
      case 'admin':
        initlalRoute = MyConstant.routeAdminSever;
        runApp(MyApp());
        break;
      case 'buyer':
        initlalRoute = MyConstant.routeBuyerService;
        runApp(MyApp());
        break;
      case 'rider':
        initlalRoute = MyConstant.routeRiderService;
        runApp(MyApp());
        break;
      default:
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialColor materialColor =
        MaterialColor(0xff2286c3, MyConstant.mapMaterialColor);
    return MaterialApp(
      title: MyConstant.appName,
      routes: map,
      initialRoute: initlalRoute,
      theme: ThemeData(primarySwatch: materialColor),
    );
  }
}
