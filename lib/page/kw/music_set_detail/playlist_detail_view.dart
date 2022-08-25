import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:music_box/common/style/icon_fonts.dart';
import 'package:music_box/models/kw_music_set_detail.dart';
import 'package:music_box/models/music_model.dart';
import 'package:music_box/page/kw/music_set_detail/playlist_detail_state.dart';
import 'package:music_box/page/player/player_view.dart';
import 'package:music_box/utils/app_colors.dart';
import 'package:music_box/utils/common_text_style.dart';
import 'package:music_box/widgets/sliver_bottom_widget.dart';

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
      bottom: SliverBottomWidget(),
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
        _buildHeaderInfo(),
      ],
    );
  }

  Widget _buildHeaderInfo(){
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 15, right: 20),
      child: Row(
        children: [
          _state.detail?.pic == null
              ? Container(
            width: 90,
            height: 90,
            color: AppColors.color_999999,
          )
              : ClipRRect(
                  child: Image.network(_state.detail!.pic ?? "",
                      fit: BoxFit.fill, width: 80, height: 80),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _state.detail?.title ?? "title",
                  style: common16WhiteTextStyle,
                ),
                Text(
                  _state.detail?.info ?? "info",
                  maxLines: 3,
                  style: common12White70TextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return SliverFixedExtentList(
      itemExtent: 47.0,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return _buildItem(index, _state.detail?.musiclist?[index]);
      }, childCount: _state.detail?.musiclist?.length ?? 0),
    );
  }

  Widget _buildItem(int index, Musiclist? music) {
    return InkWell(
      onTap: () {
        _logic.playMusic(music);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
            height: 46.0,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                Text('${index + 1}',
                    style: common16C666TextStyle),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        music?.name ?? "",
                        style: common14C333TextStyle,
                        maxLines: 1,
                      ),
                      Text(
                        '${music?.artist} - ${music?.album}',
                        style: common10C999TextStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


}
