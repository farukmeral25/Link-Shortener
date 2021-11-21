// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grisoftware/core/constant/asset_path.dart';
import 'package:grisoftware/core/constant/theme/app_color.dart';
import 'package:grisoftware/core/constant/theme/app_text_styles.dart';
import 'package:grisoftware/core/utils/screen_size.dart';
import 'package:grisoftware/feature/home/viewmodel/home_page_provider.dart';
import 'package:provider/provider.dart';

class ShortLinkCard extends StatelessWidget {
  const ShortLinkCard({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (BuildContext context, HomePageProvider homePageProvider, Widget? widget) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Container(
            width: ScreenSize().dynamicWidth(.85),
            height: ScreenSize().dynamicHeight(.20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        homePageProvider.urls[index].originalUrl!,
                        style: AppTextStyles.body16w500,
                      ),
                      GestureDetector(
                        onTap: () {
                          homePageProvider.removeUrl(index);
                        },
                        child: SvgPicture.asset(AssetsPath().delSVG),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8, bottom: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      homePageProvider.urls[index].shortUrl!,
                      style: AppTextStyles.body16w500.copyWith(color: AppColors.turqoise),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                      ClipboardData(text: homePageProvider.urls[index].shortUrl),
                    );
                    homePageProvider.copyUrl(index);
                  },
                  child: Container(
                    width: ScreenSize().dynamicWidth(.7),
                    height: ScreenSize().dynamicHeight(.04),
                    decoration: BoxDecoration(
                      color: homePageProvider.urls[index].copy ? AppColors.purple : AppColors.turqoise,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        homePageProvider.urls[index].copy ? "COPIED!" : "COPY",
                        style: AppTextStyles.body16bold.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
