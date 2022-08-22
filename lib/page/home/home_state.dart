import 'package:flutter/animation.dart';
import 'package:music_box/models/music_model.dart';
import 'package:music_box/models/platform_bean.dart';
import 'package:music_box/page/kg_page.dart';
import 'package:music_box/page/kw/ranking_detail/kw_ranking_detail_view.dart';
import 'package:music_box/page/kw/home/kw_home_view.dart';
import 'package:music_box/page/qq_page.dart';
import 'package:music_box/page/wyy_page.dart';

class HomeState {

  final platformList = [
    PlatformBean('kuWo', page: KwhomePage()),
    PlatformBean('kuGou', page: KGPage()),
    PlatformBean('wyy', page: WYYPage()),
    PlatformBean('qq', page: QQPage())
  ];

}
