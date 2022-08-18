
class LyricResponse {
  int status = 0;
  String msg = '';
  LyricData? data;

  LyricResponse.fromJson(dynamic json){
    status = json['status'];
    msg = json['msg'];
    data = LyricData.fromJson(json['data']);
  }
}

class LyricData{
  List<Lyric> lrclList = [];

  LyricData.fromJson(dynamic json){
    if(json['lrclist'] != null){
      lrclList = [];
      json['lrclist'].forEach((e) => {
        lrclList.add(Lyric.fromJson(e))
      });
    }
  }
}

class Lyric {
  String lyric = '';
  Duration? startTime;
  Duration? endTime;
  double offset = 0;

  Lyric(this.lyric, {required this.startTime, required this.endTime, required this.offset});

  Lyric.fromJson(dynamic json){
    lyric = json['lineLyric'];
  }

}

