import 'package:cubex/common/texts.dart';
import 'package:cubex/core/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

appLogo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        CImages.logo,
        height: 25.h,
      ),
      SizedBox(
        width: 4.w,
      ),
      boldText(text: "Cubex")
    ],
  );
}
