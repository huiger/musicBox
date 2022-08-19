
import 'dart:collection';

import 'package:get/get.dart';
import 'package:music_box/common/common_url.dart';
import 'package:music_box/models/kw_clissify.dart';
import 'package:music_box/models/kw_entity.dart';
import 'package:music_box/models/kw_music_set.dart';
import 'package:music_box/models/kw_music_set_detail.dart';
import 'package:music_box/models/lyric.dart';
import 'package:music_box/net/request_client.dart';
import 'package:music_box/utils/common_utils.dart';

class KwService extends GetxService{

  final userAgent = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0',
  };

  Future getContent() async {
    Map<String, dynamic> params = HashMap();
    params['from'] = 'pc';
    params['fmt'] = 'json';
    params['pn'] = 0;
    params['rn'] = 100;
    params['type'] = 'bang';
    params['data'] = 'content';
    params['id'] = 286;
    params['show_copyright_off'] = 0;
    params['pcmp4'] = 1;
    params['isbang'] = 1;
    params['_'] = DateTime.now().millisecondsSinceEpoch;

    /// http://kbangserver.kuwo.cn/ksong.s?from=pc&fmt=json&pn=0&rn=100&type=bang&data=content&id=286&show_copyright_off=0&pcmp4=1&isbang=1&_=1660009172573

    return await kuWoRequestClient.get<KwEntity>('http://kbangserver.kuwo.cn/ksong.s', queryParameters: params);
  }

  /// 播放地址
  Future getPlayerUrl(String id) {
    /// http://tm.tempmusic.tk/url/kw/217710574/128k?_=1660551378368
    /// http://www.kuwo.cn/api/v1/www/music/playUrl?mid=${songmid}&type=music&httpsStatus=1
    ///

    // var url = 'http://tm.tempmusic.tk/url/kw/$id/128k';
    // return kuWoRequestClient.get<String>(url, queryParameters: {'_' : CommonUtils.getNowTime()});

    return kuWoRequestClient.get<dynamic>(CommonUrl.kw_player, queryParameters: {'mid':id, 'type' : 'music', 'httpsStatus': 1}, headers: userAgent);
  }

  /// 缩略图
  Future getThumbnailUrl(String id) {
    var params = {
      'corp': 'kuwo',
      'type': 'rid_pic',
      'pictype': 500,
      'size': 500,
      'rid': id,
      '_': CommonUtils.getNowTime(),
    };
    return kuWoRequestClient.get<String>(CommonUrl.kw_thumbnail, queryParameters: params);
  }

  /// 获取歌词
  Future getLrc(String id) {
    /// http://m.kuwo.cn/newh5/singles/songinfoandlrc?musicId=217710574&_=1660551378370
    var params = {
      'musicId' : id,
      '_' : CommonUtils.getNowTime()
    };
    return kuWoRequestClient.get<LyricResponse>(CommonUrl.kw_lrc, queryParameters: params);
  }

  /// 类别
  Future getClassify() async {
    /// http://wapi.kuwo.cn/api/pc/classify/playlist/getTagList?cmd=rcm_keyword_playlist&user=0&prod=kwplayer_pc_9.0.5.0&vipver=9.0.5.0&source=kwplayer_pc_9.0.5.0&loginUid=0&loginSid=0&appUid=76039576&_=1660543293172
    var params = {
      'cmd': 'rcm_keyword_playlist',
      'user': 0,
      'prod': 'kwplayer_pc_9.0.5.0',
      'vipver': '9.0.5.0',
      'source': 'kwplayer_pc_9.0.5.0',
      'source': 'kwplayer_pc_9.0.5.0',
      'loginUid': 0,
      'loginSid': 0,
      'appUid': 76039576,
      '_' : CommonUtils.getNowTime()
    };
    List<dynamic> list = await kuWoRequestClient.get<List<dynamic>>(CommonUrl.kw_new_classify, queryParameters: params) ?? [];
    return list.map((e) => KwClassify.fromMap(e)).toList();
  }

  /// 最热歌单列表
  Future getMusicSet(bool isNew) async {
    /// http://wapi.kuwo.cn/api/pc/classify/playlist/getRcmPlayList?loginUid=0&loginSid=0&appUid=76039576&&pn=1&rn=36&order=hot&_=1660543446163
    var params = {
      'loginUid': 0,
      'loginSid': 0,
      'appUid': 76039576,
      'pn': 1,
      'rn': 36,
      'order': isNew ? 'new' : 'hot',
      '_' : CommonUtils.getNowTime()
    };
    dynamic result = await kuWoRequestClient.get<dynamic>(CommonUrl.kw_music_set, queryParameters: params);
    KwMusicSet set = KwMusicSet.fromJson(result);
    return set.data;
  }

  /// 歌单详情列表
  Future getMusicSetDetail(String id) {
    var params = {
      'op': 'getlistinfo',
      'pid': id,
      'pn': 0,
      'rn': 10000,
      'encode': 'utf8',
      'keyset': 'pl2012',
      'identity': 'kuwo',
      'pcmp4': 1,
      'vipver': 'MUSIC_9.0.5.0_W1',
      'newver': 1,
      '_': CommonUtils.getNowTime()
    };
    return kuWoRequestClient.get<KwMusicSetDetail>(CommonUrl.kw_music_set_list, queryParameters: params);
  }
}