import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/models/music_model.dart';
import 'package:music_box/page/home/home_logic.dart';
import 'package:music_box/page/kw/ranking_detail/kw_ranking_detail_state.dart';
import 'package:music_box/page/player/player_logic.dart';
import 'package:music_box/services/kw_service.dart';
import 'package:music_box/services/player_service.dart';
import 'package:music_box/utils/audio_player.dart';


class KwRankingDetailLogic extends GetxController {
  final KwRankingDetailState state = KwRankingDetailState();
  final KwService service = Get.find();
  final PlayerLogic playerLogic = Get.find();

  @override
  void onInit() async {
    super.onInit();
    state.entity = await service.getContent();
    update();
  }
}
