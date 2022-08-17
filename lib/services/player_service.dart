import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/models/music_model.dart';

class PlayerService extends GetxService{

  /// 播放列表
  List<MusicModel> _musicList = [];

  List<MusicModel> addMusic(MusicModel model){
    var has = _musicList.where((element) => element.id == model.id).isNotEmpty;
    if (!has) {
      _musicList.add(model);
    }

    debugPrint('播放列表：${_musicList.map((e) => '${e.name} - ${e.author}').toString()}');
    return _musicList;
  }

  List<MusicModel> getMusicList(){
    return _musicList;
  }
}