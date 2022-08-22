import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/models/lyric.dart';
import 'package:music_box/page/player/player_logic.dart';
import 'package:music_box/services/kw_service.dart';

import 'player_detail_state.dart';

class PlayerDetailLogic extends GetxController {
  final PlayerDetailState state = PlayerDetailState();
  final PlayerLogic playerLogic = Get.find();
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
    LyricResponse result = await service.getLrc(playerLogic.state.musicModel!.id);
    state.lrcList = result.data?.lrclList ?? [];
    update(['lrc']);
  }

  void changeLrcVisible(){
    state.lrcVisible = !state.lrcVisible;
    update();
  }
}
