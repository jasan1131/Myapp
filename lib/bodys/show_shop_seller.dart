import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/models/user_models.dart';
import 'package:flutter_myappication_1/states/buyer_show_shop_seller.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_image.dart';
import 'package:flutter_myappication_1/widgets/show_progress.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class ShowShopSeller extends StatefulWidget {
  const ShowShopSeller({Key? key}) : super(key: key);

  @override
  State<ShowShopSeller> createState() => _ShowShopSellerState();
}

class _ShowShopSellerState extends State<ShowShopSeller> {
  bool load = true;
  List<UserModel> userModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readApiAllShop();
  }

  Future<Null> readApiAllShop() async {
    String urlAPI = '${MyConstant.domain}/shopping/getUserWhereSeller.php';
    await Dio().get(urlAPI).then((value) {
      setState(() {
        load = false;
      });
      var result = json.decode(value.data);
      for (var item in result) {
        UserModel usermodel = UserModel.fromMap(item);
        setState(() {
          userModels.add(usermodel);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: load
          ? ShowProgress()
          : Container(
              decoration: MyConstant().gradientRadioBackground(),
              child: ListView.builder(
                padding: EdgeInsets.only(top: 150),
                itemCount: userModels.length,
                itemBuilder: (context, index) => Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                          errorWidget: (context, url, error) =>
                              ShowImage(path: MyConstant.avatar),
                          placeholder: (context, url) => ShowProgress(),
                          fit: BoxFit.cover,
                          imageUrl:
                              '${MyConstant.domain}${userModels[index].avatar}'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ShowTitle(
                          title: cutWord(userModels[index].name),
                          textStyle: MyConstant().h2Style(),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            print('You Click from ${userModels[index].name}');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuyerShowShopSeller(
                                  userModel: userModels[index],
                                ),
                              ),
                            );
                          },
                          child: ShowTitle(
                            title: 'เข้าสู่ร้านค้า',
                            textStyle: MyConstant().h3WhiteStyle(),
                          ))
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  String cutWord(String name) {
    String result = name;
    if (result.length > 14) {
      result = result.substring(0, 10);
      result = '$result ...';
    }
    return result;
  }
}
