import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/page/kw/home/kw_home_state.dart';


class KwHomeLogic extends GetxController with GetTickerProviderStateMixin{
  final KwHomeState state = KwHomeState();
  late TabController tabController;
  late PageController pageController;

  @override
  void onInit() {
    tabController = TabController(length: state.tabs.length, vsync: this);
    pageController = PageController(initialPage: 0);


  }
}
