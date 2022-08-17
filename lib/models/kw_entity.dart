
class KwEntity {
  KwEntity({
      String? name,
      String? leader,
      String? term,
      String? info,
      String? pic,
      String? pub,
      String? timestamp,
      String? num,
      String? v9Pic2,
      String? type,
      List<Musiclist>? musiclist,
      String? currentVolume,}){
    _name = name;
    _leader = leader;
    _term = term;
    _info = info;
    _pic = pic;
    _pub = pub;
    _timestamp = timestamp;
    _num = num;
    _v9Pic2 = v9Pic2;
    _type = type;
    _musiclist = musiclist;
    _currentVolume = currentVolume;
}

  KwEntity.fromJson(dynamic json) {
    _name = json['name'];
    _leader = json['leader'];
    _term = json['term'];
    _info = json['info'];
    _pic = json['pic'];
    _pub = json['pub'];
    _timestamp = json['timestamp'];
    _num = json['num'];
    _v9Pic2 = json['v9_pic2'];
    _type = json['type'];
    if (json['musiclist'] != null) {
      _musiclist = [];
      json['musiclist'].forEach((v) {
        _musiclist?.add(Musiclist.fromJson(v));
      });
    }
    _currentVolume = json['currentVolume'];
  }
  String? _name;
  String? _leader;
  String? _term;
  String? _info;
  String? _pic;
  String? _pub;
  String? _timestamp;
  String? _num;
  String? _v9Pic2;
  String? _type;
  List<Musiclist>? _musiclist;
  String? _currentVolume;
KwEntity copyWith({  String? name,
  String? leader,
  String? term,
  String? info,
  String? pic,
  String? pub,
  String? timestamp,
  String? num,
  String? v9Pic2,
  String? type,
  List<Musiclist>? musiclist,
  String? currentVolume,
}) => KwEntity(  name: name ?? _name,
  leader: leader ?? _leader,
  term: term ?? _term,
  info: info ?? _info,
  pic: pic ?? _pic,
  pub: pub ?? _pub,
  timestamp: timestamp ?? _timestamp,
  num: num ?? _num,
  v9Pic2: v9Pic2 ?? _v9Pic2,
  type: type ?? _type,
  musiclist: musiclist ?? _musiclist,
  currentVolume: currentVolume ?? _currentVolume,
);
  String? get name => _name;
  String? get leader => _leader;
  String? get term => _term;
  String? get info => _info;
  String? get pic => _pic;
  String? get pub => _pub;
  String? get timestamp => _timestamp;
  String? get num => _num;
  String? get v9Pic2 => _v9Pic2;
  String? get type => _type;
  List<Musiclist>? get musiclist => _musiclist;
  String? get currentVolume => _currentVolume;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['leader'] = _leader;
    map['term'] = _term;
    map['info'] = _info;
    map['pic'] = _pic;
    map['pub'] = _pub;
    map['timestamp'] = _timestamp;
    map['num'] = _num;
    map['v9_pic2'] = _v9Pic2;
    map['type'] = _type;
    if (_musiclist != null) {
      map['musiclist'] = _musiclist?.map((v) => v.toJson()).toList();
    }
    map['currentVolume'] = _currentVolume;
    return map;
  }

}

