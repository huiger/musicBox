import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/models/music_model.dart';
import 'package:music_box/utils/audio_player.dart';
import 'package:music_box/utils/common_utils.dart';

import 'home_state.dart';

class HomeLogic extends GetxController with GetTickerProviderStateMixin {
  final HomeState state = HomeState();

  late TabController tabController;
  late PageController pageController;
  late AnimationController ctrl;
  late ValueNotifier<double> progressNotifier;

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: state.platformList.length, vsync: this);
    pageController = PageController(initialPage: 0);

    ctrl = AnimationController(vsync: this)
      ..drive(Tween(begin: 0, end: 1))
      ..duration = const Duration(milliseconds: 500);
    progressNotifier = ValueNotifier<double>(0.0);

    AudioPlayerUtil.positionListener(key: this, listener: (p0) {
      progressNotifier.value = p0.floorToDouble();
      /// 当前进度
      state.playerCurrentTime = CommonUtils.getPlayerTimes(p0);
      update();
    },);
  }

  /// 播放、暂停
  void updatePlayer(MusicModel model){
    state.musicModel = model;
    state.playerMaxTime = CommonUtils.getPlayerTimes(model.duration);
    update();
  }

  /// 上一曲
  void prev(){
    AudioPlayerUtil.previousMusic();
    state.musicModel = AudioPlayerUtil.musicModel;
    update();
  }

  /// 下一曲
  void next(){
    AudioPlayerUtil.nextMusic();
    state.musicModel = AudioPlayerUtil.musicModel;
    update();
  }

  /// 调整进度
  void moveSeekbar(double value){
    if (state.musicModel == null) return;
    progressNotifier.value = value;
    AudioPlayerUtil.seekTo(
        position: Duration(milliseconds: value.toInt()),
        model: state.musicModel!);
  }

}
