import 'package:cubex/common/texts.dart';
import 'package:cubex/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<bool?> showGenericDialog({
  required BuildContext context,
  required String contentText,
  Widget? title,
  List<Widget>? actions,
}) {
  final width = MediaQuery.of(context).size.width;
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: title,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: BorderSide(
            color: CColors.buttonColor,
            width: 2.w,
          ),
        ),
        content: boldText(text: contentText, ),
        actions: actions ??
            [
              _dialogButton(
                onTap: () => Navigator.of(context).pop(false),
                context: context,
                width: width,
                text: "Ok",
                color: CColors.buttonColor,
                
              ),
            ],
      );
    },
  );
}

Widget _dialogButton({
  required BuildContext context,
  required double width,
  required String text,
  Color? color,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: color ??
            (Theme.of(context).brightness == Brightness.light
                ? const Color(0xFFF5F5F5).withOpacity(0.9)
                : const Color(0xFF333333).withOpacity(0.8)),
        borderRadius: BorderRadius.circular(20.r),
      ),
      width: 110.w,
      height: 40.h,
      child: Center(
        child: boldText(text: text,fontSize: 13.sp,)
      ),
    ),
  );
}
