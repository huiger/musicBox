import 'package:flutter/animation.dart';
import 'package:music_box/models/music_model.dart';
import 'package:music_box/models/platform_bean.dart';
import 'package:music_box/page/kg_page.dart';
import 'package:music_box/page/kw/kw_view.dart';
import 'package:music_box/page/qq_page.dart';
import 'package:music_box/page/wyy_page.dart';

class HomeState {

  final platformList = [
    PlatformBean('kuWo', page: KwPage()),
    PlatformBean('kuGou', page: KGPage()),
    PlatformBean('wyy', page: WYYPage()),
    PlatformBean('qq', page: QQPage())
  ];

  MusicModel? musicModel;

  String playerTime = '00:00 / 00:00';

}