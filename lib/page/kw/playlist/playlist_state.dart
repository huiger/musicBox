import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_box/models/kw_music_set.dart';

class PlaylistState {

  List<KwMusicSetDataBean> list = [];
  bool isNew = true;
  double itemWidth = 0;

  PlaylistState() {
    itemWidth = Get.width / 3;
  }
}
