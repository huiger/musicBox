import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'new_logic.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(NewLogic());
    final state = Get.find<NewLogic>().state;

    return Container();
  }
}
