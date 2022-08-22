import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_state.dart';

class HomeLogic extends GetxController with GetTickerProviderStateMixin {
  final HomeState state = HomeState();

  late TabController tabController;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: state.platformList.length, vsync: this);
    pageController = PageController(initialPage: 0);

  }

}
