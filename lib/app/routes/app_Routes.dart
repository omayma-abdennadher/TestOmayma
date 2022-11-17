import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../modules/bags/views/BagsView.dart';
import '../modules/detailsProduct/views/DetailsView.dart';
import '../modules/receipt/views/ReceiptView.dart';

class NavigationServices {
  NavigationServices(this.context);

  final BuildContext context;

  Future<dynamic> _pushMaterialPageRoute(Widget widget,
      {bool fullscreenDialog: false}) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => widget, fullscreenDialog: fullscreenDialog),
    );
  }

  Future<dynamic> gotoDetails(idProduct) async {
    return await _pushMaterialPageRoute(DetailsView());
  }

  Future<dynamic> gotoBags() async {
    return await _pushMaterialPageRoute(BagsView());
  }

  Future<dynamic> gotoReceiptView() async {
    return await _pushMaterialPageRoute(ReceiptView());
  }
}
