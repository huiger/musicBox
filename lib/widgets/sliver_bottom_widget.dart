import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/common/style/icon_fonts.dart';
import 'package:music_box/page/kw/music_set_detail/playlist_detail_logic.dart';
import 'package:music_box/utils/app_colors.dart';
import 'package:music_box/utils/common_text_style.dart';

class SliverBottomWidget extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => const Size.fromHeight(20);

  @override
  Widget build(BuildContext context) {
    var radius = const Radius.circular(10);
    var logic = Get.find<PlaylistDetailLogic>();
    var state = Get.find<PlaylistDetailLogic>().state;

    return GetBuilder<PlaylistDetailLogic>(
        builder: (logic) {
          return InkWell(
            onTap: (){
              logic.playMusicList();
            },
            child: Column(
              children: [
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 10,),
                  decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: radius, topRight: radius)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        IconFonts.player_all, color: AppColors.color_333333,
                        size: 18,),
                      const SizedBox(width: 6,),
                       Text('全部播放(${state.detail?.musiclist?.length ?? 0})', style: common14C333TextStyle),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
