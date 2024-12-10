import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/presentation/auth/pages/signup_or_signin.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/constants/sized_box_constants.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../bloc/theme_cubit.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      AppImages.chooseMode,
                    ))),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                const Text(
                  'Choose Mode',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
                SizedBoxConstants.sizedBoxH20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color(0xFF30393C).withOpacity(0.5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    AppVectors.moon,
                                    fit: BoxFit.none,
                                  ),
                                )),
                          ),
                        ),
                        SizedBoxConstants.sizedBoxH16,
                        const Text(
                          'Dark Mode',
                          style: TextStyle(color: AppColors.grey,fontSize: 17,fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBoxConstants.sizedBoxW40,
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF30393C).withOpacity(0.5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    AppVectors.sun,
                                    fit: BoxFit.none,
                                  ),
                                )),
                          ),
                        ),
                        SizedBoxConstants.sizedBoxH16,
                        const Text(
                          'Light Mode',
                          style: TextStyle(color: AppColors.grey,fontSize: 17,fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
                SizedBoxConstants.sizedBoxH56,
                BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SignupOrSigninPage()));
                    },
                    title: 'Continue')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
