import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/models/music_model.dart';
import 'package:music_box/page/home/home_logic.dart';
import 'package:music_box/page/home/home_state.dart';
import 'package:music_box/page/kw/kw_service.dart';
import 'package:music_box/page/kw/kw_state.dart';
import 'package:music_box/utils/audio_player.dart';


class KwLogic extends GetxController {
  final KwState state = KwState();
  final KwService service = Get.find();
  final HomeLogic homeLogic = Get.find();

  @override
  void onInit() async {
    super.onInit();
    state.entity = await service.getContent();
    update();
  }

  void playerMusic(MusicModel model) async {
    dynamic result = await service.getPlayerUrl(model.id);
    model.url = result['url'];
    model.thumbnail = await service.getThumbnailUrl(model.id);

    debugPrint("playerUrl = ${model.url}");

    AudioPlayerUtil.playerHandle(model: model);
    homeLogic.updatePlayer(model);
  }
}
