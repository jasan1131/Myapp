import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/bodys/buyer_product_type.dart';
import 'package:flutter_myappication_1/bodys/buyer_show_about_seller.dart';
import 'package:flutter_myappication_1/bodys/buyer_showall_product.dart';
import 'package:flutter_myappication_1/bodys/buyer_special_product.dart';
import 'package:flutter_myappication_1/bodys/buyer_wholesale_product.dart';
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
    listWidgets.add(ShowAboutSeller(userModel: userModel!));
    listWidgets.add(BuyerShowAllProduct(userModel: userModel!));
    listWidgets.add(BuyerProductType(userModel: userModel!,));
    listWidgets.add(BuyerSpecialProduct(userModel: userModel!));
    listWidgets.add(BuyerWholeSaleProduct(userModel: userModel!,));
  }

  BottomNavigationBarItem showAboutSeller() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.info_outline),
      label: 'เกี่ยวกับร้าน',
    );
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
      label: 'สินค้าราคาพิเศษ',
    );
  }

  BottomNavigationBarItem showWholeSaleProduct() {
    return BottomNavigationBarItem(
      backgroundColor: MyConstant.dark,
      icon: Icon(Icons.workspace_premium_outlined),
      label: 'สินค้าราคาส่ง',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(userModel!.name),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, MyConstant.rounteShowCart),
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: listWidgets.length == 0 ? ShowProgress() : listWidgets[indexPage],
      bottomNavigationBar: showBottomNAvigationBar(),
    );
  }

  BottomNavigationBar showBottomNAvigationBar() {
    return BottomNavigationBar(
      unselectedFontSize: 12,
      // showUnselectedLabels: false,
      unselectedItemColor: Colors.white70,
      selectedItemColor: Colors.black,
      backgroundColor: MyConstant.dark,
      currentIndex: indexPage,
      onTap: (value) {
        setState(() {
          indexPage = value;
        });
      },
      items: <BottomNavigationBarItem>[
        showAboutSeller(),
        showProduct(),
        showTypeProduct(),
        showSpecialProduct(),
        showWholeSaleProduct(),
      ],
    );
  }
}
