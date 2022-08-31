import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/models/music_model.dart';
import 'package:music_box/services/kw_service.dart';
import 'package:music_box/services/player_service.dart';
import 'package:music_box/utils/audio_player.dart';
import 'package:music_box/utils/common_utils.dart';

import 'player_state.dart';

class PlayerLogic extends GetxController with GetTickerProviderStateMixin {
  final PlayerState state = PlayerState();
  final KwService service = Get.find();
  final PlayerService playerService = Get.find();

  late AnimationController ctrl;
  late ValueNotifier<double> progressNotifier;

  @override
  void onInit() {
    super.onInit();

    ctrl = AnimationController(vsync: this)
      ..drive(Tween(begin: 0, end: 1))
      ..duration = const Duration(milliseconds: 500);
    progressNotifier = ValueNotifier<double>(0.0);

    AudioPlayerUtil.positionListener(
      key: this,
      listener: (p0) {
        progressNotifier.value = p0.floorToDouble();

        /// 当前进度
        state.playerCurrentTime = CommonUtils.getPlayerTimes(p0);
        update();
      },
    );
  }

  /// 播放
  void playerMusic(MusicModel model) async {
    playerService.playerMusic(model);
    updatePlayer(model);
  }

  /// 播放列表
  void playerMusicList(List<MusicModel> list) async {
    if(list.isEmpty) return;
    var currentMusic = list[0];

    playerService.musicList = list;
    AudioPlayerUtil.listPlayerHandle(musicModels: list, musicModel: currentMusic);
    updatePlayer(currentMusic);
  }

  /// 播放、暂停
  void updatePlayer(MusicModel model) {
    state.musicModel = model;
    state.playerMaxTime = CommonUtils.getPlayerTimes(model.duration);
    update();
  }

  /// 调整进度
  void moveSeekbar(double value) {
    if (state.musicModel == null) return;
    progressNotifier.value = value;
    AudioPlayerUtil.seekTo(
        position: Duration(milliseconds: value.toInt()),
        model: state.musicModel!);
  }

  /// 上一曲
  void prev() {
    AudioPlayerUtil.previousMusic();
    state.musicModel = AudioPlayerUtil.musicModel;
    update();
  }

  /// 下一曲
  void next() {
    AudioPlayerUtil.nextMusic();
    state.musicModel = AudioPlayerUtil.musicModel;
    update();
  }

  void playSuccess(MusicModel model){
    state.musicModel = model;
    state.playerMaxTime = CommonUtils.getPlayerTimes(model.duration);
    update();
  }
}
