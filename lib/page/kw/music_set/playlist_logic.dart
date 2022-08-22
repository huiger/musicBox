import 'package:get/get.dart';
import 'package:music_box/page/kw/music_set_detail/playlist_detail_view.dart';
import 'package:music_box/services/kw_service.dart';

import 'playlist_state.dart';

class PlaylistLogic extends GetxController {
   PlaylistState state = PlaylistState();
   final KwService _service = Get.find();

  @override
  void onInit() {


  }

  void getContent(bool isNew) async {
    state.isNew = isNew;
    state.list = await _service.getMusicSet(state.isNew);
    update();
  }

  /// 歌单详情
  void jumpPlaylistDetail(String? id){
    Get.to(() => PlaylistDetailPage(), arguments: {'id' : '$id'});
  }
}
