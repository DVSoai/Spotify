import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/appbar/app_bar.dart';
import 'package:spotify/core/configs/constants/sized_box_constants.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/presentation/auth/pages/sign_up.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../domain/usecases/auth/signin.dart';
import '../../../service_locator.dart';
import '../../home/pages/home.dart';

class SignInPage extends StatelessWidget {
   SignInPage({super.key});

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
            _signInText(),
            SizedBoxConstants.sizedBoxH30,
            SizedBoxConstants.sizedBoxH20,
            _emailField(context),
            SizedBoxConstants.sizedBoxH20,
            _passwordField(context),
            SizedBoxConstants.sizedBoxH40,
            BasicAppButton(
              onPressed: () async {
                var result = await sl<SigninUseCase>().call(
                    params: SigninUserReq(
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
              title: 'Sign In',
            ),
            _sigUpText(context),
          ]),
        ),
      ),
    );
  }

  Widget _signInText() {
    return const Text(
      'SignIn',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: 'Enter UserName Or Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _sigUpText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not a Member?',
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
                      builder: (BuildContext context) => SignupPage()));
            },
            child: const Text(
              'Register Now',
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
