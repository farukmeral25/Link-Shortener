import 'package:flutter/material.dart';
import 'package:grisoftware/core/constant/theme/app_color.dart';
import 'package:grisoftware/core/utils/screen_size.dart';

class AppTextStyles {
  static TextStyle title20bold = TextStyle(
    color: AppColors.black,
    fontSize: ScreenSize().dynamicHeight(.028),
    fontWeight: FontWeight.bold,
  );
  static TextStyle body20w500 = TextStyle(
    color: AppColors.grey,
    fontSize: ScreenSize().dynamicHeight(.025),
    fontWeight: FontWeight.w500,
  );
  static TextStyle body16w500 = TextStyle(
    color: AppColors.grey,
    fontSize: ScreenSize().dynamicHeight(.020),
    fontWeight: FontWeight.w500,
  );
  static TextStyle body16bold = TextStyle(
    color: AppColors.grey,
    fontSize: ScreenSize().dynamicHeight(.020),
    fontWeight: FontWeight.bold,
  );
}
