import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hot_logic.dart';

class HotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HotLogic());
    final state = Get.find<HotLogic>().state;

    return Container();
  }
}
