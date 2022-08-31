import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/models/music_model.dart';
import 'package:music_box/utils/audio_player.dart';

class PlayerService extends GetxService{

  /// 播放列表
  List<MusicModel> musicList = [];

  List<MusicModel> addMusic(MusicModel model){
    var has = musicList.where((element) => element.id == model.id).isNotEmpty;
    if (!has) {
      musicList.add(model);
    }

    debugPrint('播放列表：${musicList.map((e) => '${e.name} - ${e.author}').toString()}');
    return musicList;
  }

  /// 播放
  void playerMusic(MusicModel model) async {
    AudioPlayerUtil.listPlayerHandle(
        musicModels: addMusic(model), musicModel: model);
  }
}