import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PlayerState {

  /// 列表弹起的正常高度
  double totalHeight = 0;

  /// 记录手指按下的位置
  double pointerDy = 0;

  /// 歌词显示状态
  bool lrcVisible = true;

  PlayerState() {
    totalHeight = Get.height;

  }
}
