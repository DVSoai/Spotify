import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/constants/sized_box_constants.dart';
import 'package:spotify/presentation/auth/pages/sign_in.dart';
import 'package:spotify/presentation/auth/pages/sign_up.dart';

import '../../../common/appbar/app_bar.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/theme/app_colors.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppbar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
                AppVectors.topPattern
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
                AppVectors.bottomPattern
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                  AppImages.authBg
              )
          ),
          Align(
            alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        AppVectors.logo,
                    ),
                    SizedBoxConstants.sizedBoxH20,
                    const Text(
                      'Enjoy Listening To Music',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  SizedBoxConstants.sizedBoxH20,
                    const Text(
                      'Spotify is a proprietary Swedish audio streaming and media services provider ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: AppColors.grey
                      ),
                      textAlign: TextAlign.center,
                    ),
                 SizedBoxConstants.sizedBoxH10,
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: BasicAppButton(
                            height: 50,
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context)=>  SignupPage()
                                    )
                                );
                              },
                              title: 'Register'
                          ),
                        ),
                      SizedBoxConstants.sizedBoxW20,
                        Expanded(
                          flex: 1,
                          child: TextButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context)=>  SignInPage()
                                    )
                                );
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: context.isDarkMode ? Colors.white : Colors.black
                                ),
                              )
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
