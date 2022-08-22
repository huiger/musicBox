
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:music_box/page/home/home_logic.dart';
import 'package:music_box/page/home/home_view.dart';
import 'package:music_box/services/kw_service.dart';
import 'package:music_box/services/player_service.dart';
import 'package:music_box/utils/app_colors.dart';
import 'package:music_box/utils/sp_util.dart';


void main() async {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: AppColors.color_theme);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();

  await initServices();

  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() async => KwService());//API
  await Get.putAsync(() async => PlayerService());
  await Get.putAsync(() async => HomeLogic(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MUSIC BOX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent, /// 点击时的高亮效果设置为透明
        highlightColor: Colors.transparent, /// 长按时的扩散效果设置为透明
      ),
      builder: EasyLoading.init(),
      home: HomePage(),
    );
  }


}

