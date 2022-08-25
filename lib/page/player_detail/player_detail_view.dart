
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/common/style/icon_fonts.dart';
import 'package:music_box/models/music_model.dart';
import 'package:music_box/page/player/player_logic.dart';
import 'package:music_box/page/player_detail/player_detail_state.dart';
import 'package:music_box/utils/app_colors.dart';
import 'package:music_box/utils/audio_player.dart';
import 'package:music_box/utils/common_text_style.dart';
import 'package:music_box/widgets/full_width_track_shape.dart';

import 'player_detail_logic.dart';

/// 播放详情
class PlayerDetailPage extends StatelessWidget {
  late PlayerDetailLogic _logic;
  late PlayerDetailState _state;
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    _logic = Get.put(PlayerDetailLogic());
    _state = Get.find<PlayerDetailLogic>().state;

    return Stack(
      children: [
        _buildBackground(),
        Column(
          children: [
            _buildHeader(),
            _buildContent(),
            _buildBottom(),
          ],
        )
      ],
    );
  }

  Widget _buildBackground() {
    return GetBuilder<PlayerLogic>(
      assignId: true,
      builder: (logic) {
        return Stack(
          children: [
            ConstrainedBox(
                child: Image.network(
                  _logic.playerLogic.state.musicModel!.thumbnail,
                  fit: BoxFit.cover,
                ),
                constraints: const BoxConstraints.expand()),
            Container(
              color: AppColors.color_30000000,
            )
          ],
        );
      },
    );
  }

  /// 顶部
  Widget _buildHeader() {
    return GetBuilder<PlayerDetailLogic>(
      assignId: true,
      builder: (logic) {
        return Container(
          height: 45,
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: InkWell(
            onTap: () => Get.back(),
            child: Stack(
              children: [
                const Icon(
                  IconFonts.xiala,
                  color: Colors.white,
                ),
                Center(
                  child: Column(
                    children: [
                      Text("${_logic.playerLogic.state.musicModel?.name}",
                          style: common14WhiteTextStyle),
                      Text("${_logic.playerLogic.state.musicModel?.author}",
                          style: common12WhiteTextStyle),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  /// 中间主体
  Widget _buildContent() {
    return Expanded(
      child: GetBuilder<PlayerDetailLogic>(
        id: 'lrc',
        assignId: true,
        builder: (logic) {
          return GestureDetector(
            onTap: () => _logic.changeLrcVisible(),
            child: StreamBuilder<double>(
              stream: _logic.streamController.stream,
              initialData: _state.totalHeight,
              builder: (context, snapshot) {
                double currentHeight = snapshot.data ?? _state.totalHeight;
                return AnimatedContainer(
                    duration: const Duration(milliseconds: 30),
                    height: currentHeight,
                    child: Listener(
                        onPointerMove: (event) {
                          // 触摸事件过程 手指一直在屏幕上且发生距离滑动
                          if (_logic.scrollController.offset != 0) {
                            // 只有列表滚动到顶部时才触发下拉动画效果
                            print(
                                "onPointerMove:${_logic.scrollController.offset}");
                            return;
                          }
                          double distance =
                              event.position.dy - _state.pointerDy;
                          if (distance.abs() > 0) {
                            // 获取手指滑动的距离，计算弹框实时高度，并发送事件
                            double _currentHeight =
                                _state.totalHeight - distance;
                            if (_currentHeight > _state.totalHeight) {
                              return;
                            }
                            _logic.streamController.sink.add(_currentHeight);
                          }
                        },
                        onPointerUp: (event) {
                          // 触摸事件结束 手指离开屏幕
                          // 这里认为滑动超过一半就认为用户要退出了，值可以根据实际体验修改
                          if (currentHeight < (_state.totalHeight * 0.5)) {
                            Get.back();
                          } else {
                            _logic.streamController.sink
                                .add(_state.totalHeight);
                          }
                        },
                        onPointerDown: (event) {
                          // 触摸事件开始 手指开始接触屏幕
                          _state.pointerDy = event.position.dy +
                              _logic.scrollController.offset;
                        },
                        child: _state.lrcVisible
                            ? ListView(
                                controller: _logic.scrollController,
                                physics: currentHeight != _state.totalHeight
                                    ? const NeverScrollableScrollPhysics()
                                    : const ClampingScrollPhysics(),
                                children: _buildItem(),
                              )
                            : Container(
                                color: Colors.transparent,
                              )));
              },
            ),
          );
        },
      ),
    );
  }

  /// 歌词
  List<Widget> _buildItem() {
    List<Widget> items = [];
    items.add(const SizedBox(height: 15,));
    if (_state.lrcList.isEmpty) {
      items.add(Container(
        color: Colors.transparent,
      ));
    } else {
      for (var value in _state.lrcList) {
        items.add(Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            child: Center(
                child: Text(value.lyric, style: common14WhiteTextStyle))));
      }
      items.add(const SizedBox(height: 15,));
    }
    return items;
  }

  /// 底部
  Widget _buildBottom() {
    return Container(
      height: 100,
      color: AppColors.color_30000000,
      child: Column(
        children: [
          _buildScrollBar(),
          Row(
            children: [
              const SizedBox(width: 70),
              InkWell(
                child: const Icon(
                  IconFonts.player_prev,
                  color: Colors.white,
                  size: 25,
                ),
                onTap: () {
                  _logic.playerLogic.prev();
                },
              ),
              Expanded(
                child: Center(
                  child: InkWell(
                    child: AnimatedIcon(
                      icon: AnimatedIcons.pause_play,
                      progress: _logic.playerLogic.ctrl,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: () {
                      if (_logic.playerLogic.ctrl.status ==
                          AnimationStatus.completed) {
                        _logic.playerLogic.ctrl.reverse();
                      } else if (_logic.playerLogic.ctrl.status ==
                          AnimationStatus.dismissed) {
                        _logic.playerLogic.ctrl.forward();
                      }
                      AudioPlayerUtil.playerHandle(
                          model: _logic.playerLogic.state.musicModel ??
                              MusicModel());
                    },
                  ),
                ),
                flex: 1,
              ),
              InkWell(
                child: const Icon(
                  IconFonts.player_next,
                  color: Colors.white,
                  size: 25,
                ),
                onTap: () {
                  _logic.playerLogic.next();
                },
              ),
              const SizedBox(width: 70),
            ],
          ),
        ],
      ),
    );
  }

  /// 进度条
  Widget _buildScrollBar() {
    return GetBuilder<PlayerLogic>(builder: (logic) {
      return Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(_logic.playerLogic.state.playerCurrentTime,
              style: common12WhiteTextStyle),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: _buildSlider())),
          const SizedBox(
            width: 10,
          ),
          Text(_logic.playerLogic.state.playerMaxTime,
              style: common12WhiteTextStyle),
          const SizedBox(
            width: 10,
          ),
        ],
      );
    });
  }

  /// 播放进度
  Widget _buildSlider() {
    return ValueListenableBuilder<double>(
      valueListenable: _logic.playerLogic.progressNotifier,
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
            max: _logic.playerLogic.state.musicModel?.duration.floorToDouble() ??
                100.0,
            inactiveColor: AppColors.color_cccccc,
            onChanged: (val) => _logic.playerLogic.moveSeekbar(val),
          ),
        );
      },
    );
  }
}