/// id : "229142130"
/// name : "最后一堂课"
/// artist : "周兴哲"
/// artistid : "196078"
/// album : "最后一堂课"
/// albumid : "30104500"
/// score100 : "0"
/// formats : "WMA96|WMA128|MP3H|MP3192|MP3128|HIRFLAC|ALFLAC|AL|AAC48|AAC24|MV700|MV500|MP4UL|MP4L|MP4HV|MP4BD|MP4|EXMV700|EXMV500|EXMP4UL|EXMP4L|EXMP4HV|EXMP4BD|EXMP4"
/// mp4sig1 : 4173630525
/// mp4sig2 : 2606288338
/// param : "最后一堂课;周兴哲;最后一堂课;2642015922;3442532596;MUSIC_229142130;1701840732;3229852124;MP3_229142130;2502881575;3579391892;MV_4058875;0"
/// ispoint : "0"
/// mutiver : "0"
/// pay : "16515324"
/// online : "1"
/// copyright : "0"
/// rank_change : "2"
/// isnew : "0"
/// duration : "2"
/// highest_rank : "1"
/// score : "0"
/// transsongname : ""
/// aartist : "Eric"
/// opay : "0"
/// tpay : "0"
/// overseas_pay : "16711935"
/// overseas_copyright : "7ffff17ffffffffffffffbfffff7fffffffffffffdfffffffbfffff"
/// song_duration : "278"
/// payInfo : {"cannotOnlinePlay":"0","cannotDownload":"0","download":"1111","feeType":{"album":"0","bookvip":"0","song":"1","vip":"1"},"listen_fragment":"0","local_encrypt":"1","play":"1100","tips_intercept":"0"}
/// mvpayinfo : {"download":"0","play":"0","vid":"15978786"}
/// audiobookpayinfo : {"download":"0","play":"0"}
/// nationid : ""
/// fpay : "1"
/// isdownload : "0"
/// trend : "u0"

class Musiclist {
  Musiclist({
      String? id,
      String? name,
      String? artist,
      String? artistid,
      String? album,
      String? albumid,
      String? score100,
      String? formats,
      num? mp4sig1,
      num? mp4sig2,
      String? param,
      String? ispoint,
      String? mutiver,
      String? pay,
      String? online,
      String? copyright,
      String? rankChange,
      String? isnew,
      String? duration,
      String? highestRank,
      String? score,
      String? transsongname,
      String? aartist,
      String? opay,
      String? tpay,
      String? overseasPay,
      String? overseasCopyright,
      String? songDuration,
      PayInfo? payInfo,
      Mvpayinfo? mvpayinfo,
      Audiobookpayinfo? audiobookpayinfo,
      String? nationid,
      String? fpay,
      String? isdownload,
      String? trend,}){
    _id = id;
    _name = name;
    _artist = artist;
    _artistid = artistid;
    _album = album;
    _albumid = albumid;
    _score100 = score100;
    _formats = formats;
    _mp4sig1 = mp4sig1;
    _mp4sig2 = mp4sig2;
    _param = param;
    _ispoint = ispoint;
    _mutiver = mutiver;
    _pay = pay;
    _online = online;
    _copyright = copyright;
    _rankChange = rankChange;
    _isnew = isnew;
    _duration = duration;
    _highestRank = highestRank;
    _score = score;
    _transsongname = transsongname;
    _aartist = aartist;
    _opay = opay;
    _tpay = tpay;
    _overseasPay = overseasPay;
    _overseasCopyright = overseasCopyright;
    _songDuration = songDuration;
    _payInfo = payInfo;
    _mvpayinfo = mvpayinfo;
    _audiobookpayinfo = audiobookpayinfo;
    _nationid = nationid;
    _fpay = fpay;
    _isdownload = isdownload;
    _trend = trend;
}

