import 'package:e_commerce/app/app_widgets/TextFieldWithLabel.dart';
import 'package:e_commerce/app/core/route/route_paths.dart';
import 'package:e_commerce/app/core/values/app_utils.dart';
import 'package:e_commerce/app/core/values/app_values.dart';
import 'package:e_commerce/app/core/values/extention.dart';
import 'package:e_commerce/app/core/values/image_values.dart';
import 'package:e_commerce/app/module/user_auth/controller/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formGlobalKey = GlobalKey<FormState>();

  var userName;
  var userPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formGlobalKey,
        child: Padding(
          padding: const EdgeInsets.all(AppValues.padding_16).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _appLogoBanner(),
              _loginTitle(),
              _nameInput(),
              // Visibility(
              //   visible: false,
              //   child: Text(
              //     'Invalid Email',
              //     style: context.resources.styles
              //         .caption1(context.resources.colors.error500),
              //   ),
              // ),
              _passwordInput(),
              _forgotPassword(),
              SizedBox(height: 50.h),

              _logInSubmitButton(),
              SizedBox(height: 50.h),
              _signUpWith(),
              SizedBox(height: 50.h), _createAccField(),
            ],
          ),
        ),
      ),
    );
  }

  _createAccField() => InkWell(
      onTap: () => context.go(RoutePaths.registrationScreen),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Create an account'),
      ));

  Widget _appLogoBanner() => Padding(
        padding: const EdgeInsets.only(top: 70.0).h,
        child: SvgPicture.asset(
          ImageValues.app_logo_svg,
          height: 48.h,
        ),
      );

  Widget _loginTitle() => Padding(
        padding: EdgeInsets.only(top: 70.h),
        child: Text(
          'Sign in',
          style: context.appThemeText.headlineLarge,
        ),
      );

  Widget _nameInput() => Padding(
        padding: EdgeInsets.only(top: 40.h),
        child: TextFieldWithLabel(
            false,
            'User Name',
            readOnly: false,
            prefixIcon: Icons.person_outlined,
            enableTitle: false,
            (value) => userName = value),
      );
  // (value) => setState(() => userName = value));

  Widget _passwordInput() => TextFieldWithLabel(
      false,
      'Password',
      password: true,
      readOnly: false,
      enableTitle: false,
      prefixIcon: Icons.lock_outline_rounded,
      (value) => userPassword = value);
  // (value) => setState(() => userPassword = value));

  Widget _logInSubmitButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            _loginPost();
          },
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget _forgotPassword() => const Align(
      alignment: Alignment.bottomRight, child: Text('Forgot Password?'));

  Widget _signUpWith() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: IconButton(
              icon: const Icon(Icons.facebook),
              color: Colors.blue,
              onPressed: () {
                context.go(RoutePaths.mainScreen);
              },
            ),
          ),
          const SizedBox(width: 20),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: IconButton(
              icon: const Icon(Icons.mail),
              color: Colors.red,
              onPressed: () {},
            ),
          ),
        ],
      );

  _loginPost() {
    if (formGlobalKey.currentState!.validate()) {
      formGlobalKey.currentState?.save();

      Provider.of<UserAuthViewModel>(context, listen: false)
          .logInApiService(userName, userPassword)
          .then((value) => {
                if (value.token != null)
                  {
                    context.go(RoutePaths.mainScreen),
                    AppUtils.showToast(context, 'Login Success!')
                  }
                else
                  {
                    AppUtils.showToast(context, 'Login failed!'),
                    AppUtils.showAlertDialog(context, 'Alert', "Login failed !")
                  }
              });
    }
  }

  bool isButtonDisabled() {
    if (userName == '' ||
        userName == null ||
        userPassword == '' ||
        userPassword == null) {
      return true;
    } else {
      return false;
    }
  }
}
