import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenericScreen extends StatelessWidget {
  const GenericScreen({
    super.key,
    this.appBar,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.bottomSheet, this.child,
  });
  final PreferredSizeWidget? appBar;
 final Widget? child;
  final Widget? bottomSheet;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 10.h,
        ),
        child: SingleChildScrollView(
          child: child
        ),
      )),
      bottomSheet: bottomSheet,
    );
  }
}
