import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/bodys/buyer_product_type.dart';
import 'package:flutter_myappication_1/bodys/buyer_show_about_seller.dart';
import 'package:flutter_myappication_1/bodys/buyer_show_all_product.dart';
import 'package:flutter_myappication_1/bodys/buyer_special_product.dart';
import 'package:flutter_myappication_1/bodys/buyer_wholesale_product.dart';
import 'package:flutter_myappication_1/bodys/show_menu_food.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';

class BuyerShowShopSeller extends StatefulWidget {
  final UserModel userModel;
  const BuyerShowShopSeller({Key? key, required this.userModel})
      : super(key: key);

  @override
  State<BuyerShowShopSeller> createState() => _BuyerShowShopSellerState();
}

class _BuyerShowShopSellerState extends State<BuyerShowShopSeller> {
  UserModel? userModel;
  List<Widget> listWidgets = [];
  int indexPage = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
    listWidgets.add(BuyerShowAllProduct(userModel: userModel!));
    listWidgets.add(BuyerProductType(userModel: userModel!));
    listWidgets.add(BuyerSpecialProduct(userModel: userModel!));
    listWidgets.add(BuyerWholeSaleProduct(userModel: userModel!));
    listWidgets.add(ShowMenuFood(userModel: userModel!));
  }

  BottomNavigationBarItem showProduct() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.shop_outlined),
      label: 'สินค้า',
    );
  }

  BottomNavigationBarItem showTypeProduct() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.account_tree_outlined),
      label: 'ประเภทสินค้า',
    );
  }

  BottomNavigationBarItem showSpecialProduct() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.sell_outlined),
      label: 'ราคาพิเศษ',
    );
  }

  BottomNavigationBarItem showWholeSaleProduct() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.workspace_premium_outlined),
      label: 'ราคาส่ง',
    );
  }

  BottomNavigationBarItem showMenuFood() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.restaurant_outlined),
      label: 'เมนูอาหาร',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        centerTitle: true,
        title: Text(userModel!.name),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ShowAboutSeller(userModel: userModel!),
                    ),
                  ),
              icon: Icon(Icons.info_outline)),
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, MyConstant.rounteShowCart),
            icon: Icon(Icons.shopping_cart_outlined)
          ),
        ],
      ),
      body: listWidgets.length == 0 ? ShowProgress() : listWidgets[indexPage],
      bottomNavigationBar: showBottomNavigationBar(),
    );
  }

  Widget showBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyConstant.primary,
      unselectedFontSize: 12,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.black,
      currentIndex: indexPage,
      onTap: (value) {
        setState(() {
          indexPage = value;
        });
      },
      items: <BottomNavigationBarItem>[
        showProduct(),
        showTypeProduct(),
        showSpecialProduct(),
        showWholeSaleProduct(),
        showMenuFood(),
      ],
    );
  }
}
