import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/common/style/icon_fonts.dart';
import 'package:music_box/page/home/home_logic.dart';
import 'package:music_box/page/home/home_state.dart';
import 'package:music_box/page/player/player_state.dart';
import 'package:music_box/utils/app_colors.dart';
import 'package:music_box/utils/audio_player.dart';

import 'player_logic.dart';

class PlayerPage extends StatelessWidget {
  late final PlayerLogic _logic;
  late final PlayerState _state;
  late final HomeLogic _homeLogic;

  @override
  Widget build(BuildContext context) {
    _logic = Get.put(PlayerLogic());
    _state = Get.find<PlayerLogic>().state;
    _homeLogic = Get.find<HomeLogic>();

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
    return Stack(
      children: [
        ConstrainedBox(
            child: Image.network(
              _homeLogic.state.musicModel!.thumbnail,
              fit: BoxFit.cover,
            ),
            constraints: const BoxConstraints.expand()),

        Container(
          color: AppColors.color_4C000000,
        )
      ],
    );
  }

  /// 顶部
  Widget _buildHeader() {
    return GetBuilder<HomeLogic>(
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
                      Text("${_homeLogic.state.musicModel?.name}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14)),
                      Text("${_homeLogic.state.musicModel?.author}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12)),
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
      child: GetBuilder<PlayerLogic>(
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
                        child: _state.lrcVisible ? ListView(
                          controller: _logic.scrollController,
                          physics: currentHeight != _state.totalHeight
                              ? const NeverScrollableScrollPhysics()
                              : const ClampingScrollPhysics(),
                          children: [
                            Text(
                                '测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试'),
                            Text(
                                '测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试'),
                            Text(
                                '测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试'),
                            Text(
                                '测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试'),
                            Text(
                                '测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试\n测试'),
                          ],
                        ) : Container(color: Colors.transparent, )));
              },
            ),
          );
        },
      ),
    );
  }

  /// 底部
  Widget _buildBottom() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100,
        color: AppColors.color_4C000000,
        child: Row(
          children: [
            const SizedBox(width: 70),
            InkWell(
              child: const Icon(
                IconFonts.player_prev,
                color: Colors.white,
                size: 25,
              ),
              onTap: () {
                AudioPlayerUtil.previousMusic();
              },
            ),
            Expanded(
                child: InkWell(
                  child: const Icon(
                    IconFonts.player_play,
                    color: Colors.white,
                    size: 40,
                  ),
                  onTap: () {
                    AudioPlayerUtil.previousMusic();
                  },
                ),
                flex: 1),
            InkWell(
              child: const Icon(
                IconFonts.player_next,
                color: Colors.white,
                size: 25,
              ),
              onTap: () {
                AudioPlayerUtil.nextMusic();
              },
            ),
            const SizedBox(width: 70),
          ],
        ),
      ),
    );
  }
}
