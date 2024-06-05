import 'package:flutter/material.dart';
import 'package:e_commerce/app/app_widgets/TextFieldWithLabel.dart';
import 'package:e_commerce/app/core/route/route_paths.dart';
import 'package:e_commerce/app/module/user_auth/controller/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/app/core/values/app_values.dart';
import 'package:e_commerce/app/core/values/image_values.dart';

class RegistrationScreen extends StatelessWidget {
  final formGlobalKey = GlobalKey<FormState>();

  var userMail;
  var userPassword;
  var userName;
  var confirmPass;

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey[800],
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.camera_alt,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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

              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    child: IconButton(
                      icon: Icon(Icons.facebook),
                      color: Colors.blue,
                      onPressed: () {
                        _registrationPost(context);
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    child: IconButton(
                      icon: Icon(Icons.mail),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.go(RoutePaths.loginPath);
                },
                child: const Text(
                  'Already have an account? Login',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bannerLogo() => Row(
        children: [
          _appLogoBanner(),
          // _appNameTitle()
        ],
      );

  Widget _appLogoBanner() => SvgPicture.asset(
        ImageValues.sunny_day_png,
        height: 48.h,
      );

  Widget _emailInput() => TextFieldWithLabel(
      false,
      'Email',
      'Email',
      readOnly: false,
      enableTitle: false,
      (value) => userMail = value);
  // (value) => setState(() => userMail = value));

  Widget _nameInput() => TextFieldWithLabel(
      false,
      'Name',
      'Name',
      readOnly: false,
      enableTitle: false,
      (value) => userName = value);

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

  Widget _confirmPasswordInput() => TextFieldWithLabel(
      false,
      'Confirm password',
      'Confirm password',
      password: true,
      readOnly: false,
      enableTitle: false,
      (value) => confirmPass = value);

  _registrationPost(context) {
    if (formGlobalKey.currentState!.validate()) {
      formGlobalKey.currentState?.save();

      Provider.of<UserAuthViewModel>(context, listen: false)
          .userRegistration(userName, userMail, userPassword, confirmPass)
          .then((value) => {
                if (value.code == 200)
                  {
                    context.goNamed(RoutePaths.loginPath)
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, RoutePaths.loginPath, (route) => false),
                  }
                else
                  {
                    Fluttertoast.showToast(
                        msg: value.message,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Color.fromARGB(255, 236, 234, 234),
                        fontSize: 16.0)
                  }
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
