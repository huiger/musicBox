import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/common/style/icon_fonts.dart';
import 'package:music_box/models/music_model.dart';
import 'package:music_box/page/player/player_state.dart';
import 'package:music_box/page/player_detail/player_detail_view.dart';
import 'package:music_box/utils/app_colors.dart';
import 'package:music_box/utils/audio_player.dart';
import 'package:music_box/widgets/bottom_sheet.dart';
import 'package:music_box/widgets/full_width_track_shape.dart';

import 'player_logic.dart';

/// 底部播放控制
class PlayerWidget extends StatelessWidget {
  late PlayerLogic _logic;
  late PlayerState _state;
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    _logic = Get.find();
    _state = Get
        .find<PlayerLogic>()
        .state;

    return GetBuilder<PlayerLogic>(
      assignId: true,
      builder: (logic) {
        return InkWell(
          onTap: () {
            _buildBottomSheet();
          },
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(5),
            color: Colors.white,
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      _state.musicModel?.thumbnail ??
                          "http://img4.kuwo.cn/star/albumcover/120/72/14/592971727.jpg",
                      width: 50,
                      height: 50,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// 歌名-歌手
                        Text(
                          '${_state.musicModel?.name ?? ''} - ${_state
                              .musicModel?.author ?? ''}',
                          style: const TextStyle(fontSize: 14),
                          maxLines: 1,
                        ),
                        Expanded(
                            child: Container(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5),
                                child: _buildSlider())),

                        /// 歌词
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                    '-', style: const TextStyle(fontSize: 12))),
                            Text(
                              '${_logic.state.playerCurrentTime} / ${_logic
                                  .state.playerMaxTime}',
                              style: const TextStyle(
                                  color: AppColors.color_cccccc, fontSize: 10),
                            )
                          ],
                        ),
                      ],
                    )),
                const SizedBox(width: 10),
                InkWell(
                  child: AnimatedIcon(
                    icon: AnimatedIcons.pause_play,
                    progress: _logic.ctrl,
                    color: AppColors.color_theme,
                  ),
                  onTap: () {
                    if (_logic.ctrl.status == AnimationStatus.completed) {
                      _logic.ctrl.reverse();
                    } else
                    if (_logic.ctrl.status == AnimationStatus.dismissed) {
                      _logic.ctrl.forward();
                    }
                    AudioPlayerUtil.playerHandle(
                        model: _state.musicModel ?? MusicModel());
                  },
                ),
                IconButton(
                    onPressed: () => _logic.next(),
                    icon: const Icon(IconFonts.player_next,
                        color: AppColors.color_theme),
                    splashColor: Colors.transparent),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSlider() {
    return ValueListenableBuilder<double>(
      valueListenable: _logic.progressNotifier,
      builder: (context, value, child) {
        return SliderTheme(
          data: SliderTheme.of(_context).copyWith(

            /// 滑块大小
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
              trackShape: FullWidthTrackShape(),
              trackHeight: 4),
          child: Slider(
            value: value,
            min: 0.0,
            max: _logic.state.musicModel?.duration.floorToDouble() ?? 100.0,
            inactiveColor: AppColors.color_cccccc,
            onChanged: (val) => _logic.moveSeekbar(val),
          ),
        );
      },
    );
  }

  _buildBottomSheet() {
    if (_logic.state.musicModel == null) return;
    showSheet(_context, PlayerDetailPage(), scrollControlled: true);
  }
}
