import 'package:e_commerce/app/app_widgets/FormLabel.dart';
import 'package:e_commerce/app/core/values/app_colors.dart';
import 'package:e_commerce/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextFieldWithLabel extends StatefulWidget {
  final bool isRequired;
  final bool readOnly;
  final bool validation;
  final bool isFieldForEmail;
  final String? labelText;
  final String hintText;
  final IconData? prefixIcon;
  final Function onChanged;
  final bool password;
  final controller;
  final enableTitle;
  double width;

  TextFieldWithLabel(this.isRequired, this.hintText, this.onChanged,
      {this.password = false,
      this.labelText = '',
      this.readOnly = true,
      this.isFieldForEmail = false,
      this.width = double.infinity,
      this.validation = false,
      this.enableTitle = true,
      this.prefixIcon,
      this.controller,
      Key? key})
      : super(key: key);

  @override
  _TextFieldWithLabelState createState() => _TextFieldWithLabelState();
}

//final formGlobalKey = GlobalKey<FormState>();

class _TextFieldWithLabelState extends State<TextFieldWithLabel> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
            visible: widget.enableTitle,
            child: FormLabel(widget.labelText!, widget.isRequired)),
        Padding(
          padding: const EdgeInsets.only(bottom: AppValues.padding_24).r,
          child: SizedBox(
            child: Card(
              child: TextFormField(
                  //  clipBehavior: Clip.none,
                  controller: widget.controller,
                  readOnly: widget.readOnly,
                  onTapOutside: (event) =>
                      FocusScope.of(context).requestFocus(FocusNode()),
                  obscureText: widget.password == true ? _obscureText : false,
                  keyboardType: widget.isFieldForEmail
                      ? TextInputType.emailAddress
                      : TextInputType.multiline,
                  validator: widget.validation == true
                      ? (input) =>
                          input!.isValidEmail() ? null : "\u26A0 Invalid email"
                      : null,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (value) => widget.onChanged(value),
                  inputFormatters: widget.isFieldForEmail
                      ? [
                          FilteringTextInputFormatter.deny(RegExp(r"\s")),
                        ]
                      : [],
                  decoration: InputDecoration(
                    prefixIcon: widget.prefixIcon == null
                        ? null
                        : Icon(widget.prefixIcon),
                    suffixIcon: widget.password == true
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          )
                        : null,
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    // border: customeBorder(AppColors.neutral300),
                    //  errorBorder: customeBorder(AppColors.errorColor),
                    // focusedBorder: customeBorder(widget.readOnly
                    //     ? AppColors.neutral300
                    //     : AppColors.primary),
                    //  enabledBorder: customeBorder(AppColors.neutral300),
                    hintText: widget.hintText,
                    counterText: "",
                    // hintStyle: hintText(
                    //     widget.readOnly ? AppColors.neutral600 : null)
                  )),
            ),
          ),
        ),
      ],
    );
  }
}

BoxDecoration textBoxDecoration() => BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppColors.neutral300.withOpacity(0.2),
          offset: Offset(0, 3),
          blurRadius: 6,
          spreadRadius: 2,
        ),
      ],
    );

OutlineInputBorder customeBorder(borderColor) => OutlineInputBorder(
    borderSide: BorderSide(color: borderColor),
    borderRadius: BorderRadius.all(Radius.circular(4).r));

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
            r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
            r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
            r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
            r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
            r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
            r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])')
        .hasMatch(this);
  }
}