  Musiclist.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _artist = json['artist'];
    _artistid = json['artistid'];
    _album = json['album'];
    _albumid = json['albumid'];
    _score100 = json['score100'];
    _formats = json['formats'];
    _mp4sig1 = json['mp4sig1'];
    _mp4sig2 = json['mp4sig2'];
    _param = json['param'];
    _ispoint = json['ispoint'];
    _mutiver = json['mutiver'];
    _pay = json['pay'];
    _online = json['online'];
    _copyright = json['copyright'];
    _rankChange = json['rank_change'];
    _isnew = json['isnew'];
    _duration = json['duration'];
    _highestRank = json['highest_rank'];
    _score = json['score'];
    _transsongname = json['transsongname'];
    _aartist = json['aartist'];
    _opay = json['opay'];
    _tpay = json['tpay'];
    _overseasPay = json['overseas_pay'];
    _overseasCopyright = json['overseas_copyright'];
    _songDuration = json['song_duration'];
    _payInfo = json['payInfo'] != null ? PayInfo.fromJson(json['payInfo']) : null;
    _mvpayinfo = json['mvpayinfo'] != null ? Mvpayinfo.fromJson(json['mvpayinfo']) : null;
    _audiobookpayinfo = json['audiobookpayinfo'] != null ? Audiobookpayinfo.fromJson(json['audiobookpayinfo']) : null;
    _nationid = json['nationid'];
    _fpay = json['fpay'];
    _isdownload = json['isdownload'];
    _trend = json['trend'];
  }
  String? _id;
  String? _name;
  String? _artist;
  String? _artistid;
  String? _album;
  String? _albumid;
  String? _score100;
  String? _formats;
  num? _mp4sig1;
  num? _mp4sig2;
  String? _param;
  String? _ispoint;
  String? _mutiver;
  String? _pay;
  String? _online;
  String? _copyright;
  String? _rankChange;
  String? _isnew;
  String? _duration;
  String? _highestRank;
  String? _score;
  String? _transsongname;
  String? _aartist;
  String? _opay;
  String? _tpay;
  String? _overseasPay;
  String? _overseasCopyright;
  String? _songDuration;
  PayInfo? _payInfo;
  Mvpayinfo? _mvpayinfo;
  Audiobookpayinfo? _audiobookpayinfo;
  String? _nationid;
  String? _fpay;
  String? _isdownload;
  String? _trend;
Musiclist copyWith({  String? id,
  String? name,
  String? artist,
  String? artistid,
  String? album,
  String? albumid,
  String? score100,
  String? formats,
  num? mp4sig1,
  num? mp4sig2,
  String? param,
  String? ispoint,
  String? mutiver,
  String? pay,
  String? online,
  String? copyright,
  String? rankChange,
  String? isnew,
  String? duration,
  String? highestRank,
  String? score,
  String? transsongname,
  String? aartist,
  String? opay,
  String? tpay,
  String? overseasPay,
  String? overseasCopyright,
  String? songDuration,
  PayInfo? payInfo,
  Mvpayinfo? mvpayinfo,
  Audiobookpayinfo? audiobookpayinfo,
  String? nationid,
  String? fpay,
  String? isdownload,
  String? trend,
}) => Musiclist(  id: id ?? _id,
  name: name ?? _name,
  artist: artist ?? _artist,
  artistid: artistid ?? _artistid,
  album: album ?? _album,
  albumid: albumid ?? _albumid,
  score100: score100 ?? _score100,
  formats: formats ?? _formats,
  mp4sig1: mp4sig1 ?? _mp4sig1,
  mp4sig2: mp4sig2 ?? _mp4sig2,
  param: param ?? _param,
  ispoint: ispoint ?? _ispoint,
  mutiver: mutiver ?? _mutiver,
  pay: pay ?? _pay,
  online: online ?? _online,
  copyright: copyright ?? _copyright,
  rankChange: rankChange ?? _rankChange,
  isnew: isnew ?? _isnew,
  duration: duration ?? _duration,
  highestRank: highestRank ?? _highestRank,
  score: score ?? _score,
  transsongname: transsongname ?? _transsongname,
  aartist: aartist ?? _aartist,
  opay: opay ?? _opay,
  tpay: tpay ?? _tpay,
  overseasPay: overseasPay ?? _overseasPay,
  overseasCopyright: overseasCopyright ?? _overseasCopyright,
  songDuration: songDuration ?? _songDuration,
  payInfo: payInfo ?? _payInfo,
  mvpayinfo: mvpayinfo ?? _mvpayinfo,
  audiobookpayinfo: audiobookpayinfo ?? _audiobookpayinfo,
  nationid: nationid ?? _nationid,
  fpay: fpay ?? _fpay,
  isdownload: isdownload ?? _isdownload,
  trend: trend ?? _trend,
);
  String? get id => _id;
  String? get name => _name;
  String? get artist => _artist;
  String? get artistid => _artistid;
  String? get album => _album;
  String? get albumid => _albumid;
  String? get score100 => _score100;
  String? get formats => _formats;
  num? get mp4sig1 => _mp4sig1;
  num? get mp4sig2 => _mp4sig2;
  String? get param => _param;
  String? get ispoint => _ispoint;
  String? get mutiver => _mutiver;
  String? get pay => _pay;
  String? get online => _online;
  String? get copyright => _copyright;
  String? get rankChange => _rankChange;
  String? get isnew => _isnew;
  String? get duration => _duration;
  String? get highestRank => _highestRank;
  String? get score => _score;
  String? get transsongname => _transsongname;
  String? get aartist => _aartist;
  String? get opay => _opay;
  String? get tpay => _tpay;
  String? get overseasPay => _overseasPay;
  String? get overseasCopyright => _overseasCopyright;
  String? get songDuration => _songDuration;
  PayInfo? get payInfo => _payInfo;
  Mvpayinfo? get mvpayinfo => _mvpayinfo;
  Audiobookpayinfo? get audiobookpayinfo => _audiobookpayinfo;
  String? get nationid => _nationid;
  String? get fpay => _fpay;
  String? get isdownload => _isdownload;
  String? get trend => _trend;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['artist'] = _artist;
    map['artistid'] = _artistid;
    map['album'] = _album;
    map['albumid'] = _albumid;
    map['score100'] = _score100;
    map['formats'] = _formats;
    map['mp4sig1'] = _mp4sig1;
    map['mp4sig2'] = _mp4sig2;
    map['param'] = _param;
    map['ispoint'] = _ispoint;
    map['mutiver'] = _mutiver;
    map['pay'] = _pay;
    map['online'] = _online;
    map['copyright'] = _copyright;
    map['rank_change'] = _rankChange;
    map['isnew'] = _isnew;
    map['duration'] = _duration;
    map['highest_rank'] = _highestRank;
    map['score'] = _score;
    map['transsongname'] = _transsongname;
    map['aartist'] = _aartist;
    map['opay'] = _opay;
    map['tpay'] = _tpay;
    map['overseas_pay'] = _overseasPay;
    map['overseas_copyright'] = _overseasCopyright;
    map['song_duration'] = _songDuration;
    if (_payInfo != null) {
      map['payInfo'] = _payInfo?.toJson();
    }
    if (_mvpayinfo != null) {
      map['mvpayinfo'] = _mvpayinfo?.toJson();
    }
    if (_audiobookpayinfo != null) {
      map['audiobookpayinfo'] = _audiobookpayinfo?.toJson();
    }
    map['nationid'] = _nationid;
    map['fpay'] = _fpay;
    map['isdownload'] = _isdownload;
    map['trend'] = _trend;
    return map;
  }

}

