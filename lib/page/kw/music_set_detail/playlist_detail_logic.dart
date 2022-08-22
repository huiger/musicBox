import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:music_box/models/kw_music_set_detail.dart';
import 'package:music_box/models/music_model.dart';
import 'package:music_box/page/home/home_logic.dart';
import 'package:music_box/page/player/player_logic.dart';
import 'package:music_box/services/kw_service.dart';

import 'playlist_detail_state.dart';

class PlaylistDetailLogic extends GetxController {
  final PlaylistDetailState state = PlaylistDetailState();
  final KwService _service = Get.find();
  final PlayerLogic playerLogic = Get.find();


  @override
  void onInit() {
    super.onInit();
    state.id = Get.arguments['id'];
    getList();
  }

  void getList() async {
    state.detail = await _service.getMusicSetDetail(state.id);
    update();
  }

  void playMusic(int index, Musiclist? music){
    if(music == null) {
      EasyLoading.showError('播放失败，请更换重试！');
      return;
    }
    playerLogic.playerMusic(getMusicModel(index, music));
  }

  MusicModel getMusicModel(int index, Musiclist music) {
    var model = MusicModel();
    model.id = music.id ?? "";
    model.name = music.name ?? "";
    model.author = music.artist ?? "";
    model.duration = int.tryParse(music.duration ?? "0") ?? 0;
    return model;
  }

}
