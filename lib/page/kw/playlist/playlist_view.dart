import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/models/kw_clissify.dart';
import 'package:music_box/models/kw_music_set.dart';
import 'package:music_box/page/kw/playlist/playlist_state.dart';
import 'package:music_box/utils/common_text_style.dart';

import 'playlist_logic.dart';

/// 歌单
class PlaylistPage extends StatelessWidget {
  bool isNew;

  late PlaylistLogic _logic;
  late PlaylistState _state;

  PlaylistPage(this.isNew);

  @override
  Widget build(BuildContext context) {
    _logic = Get.put(PlaylistLogic(), tag: '$isNew');
    _state = Get.find<PlaylistLogic>(tag: '$isNew').state;
    _logic.getContent(isNew);

    return GetBuilder<PlaylistLogic>(
      tag: '$isNew',
      builder: (controller) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
        ),
        itemCount: _state.list.length,
        itemBuilder: (context, index) {
          return _buildItem(index);
        },
      ),
    );
  }

  Widget _buildItem(int index) {
    KwMusicSetDataBean date = _state.list[index];
    return Column(
      children: [
        ClipRRect(
          child: Image.network(date.img ?? "", width: _state.itemWidth - 15),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        const SizedBox(
          height: 2,
        ),
        Container(
          child: Center(
              child: Text(
            date.name ?? "",
            style: common10TextStyle,
            maxLines: 1,
          )),
          padding: const EdgeInsets.only(left: 8, right: 8),
        )
      ],
    );
  }
}
