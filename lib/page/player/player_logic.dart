import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/models/lyric.dart';
import 'package:music_box/page/home/home_logic.dart';
import 'package:music_box/services/kw_service.dart';

import 'player_state.dart';

class PlayerLogic extends GetxController {
  final PlayerState state = PlayerState();
  final HomeLogic homeLogic = Get.find<HomeLogic>();
  final KwService service = Get.find();

  late ScrollController scrollController;

  /// 用来发送事件 改变弹框高度的stream
  late  StreamController<double> streamController;

  @override
  void onInit() async {
    scrollController = ScrollController();
    streamController = StreamController<double>.broadcast();

    getLrc();
  }

  void getLrc() async {
    LyricResponse result = await service.getLrc(homeLogic.state.musicModel!.id);
    state.lrcList = result.data?.lrclList ?? [];
    update();
  }

  void changeLrcVisible(){
    state.lrcVisible = !state.lrcVisible;
    update();
  }
}
