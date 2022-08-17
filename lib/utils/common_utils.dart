import 'dart:math';
import 'dart:ui';

class CommonUtils{

  /// 获取随机色值
  static getRandomColor(){
    return Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
  }

  static addNumber(a, b) {
    int aInt = (a * 100).floor();
    int bInt = (b * 100).floor();
    return (aInt + bInt) / 100;
  }

  /// 当前时间戳
  static int getNowTime(){
    return DateTime.now().millisecondsSinceEpoch;
  }


  /// 酷我播放地址
  static String getKwPlayerUrl(String id){
    return "http://tm.tempmusic.tk/url/kw/$id/128k?_=${getNowTime()}";
  }

  /// 酷我海报
  static String getKwPlayerAlbum(String id) {
    return 'http://artistpicserver.kuwo.cn/pic.web?corp=kuwo&type=rid_pic&pictype=500&size=500&rid=$id&_=${getNowTime()}';
  }

  static String getPlayerTimes(int current, int max){
    return '${_parseTime(current)} / ${_parseTime(max)}';
  }

  static String _parseTime(int time){
    var h = (time / 60).toStringAsFixed(1);
    var s = (time % 60).toStringAsFixed(1);
    return '${h.substring(0, h.lastIndexOf('.')).padLeft(2, '0')}:${s.substring(0, s.lastIndexOf('.')).padLeft(2, '0')}';
  }
}