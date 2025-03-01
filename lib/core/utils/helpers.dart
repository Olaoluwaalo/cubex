import 'package:flutter/material.dart';

class CHelpers{
  static bool isDarkmode(BuildContext context){
   return Theme.of(context).brightness==Brightness.dark;
  }
}