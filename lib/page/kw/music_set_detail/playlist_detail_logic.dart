import 'package:get/get.dart';
import 'package:music_box/models/kw_music_set_detail.dart';
import 'package:music_box/page/home/home_logic.dart';
import 'package:music_box/services/kw_service.dart';

import 'playlist_detail_state.dart';

class PlaylistDetailLogic extends GetxController {
  final PlaylistDetailState state = PlaylistDetailState();
  final KwService _service = Get.find();
  final HomeLogic homeLogic = Get.find();


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

}
