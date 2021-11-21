// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grisoftware/core/constant/asset_path.dart';
import 'package:grisoftware/core/constant/theme/app_color.dart';
import 'package:grisoftware/core/constant/theme/app_text_styles.dart';
import 'package:grisoftware/core/functions/remove_focus.dart';
import 'package:grisoftware/core/utils/screen_size.dart';
import 'package:grisoftware/feature/home/view/widgets/cards/short_link_card.dart';
import 'package:grisoftware/feature/home/viewmodel/home_page_provider.dart';
import 'package:provider/provider.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (BuildContext context, HomePageProvider homePageProvider, Widget? widget) {
        return SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              removeFocus(context);
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  homePageProvider.urls.isNotEmpty ? listShortLinkCards(homePageProvider) : emptyStateBody(),
                  buttonShortLink(homePageProvider),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Padding listShortLinkCards(HomePageProvider homePageProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          Text('Your Link History'),
          SizedBox(
            height: ScreenSize().dynamicHeight(.6674),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ShortLinkCard(index: index);
              },
              itemCount: homePageProvider.urls.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget emptyStateBody() {
    return SizedBox(
      height: ScreenSize().dynamicHeight(.6884),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SvgPicture.asset(AssetsPath().logoSVG),
          ),
          SvgPicture.asset(
            AssetsPath().illustrationSVG,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Let's get started!",
              style: AppTextStyles.title20bold,
            ),
          ),
          SizedBox(
            width: ScreenSize().dynamicWidth(.7),
            child: Text(
              "Paste your first link into the field to shorten it",
              style: AppTextStyles.body20w500,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonShortLink(HomePageProvider homePageProvider) {
    return Stack(
      children: [
        Container(
          color: AppColors.purple,
          height: ScreenSize().dynamicHeight(.25),
          width: ScreenSize().dynamicWidth(1),
        ),
        Positioned(
          right: 0,
          child: SvgPicture.asset(
            AssetsPath().shapeSVG,
          ),
        ),
        Center(
          child: SizedBox(
            height: ScreenSize().dynamicHeight(.25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox.shrink(),
                Container(
                  width: ScreenSize().dynamicWidth(.7),
                  height: ScreenSize().dynamicHeight(.06),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: homePageProvider.wrong ? AppColors.red : AppColors.white,
                    ),
                  ),
                  child: TextField(
                    controller: homePageProvider.linkController,
                    textAlign: TextAlign.center,
                    cursorColor: AppColors.black,
                    decoration: InputDecoration(
                      hintText: homePageProvider.wrong ? 'Please add a link here' : 'Shorten a link here ...',
                      hintStyle: AppTextStyles.body16w500.copyWith(
                        color: homePageProvider.wrong ? AppColors.red : AppColors.black,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    homePageProvider.enterUrl();
                  },
                  child: Container(
                    width: ScreenSize().dynamicWidth(.7),
                    height: ScreenSize().dynamicHeight(.06),
                    decoration: BoxDecoration(
                      color: AppColors.turqoise,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        "SHORTEN IT",
                        style: AppTextStyles.title20bold.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
