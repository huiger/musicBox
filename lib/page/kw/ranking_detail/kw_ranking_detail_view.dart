
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_box/models/kw_entity.dart';
import 'package:music_box/models/music_model.dart';
import 'package:music_box/page/kw/ranking_detail/kw_ranking_detail_state.dart';
import 'package:music_box/utils/common_text_style.dart';

import 'kw_ranking_detail_logic.dart';

/// 排行榜详情列表
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
        logic.playerService.playerMusic(getMusicModel(index, music!));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 2, bottom: 2, left: 10),
        width: double.infinity,
        child: Row(
          children: [
            Text('${index + 1}', style: common16C666TextStyle),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(music?.name ?? "", style: common14C333TextStyle),
                  const SizedBox(height: 5,),
                  Text('${music?.artist} - ${music?.album}', style: common10C999TextStyle),
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
