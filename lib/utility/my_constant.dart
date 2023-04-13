import 'package:flutter/material.dart';

class MyConstant {
  // Genernal
  static String appName = 'Shopping MAll';
  static String domain =
      'https://ad2c-202-133-187-8.ngrok-free.app';
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

  //menuFood
  static String food1 = 'images/food1.png';
  static String food2 = 'images/food2.jpg';
  static String food3 = 'images/food3.jpg';
  static String food4 = 'images/food4.jpg';
  static String food5 = 'images/food5.jpg';
  static String food6 = 'images/food6.jpg';
  static String food7 = 'images/food7.jpg';
  static String food8 = 'images/food8.jpg';
  static String food9 = 'images/food9.png';
  static String food10 = 'images/food10.jpg';
  static String food11 = 'images/food11.jpg';
  static String food12 = 'images/food12.jpg';
  static String food13 = 'images/food13.jpg';
  static String food14 = 'images/food14.png';
  static String food15 = 'images/food15.jpg';
  static String food16 = 'images/food16.jpg';
  static String food17 = 'images/food17.jpg';
  static String food18 = 'images/food18.jpg';
  static String food19 = 'images/food19.jpg';
  static String food20 = 'images/food20.png';

  static String ok = 'images/ok.png';
  static String line = 'images/line.png';
  static String instagram = 'images/instagram.png';
  static String twitter = 'images/twitter.png';

  //type
  static String fruit = 'images/fruit.jpg';
  static String vegetable = 'images/vegetable.jpg';
  static String meet = 'images/meet.jpg';
  static String driedfood = 'images/driedfood.jpg';
  static String condiment = 'images/condiment.jpg';

  //type meet
  static String pook = 'images/pook.jpg';
  static String beef = 'images/beef.jpg';
  static String chicken = 'images/chicken.jpg';
  static String seafood = 'images/seafood.jpg';

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

  //Text h1Style
  TextStyle h1Stylebold() => TextStyle(
        fontSize: 24,
        color: dark,
        fontWeight: FontWeight.bold,
      );
  TextStyle h1Style() => TextStyle(
        fontSize: 24,
        color: dark,
        fontWeight: FontWeight.normal,
      );
  TextStyle h1WhiteStyle() => TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      );
  TextStyle h1BackStyle() => TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      );

  //Text h2Style
  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.normal,
      );
  TextStyle h2Stylebold() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2WhiteStyle() => TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      );
  TextStyle h2RedStyle() => TextStyle(
        fontSize: 18,
        color: Colors.red.shade800,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2BlueStyle() => TextStyle(
        fontSize: 18,
        color: Colors.blue.shade800,
        fontWeight: FontWeight.normal,
      );
  TextStyle h2BackStyle() => TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      );

  //Text h3Style
  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );
  TextStyle h3Stylebold() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.bold,
      );
  TextStyle h3WhiteStyle() => TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      );
  TextStyle h3BlackStyleBold() => TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.bold,
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
        primary: Colors.white.withOpacity(0.75),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );

  ButtonStyle myButtonStyleAdd() => ElevatedButton.styleFrom(
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
  String keySecondName = 'secondname';
  String keyAddress = 'address';
  String keyPhone = 'phone';
  String keyFacebook = 'facebook';
  String keyLine = 'line';
}
