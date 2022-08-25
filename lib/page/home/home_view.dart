import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/page/home/home_state.dart';
import 'package:music_box/page/player/player_view.dart';
import 'package:music_box/utils/app_colors.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  late HomeLogic _logic;
  late HomeState _state;

  @override
  Widget build(BuildContext context) {
    _logic = Get.put(HomeLogic());
    _state = Get.find<HomeLogic>().state;

    return GetBuilder<HomeLogic>(
      assignId: true,
      builder: (logic) {
        return Column(
          children: [
            _buildAppBar(),
            _buildPageView(),
            PlayerWidget()
          ],
        );
      },
    );
  }

  Widget _buildAppBar() {
    return Container(
      color: AppColors.color_theme,
      padding: const EdgeInsets.only(top: 45),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu_open, color: Colors.white),
                onPressed: () {},
              ),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    height: 35,
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: const Text('search'),
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
          _buildTabBar(),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
        controller: _logic.tabController,
        labelColor: Colors.white,
        labelStyle: const TextStyle(fontSize: 16),
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        isScrollable: true,
        onTap: (value) => _logic.pageController.jumpToPage(value),
        tabs: _logic.state.platformList
            .map((e) => Tab(
                  text: e.platformName,
                ))
            .toList());
  }

  Widget _buildPageView() {
    return Expanded(
      child: PageView(
        children: _logic.state.platformList.map((e) => e.page).toList(),
        controller: _logic.pageController,
        onPageChanged: (value) => _logic.tabController.animateTo(value),
      ),
    );
  }

}
