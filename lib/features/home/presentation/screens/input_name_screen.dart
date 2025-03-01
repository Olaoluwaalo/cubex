// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cubex/common/button.dart';
import 'package:cubex/common/generic_screen.dart';
import 'package:cubex/common/logo.dart';
import 'package:cubex/common/textfield.dart';
import 'package:cubex/core/constants/image_strings.dart';
import 'package:cubex/core/utils/validators.dart';
import 'package:cubex/features/home/presentation/screens/countries_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InputNameScreen extends StatelessWidget {
  const InputNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    return GenericScreen(
        crossAxisAlignment: CrossAxisAlignment.center,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              appLogo(),
              SizedBox(
                height: 60.h,
              ),
              SvgPicture.asset(
                CImages.svgImage,
                height: 300.h,
              ),
              SizedBox(
                height: 50.h,
              ),
              CTextfield(
                hintText: "Enter your name",
                prefixIcon: const Icon(
                  Icons.person_outline,
                ),
                validator: Validators.validateField,
                controller: _nameController,
              ),
              SizedBox(
                height: 30.h,
              ),
              CButton(
                buttonText: "Proceed",
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) =>
                            CountriesScreen(name: _nameController.text),
                      ),
                      (route) => false,
                    );
                  }
                },
              )
            ],
          ),
        ));
  }
}
