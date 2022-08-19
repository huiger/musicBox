import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ranking_logic.dart';

/// 排行榜
class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(RankingLogic());
    final state = Get.find<RankingLogic>().state;

    return Container();
  }
}
