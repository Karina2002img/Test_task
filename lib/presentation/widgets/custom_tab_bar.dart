import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:emotions_diary/utils/custom_icon.dart';
import 'package:emotions_diary/utils/custom_colors.dart';
import 'package:emotions_diary/presentation/screens/diary_screen.dart';
import 'package:emotions_diary/presentation/screens/statistics_screen.dart';
import 'package:emotions_diary/utils/app_title.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  CustomTabBarState createState() => CustomTabBarState();
}

class CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: CustomColors.gray4,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: CustomColors.tangerineColor,
                ),
                indicatorSize:
                TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.zero,
                labelColor: Colors.white,
                unselectedLabelColor: CustomColors.gray2,
                tabs: [
                  Tab(
                    child: Row(
                      children: [
                        SvgPicture.asset(CustomIcon.diaryIcon),
                        const SizedBox(width: 7),
                        Text(
                          AppTitle.emotionsDiaryTitle,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        SvgPicture.asset(CustomIcon.statisticsIcon),
                        const SizedBox(width: 7),
                        Text(
                          AppTitle.statistics,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                DiaryScreen(),
                StatisticsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
