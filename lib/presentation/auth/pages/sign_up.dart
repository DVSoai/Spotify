import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/appbar/app_bar.dart';
import 'package:spotify/core/configs/constants/sized_box_constants.dart';
import 'package:spotify/presentation/auth/pages/sign_in.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../data/models/auth/create_user_req.dart';
import '../../../domain/usecases/auth/signup.dart';
import '../../../service_locator.dart';
import '../../home/pages/home.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 30,
        ),
        child: SingleChildScrollView(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            _registerText(),
            SizedBoxConstants.sizedBoxH30,
            _fullNameField(context),
            SizedBoxConstants.sizedBoxH20,
            _emailField(context),
            SizedBoxConstants.sizedBoxH20,
            _passwordField(context),
            SizedBoxConstants.sizedBoxH40,
            BasicAppButton(
              onPressed: () async {
                var result = await sl<SignupUseCase>().call(
                    params: CreateUserReq(
                      fullName: _fullName.text.toString(),
                      email: _email.text.toString(),
                      password: _password.text.toString(),
                    ));
                result.fold(
                        (l) {
                      var snackBar = SnackBar(content: Text(l.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                        (r) {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (BuildContext context) => const HomePage()),
                          (route) => false);
                    }
                );
              },
              title: 'Create Account',
            ),
            _siginText(context),
          ]),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullName,
      decoration: const InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(Theme
          .of(context)
          .inputDecorationTheme),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: 'Email',
      ).applyDefaults(Theme
          .of(context)
          .inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme
          .of(context)
          .inputDecorationTheme),
    );
  }

  Widget _siginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account?',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>  SignInPage()));
            },
            child: const Text(
              'Sign in',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
