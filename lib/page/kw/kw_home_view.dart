import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/page/kw/kw_home_logic.dart';
import 'package:music_box/page/kw/kw_home_state.dart';
import 'package:music_box/page/kw/playlist/playlist_view.dart';
import 'package:music_box/utils/app_colors.dart';


class KwhomePage extends StatelessWidget {

  late KwHomeLogic _logic;
  late KwHomeState _state;


  @override
  Widget build(BuildContext context) {
    _logic = Get.put(KwHomeLogic());
    _state = Get.find<KwHomeLogic>().state;

    return Column(
      children: [
        _buildTab(),
        _buildContent(),
      ],
    );
  }

  Widget _buildTab() {
    return TabBar(
        controller: _logic.tabController,
        onTap: (value) => _logic.pageController.jumpToPage(value),
        labelColor: AppColors.color_333333,
        unselectedLabelColor: AppColors.color_999999,
        indicatorColor: Colors.transparent,
        isScrollable: true,
        tabs: _state.tabs
            .map((e) => Tab(
                  text: e,
                ))
            .toList());
  }

  Widget _buildContent() {
    return Expanded(
      child: PageView.builder(
        controller: _logic.pageController,
        onPageChanged: (value) => _logic.tabController.animateTo(value),
        itemCount: _logic.state.tabs.length,
        itemBuilder: (context, index) => PlaylistPage(index == 0),
    ));
  }
}
