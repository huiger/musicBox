import 'package:flutter/widgets.dart';
import 'package:music_box/page/kw/music_set/playlist_view.dart';
import 'package:music_box/widgets/keep_alive_wrapper.dart';

class KwHomeState {
  late List<String> tabs;
  late List<Widget> pages;

  KwHomeState() {
    tabs = ['最新', '最热'];
    pages = [
      KeepAliveWrapper(child: PlaylistPage(true)),
      KeepAliveWrapper(child: PlaylistPage(false))
    ];
  }
}
