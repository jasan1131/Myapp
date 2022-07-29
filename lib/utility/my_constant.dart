import 'package:flutter/material.dart';

class MyConstant {
  // Genernal
  static String appName = 'Shopping MAll';
  static String domain =
      'https://ef00-2001-fb1-1d-28ed-dcda-dc36-eac5-d34c.ap.ngrok.io';

  static String urlPromptpay = 'https://promptpay.io/0970272217.png';

  // Route
  static String routeAdminSever = '/admin';
  static String routeAuthen = '/authen';
  static String routeCreasteAccount = '/createAccount';
  static String routeBuyerService = '/buyerService';
  static String routeRiderService = '/riderService';
  static String rounteAddProduct = '/addProduct';
  static String rounteAddProductSpecial = '/addProductSpecial';
  static String rounteAddProductWholeSale = '/addProductWholeSale';

  static String rounteEditProfileAdmin = '/editProfileAdmin';

  static String rounteShowCart = '/showcart';
  static String rounteAddWallet = '/addwallet';
  static String rounteConfirmAddWallet = '/confirmaddwallet';
  static String rounteMyMoney = '/mymoney';
  static String rounteConfirmOrder = '/confirmorder';
  static String rountePDPA = '/pdpa';
  // Image
  static String image1 = 'images/image1.png';
  static String image2 = 'images/image2.png';
  static String image3 = 'images/image3.png';
  static String image4 = 'images/image4.png';
  static String imageeror = 'images/eror.png';
  static String avatar = 'images/avatar.png';
  static String product = 'images/product.png';
  static String logofood = 'images/logofood.png';
  static String bill = 'images/bill.png';
  // color
  static Color primary = Color(0xff64b5f6);
  static Color dark = Color(0xff2286c3);
  static Color light = Color(0xff9be7ff);
  static Map<int, Color> mapMaterialColor = {
    50: Color.fromRGBO(255, 34, 134, 0.1),
    100: Color.fromRGBO(255, 34, 134, 0.2),
    200: Color.fromRGBO(255, 34, 134, 0.3),
    300: Color.fromRGBO(255, 34, 134, 0.4),
    400: Color.fromRGBO(255, 34, 134, 0.5),
    500: Color.fromRGBO(255, 34, 134, 0.6),
    600: Color.fromRGBO(255, 34, 134, 0.7),
    700: Color.fromRGBO(255, 34, 134, 0.8),
    800: Color.fromRGBO(255, 34, 134, 0.9),
    900: Color.fromRGBO(255, 34, 134, 1.0),
  };

  // background
  BoxDecoration planBackground() =>
      BoxDecoration(color: MyConstant.light.withOpacity(0.75));

  BoxDecoration gradientLinearBackground() => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topRight,
          colors: [Colors.white, MyConstant.light, MyConstant.primary],
        ),
      );

  BoxDecoration gradientRadioBackground() => BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.2),
          radius: 0.8,
          colors: [Colors.blue.shade100, MyConstant.dark],
        ),
      );

  // Style
  TextStyle h1Style() => TextStyle(
        fontSize: 24,
        color: dark,
        fontWeight: FontWeight.bold,
      );
  TextStyle h1WhiteStyle() => TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w800,
      );
      TextStyle h1BackStyle() => TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w800,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.w700,
      );
  TextStyle h2WhiteStyle() => TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );
  TextStyle h2RedStyle() => TextStyle(
        fontSize: 18,
        color: Colors.red.shade800,
        fontWeight: FontWeight.w700,
      );
  TextStyle h2BlueStyle() => TextStyle(
        fontSize: 18,
        color: Colors.blue.shade800,
        fontWeight: FontWeight.w700,
      );
  TextStyle h2BackStyle() => TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );
  TextStyle h3WhiteStyle() => TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      );
  TextStyle h3BlackStyle() => TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      );

  TextStyle h4Style() => TextStyle(
        fontSize: 12,
        color: dark,
        fontWeight: FontWeight.normal,
      );

  // Button
  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: MyConstant.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );

  SizedBox mySizeBox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  String keyId = 'id';
  String keyType = 'type';
  String keyUser = 'user';
  String keyName = 'name';
}
