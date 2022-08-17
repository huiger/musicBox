import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'player_state.dart';

class PlayerLogic extends GetxController {
  final PlayerState state = PlayerState();

  late ScrollController scrollController;

  /// 用来发送事件 改变弹框高度的stream
  late  StreamController<double> streamController;

  @override
  void onInit() {
    scrollController = ScrollController();
    streamController = StreamController<double>.broadcast();



  }

  void changeLrcVisible(){
    state.lrcVisible = !state.lrcVisible;
    update();
  }
}