/// download : "0"
/// play : "0"

class Audiobookpayinfo {
  Audiobookpayinfo({
      String? download,
      String? play,}){
    _download = download;
    _play = play;
}

  Audiobookpayinfo.fromJson(dynamic json) {
    _download = json['download'];
    _play = json['play'];
  }
  String? _download;
  String? _play;
Audiobookpayinfo copyWith({  String? download,
  String? play,
}) => Audiobookpayinfo(  download: download ?? _download,
  play: play ?? _play,
);
  String? get download => _download;
  String? get play => _play;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['download'] = _download;
    map['play'] = _play;
    return map;
  }

}

/// download : "0"
/// play : "0"
/// vid : "15978786"

class Mvpayinfo {
  Mvpayinfo({
      String? download,
      String? play,
      String? vid,}){
    _download = download;
    _play = play;
    _vid = vid;
}

  Mvpayinfo.fromJson(dynamic json) {
    _download = json['download'];
    _play = json['play'];
    _vid = json['vid'];
  }
  String? _download;
  String? _play;
  String? _vid;
Mvpayinfo copyWith({  String? download,
  String? play,
  String? vid,
}) => Mvpayinfo(  download: download ?? _download,
  play: play ?? _play,
  vid: vid ?? _vid,
);
  String? get download => _download;
  String? get play => _play;
  String? get vid => _vid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['download'] = _download;
    map['play'] = _play;
    map['vid'] = _vid;
    return map;
  }

}

