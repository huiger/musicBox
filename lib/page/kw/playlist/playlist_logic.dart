import 'package:get/get.dart';
import 'package:music_box/models/kw_clissify.dart';
import 'package:music_box/services/kw_service.dart';

import 'playlist_state.dart';

class PlaylistLogic extends GetxController {
   PlaylistState state = PlaylistState();
   KwService _service = Get.find();

  @override
  void onInit() {


  }

  void getContent(bool isNew) async {
    state.isNew = isNew;
    state.list = await _service.getMusicSet(state.isNew);
    update();
  }
}
