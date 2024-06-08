import 'package:e_commerce/app/app_widgets/TextFieldWithLabel.dart';
import 'package:e_commerce/app/core/route/route_paths.dart';
import 'package:e_commerce/app/core/values/app_utils.dart';
import 'package:e_commerce/app/module/user_auth/controller/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formGlobalKey = GlobalKey<FormState>();

  var userMail = '';

  var userPassword = '';

  var userName;

  var confirmPass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: formGlobalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _imagePicker(),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                _logInSubmitButton(),
                const SizedBox(height: 20),
                _signUpWith(),
                const SizedBox(height: 20),
                goTOLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }

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
              onPressed: () {},
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

  Widget _imagePicker() => Stack(
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
      );

  Widget goTOLogin() => Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            context.go(RoutePaths.loginPath);
          },
          child: const Text(
            'Already have an account? Login',
            style: TextStyle(color: Colors.blue),
          ),
        );
      });

  Widget _emailInput() => TextFieldWithLabel(
      false,
      'Email',
      readOnly: false,
      enableTitle: false,
      validation: true,
      isFieldForEmail: true,
      prefixIcon: Icons.mail_outline_rounded,
      (value) => userMail = value);

  // (value) => setState(() => userMail = value));
  Widget _nameInput() => TextFieldWithLabel(
      false,
      'User name',
      readOnly: false,
      enableTitle: false,
      prefixIcon: Icons.person_outlined,
      (value) => userName = value);

  Widget _passwordInput() => TextFieldWithLabel(
      false,
      'Password',
      password: true,
      readOnly: false,
      enableTitle: false,
      prefixIcon: Icons.lock_outline_rounded,
      (value) => userPassword = value);

  // (value) => setState(() => userPassword = value));

  Widget _confirmPasswordInput() => TextFieldWithLabel(
      false,
      'Confirm password',
      password: true,
      readOnly: false,
      enableTitle: false,
      prefixIcon: Icons.lock_outline_rounded,
      (value) => confirmPass = value);
  Widget _logInSubmitButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            _registrationPost();
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  _registrationPost() {
    if (formGlobalKey.currentState!.validate()) {
      formGlobalKey.currentState?.save();

      Provider.of<UserAuthViewModel>(context, listen: false)
          .userRegistration(userName, userMail, userPassword, confirmPass)
          .then((value) => {
                if (value.code == 200)
                  {
                    AppUtils.showToast(context, 'Registration Success!'),
                    AppUtils.showAlertDialog(
                        context, 'Alert', "Registration Success !"),
                    context.go(RoutePaths.loginPath),
                  }
                else
                  {
                    AppUtils.showToast(context, 'Registration failed!'),
                    AppUtils.showAlertDialog(
                        context, 'Alert', "Registration failed !")
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
