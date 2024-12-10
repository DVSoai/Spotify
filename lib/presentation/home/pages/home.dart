import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/appbar/app_bar.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/constants/sized_box_constants.dart';
import 'package:spotify/presentation/home/widgets/play_list.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../profile/pages/profile.dart';
import '../widgets/news_songs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => const ProfilePage())
              );
            },
            icon: const Icon(
                Icons.person
            )
        ),
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs(),
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: [
                  const NewsSongs(),
                  Container(),
                  Container(),
                  Container()
                ],
              ),
            ),
            SizedBoxConstants.sizedBoxH40,
            const PlayList(),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard(){
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                  AppVectors.homeTopCard
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 60
                ),
                child: Image.asset(
                    AppImages.homeArtist
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      isScrollable: false,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      indicatorColor: AppColors.primary,
      padding: const EdgeInsets.symmetric(
       vertical: 30,
      ),
      tabs: const [
        Text(
          'News',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15
          ),
        ),
        Text(
          'Videos',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15
          ),
        ),
        Text(
          'Artists',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15
          ),
        ),
        Text(
          'Podcast',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15
          ),
        )
      ],
    );
  }
}