/// cannotOnlinePlay : "0"
/// cannotDownload : "0"
/// download : "1111"
/// feeType : {"album":"0","bookvip":"0","song":"1","vip":"1"}
/// listen_fragment : "0"
/// local_encrypt : "1"
/// play : "1100"
/// tips_intercept : "0"

class PayInfo {
  PayInfo({
      String? cannotOnlinePlay,
      String? cannotDownload,
      String? download,
      FeeType? feeType,
      String? listenFragment,
      String? localEncrypt,
      String? play,
      String? tipsIntercept,}){
    _cannotOnlinePlay = cannotOnlinePlay;
    _cannotDownload = cannotDownload;
    _download = download;
    _feeType = feeType;
    _listenFragment = listenFragment;
    _localEncrypt = localEncrypt;
    _play = play;
    _tipsIntercept = tipsIntercept;
}

  PayInfo.fromJson(dynamic json) {
    _cannotOnlinePlay = json['cannotOnlinePlay'];
    _cannotDownload = json['cannotDownload'];
    _download = json['download'];
    _feeType = json['feeType'] != null ? FeeType.fromJson(json['feeType']) : null;
    _listenFragment = json['listen_fragment'];
    _localEncrypt = json['local_encrypt'];
    _play = json['play'];
    _tipsIntercept = json['tips_intercept'];
  }
  String? _cannotOnlinePlay;
  String? _cannotDownload;
  String? _download;
  FeeType? _feeType;
  String? _listenFragment;
  String? _localEncrypt;
  String? _play;
  String? _tipsIntercept;
PayInfo copyWith({  String? cannotOnlinePlay,
  String? cannotDownload,
  String? download,
  FeeType? feeType,
  String? listenFragment,
  String? localEncrypt,
  String? play,
  String? tipsIntercept,
}) => PayInfo(  cannotOnlinePlay: cannotOnlinePlay ?? _cannotOnlinePlay,
  cannotDownload: cannotDownload ?? _cannotDownload,
  download: download ?? _download,
  feeType: feeType ?? _feeType,
  listenFragment: listenFragment ?? _listenFragment,
  localEncrypt: localEncrypt ?? _localEncrypt,
  play: play ?? _play,
  tipsIntercept: tipsIntercept ?? _tipsIntercept,
);
  String? get cannotOnlinePlay => _cannotOnlinePlay;
  String? get cannotDownload => _cannotDownload;
  String? get download => _download;
  FeeType? get feeType => _feeType;
  String? get listenFragment => _listenFragment;
  String? get localEncrypt => _localEncrypt;
  String? get play => _play;
  String? get tipsIntercept => _tipsIntercept;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cannotOnlinePlay'] = _cannotOnlinePlay;
    map['cannotDownload'] = _cannotDownload;
    map['download'] = _download;
    if (_feeType != null) {
      map['feeType'] = _feeType?.toJson();
    }
    map['listen_fragment'] = _listenFragment;
    map['local_encrypt'] = _localEncrypt;
    map['play'] = _play;
    map['tips_intercept'] = _tipsIntercept;
    return map;
  }

}

/// album : "0"
/// bookvip : "0"
/// song : "1"
/// vip : "1"

class FeeType {
  FeeType({
      String? album,
      String? bookvip,
      String? song,
      String? vip,}){
    _album = album;
    _bookvip = bookvip;
    _song = song;
    _vip = vip;
}

  FeeType.fromJson(dynamic json) {
    _album = json['album'];
    _bookvip = json['bookvip'];
    _song = json['song'];
    _vip = json['vip'];
  }
  String? _album;
  String? _bookvip;
  String? _song;
  String? _vip;
FeeType copyWith({  String? album,
  String? bookvip,
  String? song,
  String? vip,
}) => FeeType(  album: album ?? _album,
  bookvip: bookvip ?? _bookvip,
  song: song ?? _song,
  vip: vip ?? _vip,
);
  String? get album => _album;
  String? get bookvip => _bookvip;
  String? get song => _song;
  String? get vip => _vip;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['album'] = _album;
    map['bookvip'] = _bookvip;
    map['song'] = _song;
    map['vip'] = _vip;
    return map;
  }

}