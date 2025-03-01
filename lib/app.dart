import 'package:cubex/core/Themes/app_theme.dart';
import 'package:cubex/features/home/presentation/screens/input_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CApp extends StatelessWidget {
  const CApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return  MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
           home: InputNameScreen(),
           );
      },
    );

  }
}