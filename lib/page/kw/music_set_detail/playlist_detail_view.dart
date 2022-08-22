import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/models/kw_music_set_detail.dart';
import 'package:music_box/models/music_model.dart';
import 'package:music_box/page/kw/music_set_detail/playlist_detail_state.dart';
import 'package:music_box/page/player/player_view.dart';
import 'package:music_box/utils/app_colors.dart';
import 'package:music_box/utils/common_text_style.dart';

import 'playlist_detail_logic.dart';

/// 歌单详情列表
class PlaylistDetailPage extends StatelessWidget {
  late final PlaylistDetailLogic _logic;
  late final PlaylistDetailState _state;

  @override
  Widget build(BuildContext context) {
    _logic = Get.put(PlaylistDetailLogic());
    _state = Get.find<PlaylistDetailLogic>().state;

    return GetBuilder<PlaylistDetailLogic>(
      assignId: true,
      builder: (logic) {
        if (_state.detail == null) {
          return Container();
        }
        return Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [_buildSliverAppBar(), _buildList()],
              ),
            ),
            PlayerWidget()
          ],
        );
      },
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new)),
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: _buildHeader(),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        ConstrainedBox(
            child: Image.network(
              _state.detail!.pic ?? "",
              fit: BoxFit.cover,
            ),
            constraints: const BoxConstraints.expand()),
        Container(
          color: AppColors.color_70000000,
        ),
        Container(
          margin: const EdgeInsets.only(top: 40, left: 15, right: 20),
          child: Row(
            children: [
              _state.detail?.pic == null
                  ? Container(
                      width: 90,
                      height: 90,
                      color: AppColors.color_999999,
                    )
                  : Image.network(_state.detail!.pic ?? "",
                      fit: BoxFit.fill, width: 80, height: 80),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _state.detail?.title ?? "title",
                      style: commonWhiteTextStyle,
                    ),
                    Text(
                      _state.detail?.info ?? "info",
                      maxLines: 3,
                      style: common12White70TextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildList() {
    return SliverFixedExtentList(
      itemExtent: 45.0,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return _buildItem(index, _state.detail?.musiclist?[index]);
      }, childCount: _state.detail?.musiclist?.length ?? 0),
    );
  }

  Widget _buildItem(int index, Musiclist? music) {
    return InkWell(
      onTap: () {
        _logic.playMusic(index, music);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 2, bottom: 2, left: 10),
            width: double.infinity,
            child: Row(
              children: [
                Text('${index + 1}',
                    style: const TextStyle(
                        color: AppColors.color_666666, fontSize: 16)),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(music?.name ?? "",
                          style: const TextStyle(
                              color: AppColors.color_333333, fontSize: 14)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${music?.artist} - ${music?.album}',
                        style: const TextStyle(
                            color: AppColors.color_999999, fontSize: 10),
                        maxLines: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(height: 0.7)
        ],
      ),
    );
  }


}
