
import 'dart:collection';

import 'package:get/get.dart';
import 'package:music_box/models/kw_entity.dart';
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

    var url = 'http://www.kuwo.cn/api/v1/www/music/playUrl';
    return kuWoRequestClient.get<dynamic>(url, queryParameters: {'mid':id, 'type' : 'music', 'httpsStatus': 1}, headers: userAgent);
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
    return kuWoRequestClient.get<String>('http://artistpicserver.kuwo.cn/pic.web', queryParameters: params);
  }

  /// 获取歌词
  Future getLrc(String id) {
    /// http://m.kuwo.cn/newh5/singles/songinfoandlrc?musicId=217710574&_=1660551378370
    var params = {
      'musicId' : id,
      '_' : CommonUtils.getNowTime()
    };
    return kuWoRequestClient.get<LyricResponse>('http://m.kuwo.cn/newh5/singles/songinfoandlrc', queryParameters: params);
  }
}