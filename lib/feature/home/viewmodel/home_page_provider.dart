// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grisoftware/core/constant/theme/app_color.dart';
import 'package:grisoftware/feature/home/domain/entity/argument/url_argument.dart';
import 'package:grisoftware/feature/home/domain/entity/url_entity.dart';
import 'package:grisoftware/feature/home/domain/usecase/fetch_short_url_usecase.dart';

class HomePageProvider with ChangeNotifier {
  HomePageProvider(this.fetchShortUrlUsecase);
  TextEditingController linkController = TextEditingController();
  bool _wrong = false;
  List<UrlEntity> urls = [];
  FetchShortUrlUsecase fetchShortUrlUsecase;
  void enterUrl() async {
    if (linkController.text.contains('.') || linkController.text.isEmpty) {
      UrlEntity urlEntity = await fetchShortUrlUsecase(UrlArgument(url: linkController.text));
      if (urlEntity.ok) {
        urls.add(urlEntity);
      } else {
        _wrong = true;
        Future.delayed(
            Duration(
              seconds: 1,
            ), () {
          _wrong = false;
          notifyListeners();
        });
      }
      linkController.clear();
      notifyListeners();
    } else {
      Fluttertoast.showToast(
          msg: "Entered url is not valid",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void removeUrl(int index) {
    urls.removeAt(index);
    notifyListeners();
  }

  void copyUrl(int index) {
    urls[index].copy = true;
    notifyListeners();
  }

  bool get wrong => _wrong;
  // set wrong(bool value) {
  //   _wrong = value;
  //   notifyListeners();
  // }
}
