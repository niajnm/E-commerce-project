import 'dart:developer';
import 'package:e_commerce/app/core/values/app_colors.dart';
import 'package:e_commerce/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    Key? key,
    this.controller,
    required this.hintText,
    required this.keyboardType,
    this.obscureCharacter = '*',
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.radius = 10.0,
    this.isPhoneNumber = false,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final bool isPhoneNumber;
  final bool isPassword;
  final String? obscureCharacter;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double radius;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  var _isObsecured;

  @override
  void initState() {
    super.initState();
    _isObsecured = true;
  }

  @override
  Widget build(BuildContext context) {
    return
        // TextFormField(
        //   controller: controller,
        //   obscureText: obscureText,
        //   decoration: InputDecoration(hintText: hintText),
        //   validator: validator,
        //   keyboardType: keyboardType,
        // );
        SizedBox(
      width: double.infinity,
      height: AppValues.height_42.h,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        maxLength: widget.isPhoneNumber ? 11 : null,
        obscureText: widget.isPassword ? _isObsecured : false,
        onTapOutside: (event) =>
            FocusScope.of(context).requestFocus(FocusNode()),
        obscuringCharacter: widget.obscureCharacter!,
        validator: widget.validator,
        // style: TextStyle(
        //   fontSize: 14.0,
        //   color: AppColors.colorBlack,
        // ),
        decoration: _decoration(),
      ),
    );
  }

  InputDecoration? _decoration() => InputDecoration(
        fillColor: AppColors.neutral500,
        hintText: widget.hintText,
        counterText: '',
        hintStyle: const TextStyle(
          fontSize: 14.0,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: _suffixIcon(),
        
        border: _border(),
        enabledBorder: _enabledBorder(),
        focusedBorder: _focusedBorder(),
        contentPadding: const EdgeInsets.all(0),
      );

  Widget? _suffixIcon() {
    return widget.isPassword
        ? IconButton(
            onPressed: () {
              setState(() {
                _isObsecured = !_isObsecured;
              });
            },
            icon: _isObsecured
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off))
        : widget.suffixIcon;
  }

  InputBorder? _focusedBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.radius),
        borderSide: const BorderSide(
          color: AppColors.colorPrimary,
          width: 1.0,
        ),
      );

  InputBorder? _enabledBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.radius),
        borderSide: const BorderSide(
          color: AppColors.neutral300,
          width: 1.0,
        ),
      );

  InputBorder? _border() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.radius),
        borderSide: const BorderSide(
          color: AppColors.neutral300,
          width: 1.0,
        ),
      );
}
