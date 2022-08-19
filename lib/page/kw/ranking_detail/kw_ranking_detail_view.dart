
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/models/kw_entity.dart';
import 'package:music_box/models/music_model.dart';
import 'package:music_box/page/kw/ranking_detail/kw_ranking_detail_state.dart';
import 'package:music_box/utils/app_colors.dart';

import 'kw_ranking_detail_logic.dart';

/// 酷我
class KwRankingDetailPage extends StatelessWidget {

  late KwRankingDetailLogic logic;
  late KwRankingDetailState state;

  @override
  Widget build(BuildContext context) {
    logic = Get.put(KwRankingDetailLogic());
    state = Get.find<KwRankingDetailLogic>().state;

    return GetBuilder<KwRankingDetailLogic>(builder: (logic) {
      return state.entity == null
          ? Container()
          : ListView.separated(
              itemCount: state.entity?.musiclist?.length ?? 0,
              itemBuilder: (context, index) =>
                  _buildItem(index, state.entity?.musiclist?[index]),
              separatorBuilder: (context, index) => const Divider(),
            );
    });
  }

  Widget _buildItem(int index, Musiclist? music) {
    return InkWell(
      onTap: (){
        logic.playerMusic(getMusicModel(index, music!));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 2, bottom: 2, left: 10),
        width: double.infinity,
        child: Row(
          children: [
            Text('${index + 1}', style: const TextStyle(color: AppColors.color_666666, fontSize: 16)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(music?.name ?? "", style: const TextStyle(color: AppColors.color_333333, fontSize: 14)),
                  const SizedBox(height: 5,),
                  Text('${music?.artist} - ${music?.album}', style: const TextStyle(color: AppColors.color_999999, fontSize: 10)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }



  MusicModel getMusicModel(int index, Musiclist music){
    var model = MusicModel();
    model.id = music.id ?? "";
    model.name = music.name ?? "";
    model.author = music.artist ?? "";
    model.duration = int.tryParse(music.songDuration ?? '0') ?? 0;
    return model;
  }
}