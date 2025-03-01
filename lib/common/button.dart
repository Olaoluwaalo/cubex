import 'package:cubex/common/texts.dart';
import 'package:cubex/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CButton extends StatelessWidget {
  const CButton({
    super.key,
    this.buttonColor,
    required this.buttonText,
    this.onTap,
    this.border,
    this.child,
  });
  final Color? buttonColor;
  final String buttonText;
  final Function()? onTap;
  final BoxBorder? border;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: border,
          color: buttonColor ?? CColors.buttonColor,
          borderRadius: BorderRadius.circular(
            9.r,
          ),
        ),
        child: child ??
            Center(
              child: boldText(
                text: buttonText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
      ),
    );
  }
}
