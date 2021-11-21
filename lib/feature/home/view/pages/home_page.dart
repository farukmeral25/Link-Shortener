// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grisoftware/core/constant/theme/app_color.dart';
import 'package:grisoftware/core/utils/screen_size.dart';
import 'package:grisoftware/feature/home/view/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: AppColors.white,
      ),
      body: HomePageBody(),
    );
  }
}
