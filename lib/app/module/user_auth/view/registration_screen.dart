import 'package:e_commerce/app/app_widgets/TextFieldWithLabel.dart';
import 'package:e_commerce/app/app_widgets/input_textfield.dart';
import 'package:e_commerce/app/core/route/route_paths.dart';
import 'package:e_commerce/app/module/user_auth/controller/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/app/core/values/app_values.dart';
import 'package:e_commerce/app/core/values/image_values.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formGlobalKey = GlobalKey<FormState>();

  var userMail;
  var userName;
  var userPassword;
  var confirmPassword;

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formGlobalKey,
          child: Padding(
            padding: const EdgeInsets.all(AppValues.padding_16).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
           
                _nameInput(),
                _emailInput(),
                // Visibility(
                //   visible: false,
                //   child: Text(
                //     'Invalid Email',
                //     style: context.resources.styles
                //         .caption1(context.resources.colors.error500),
                //   ),
                // ),
                _passwordInput(),
                _confirmPasswordInput(),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        _signUpPost();
                      },
                      child: const Text('Sign up')),
                )


                // _changePasswordField()
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _appLogoBanner() => SvgPicture.asset(
        ImageValues.sunny_day_png,
        height: 48.h,
      );

  Widget _nameInput() => TextFieldWithLabel(
      false,
      'Name',
      'Name',
      readOnly: false,
      enableTitle: false,
      (value) => userName = value);

  Widget _emailInput() => TextFieldWithLabel(
      false,
      'Email',
      'Email',
      validation: true,
      readOnly: false,
      enableTitle: false,
      (value) => userMail = value);
  // (value) => setState(() => userMail = value));


  Widget _passwordInput() => TextFieldWithLabel(
      false,
      'Password',
      'Password',
      password: true,
      readOnly: false,
      enableTitle: false,
      (value) => userPassword = value);
  // (value) => setState(() => userPassword = value));

  // Widget _logInSubmitButton() => ThemeButton('loginText',
  //         useFilledBtn: true, isDisabled: isButtonDisabled(), () async {

  //     });

    _loginField() => Builder(builder: (context) {
        return InkWell(
            onTap: () => context.go(RoutePaths.loginScreen),
            child: const Text('Already have an account?'));
      });

  Widget _confirmPasswordInput() => TextFieldWithLabel(
      false,
      'Password',
      'Confirm Password',
      password: true,
      readOnly: false,
      enableTitle: false,
      (value) => confirmPassword = value);

  _signUpPost() {
    if (formGlobalKey.currentState!.validate()) {
      formGlobalKey.currentState?.save();

      Provider.of<UserAuthViewModel>(context, listen: false)
          .userRegistration( userName, userMail, userPassword, confirmPassword)
          .then((value) => {
                // if (value.statusCode == 200)
                //   {
                //     Navigator.pushNamedAndRemoveUntil(
                //         context, RouteVariable.homeRoute, (route) => false),
                //   }
                // else
                //   {
                //     Fluttertoast.showToast(
                //         msg: value.message!,
                //         toastLength: Toast.LENGTH_SHORT,
                //         gravity: ToastGravity.CENTER,
                //         timeInSecForIosWeb: 1,
                //         backgroundColor: Colors.grey,
                //         textColor: Color.fromARGB(255, 236, 234, 234),
                //         fontSize: 16.0)
                //   }
              });
    }
  }

  bool isButtonDisabled() {
    if (userMail == '' ||
        userMail == null ||
        userPassword == '' ||
        userPassword == null) {
      return true;
    } else {
      return false;
    }
  }
}
