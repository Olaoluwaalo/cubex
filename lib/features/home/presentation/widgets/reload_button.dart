import 'package:cubex/common/texts.dart';
import 'package:cubex/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReloadButton extends StatelessWidget {
  const ReloadButton({
    super.key,
    required this.errorMessage,
    this.onReload,
  });
  final String errorMessage;
  final void Function()? onReload;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          boldText(
              text: errorMessage,
              textAlign: TextAlign.center,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
          SizedBox(height: 10.h),
          lightText(
            text: "Check your internet connection and try again.",
            textAlign: TextAlign.center,
            fontSize: 14.sp,
            color: Colors.grey,
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: CColors.buttonColor,
            ),
            onPressed: onReload,
            child:
                boldText(text: "Retry", fontSize: 13.sp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
