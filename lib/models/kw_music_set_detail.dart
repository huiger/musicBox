class KwMusicSetDetail {
  KwMusicSetDetail({
      num? abstime, 
      num? ctime, 
      num? id, 
      String? info, 
      bool? ispub, 
      List<Musiclist>? musiclist, 
      String? pic, 
      num? playnum, 
      num? pn, 
      String? result, 
      num? rn, 
      num? sharenum, 
      num? songtime, 
      num? state, 
      String? tag, 
      String? tagid, 
      String? title, 
      num? total, 
      String? type, 
      num? uid, 
      String? uname, 
      num? validtotal,}){
    _abstime = abstime;
    _ctime = ctime;
    _id = id;
    _info = info;
    _ispub = ispub;
    _musiclist = musiclist;
    _pic = pic;
    _playnum = playnum;
    _pn = pn;
    _result = result;
    _rn = rn;
    _sharenum = sharenum;
    _songtime = songtime;
    _state = state;
    _tag = tag;
    _tagid = tagid;
    _title = title;
    _total = total;
    _type = type;
    _uid = uid;
    _uname = uname;
    _validtotal = validtotal;
}

  KwMusicSetDetail.fromJson(dynamic json) {
    _abstime = json['abstime'];
    _ctime = json['ctime'];
    _id = json['id'];
    _info = json['info'];
    _ispub = json['ispub'];
    if (json['musiclist'] != null) {
      _musiclist = [];
      json['musiclist'].forEach((v) {
        _musiclist?.add(Musiclist.fromJson(v));
      });
    }
    _pic = json['pic'];
    _playnum = json['playnum'];
    _pn = json['pn'];
    _result = json['result'];
    _rn = json['rn'];
    _sharenum = json['sharenum'];
    _songtime = json['songtime'];
    _state = json['state'];
    _tag = json['tag'];
    _tagid = json['tagid'];
    _title = json['title'];
    _total = json['total'];
    _type = json['type'];
    _uid = json['uid'];
    _uname = json['uname'];
    _validtotal = json['validtotal'];
  }
  num? _abstime;
  num? _ctime;
  num? _id;
  String? _info;
  bool? _ispub;
  List<Musiclist>? _musiclist;
  String? _pic;
  num? _playnum;
  num? _pn;
  String? _result;
  num? _rn;
  num? _sharenum;
  num? _songtime;
  num? _state;
  String? _tag;
  String? _tagid;
  String? _title;
  num? _total;
  String? _type;
  num? _uid;
  String? _uname;
  num? _validtotal;

  num? get abstime => _abstime;
  num? get ctime => _ctime;
  num? get id => _id;
  String? get info => _info;
  bool? get ispub => _ispub;
  List<Musiclist>? get musiclist => _musiclist;
  String? get pic => _pic;
  num? get playnum => _playnum;
  num? get pn => _pn;
  String? get result => _result;
  num? get rn => _rn;
  num? get sharenum => _sharenum;
  num? get songtime => _songtime;
  num? get state => _state;
  String? get tag => _tag;
  String? get tagid => _tagid;
  String? get title => _title;
  num? get total => _total;
  String? get type => _type;
  num? get uid => _uid;
  String? get uname => _uname;
  num? get validtotal => _validtotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['abstime'] = _abstime;
    map['ctime'] = _ctime;
    map['id'] = _id;
    map['info'] = _info;
    map['ispub'] = _ispub;
    if (_musiclist != null) {
      map['musiclist'] = _musiclist?.map((v) => v.toJson()).toList();
    }
    map['pic'] = _pic;
    map['playnum'] = _playnum;
    map['pn'] = _pn;
    map['result'] = _result;
    map['rn'] = _rn;
    map['sharenum'] = _sharenum;
    map['songtime'] = _songtime;
    map['state'] = _state;
    map['tag'] = _tag;
    map['tagid'] = _tagid;
    map['title'] = _title;
    map['total'] = _total;
    map['type'] = _type;
    map['uid'] = _uid;
    map['uname'] = _uname;
    map['validtotal'] = _validtotal;
    return map;
  }

}

class Musiclist {
  Musiclist({
      String? aartist, 
      String? falbum, 
      String? fartist, 
      String? fsongname, 
      String? minfo, 
      String? nminfo, 
      String? adSubtype, 
      String? adType, 
      String? album, 
      String? albumid, 
      String? artist, 
      String? artistid, 
      Audiobookpayinfo? audiobookpayinfo, 
      String? barrage, 
      String? cacheStatus, 
      String? collectNum, 
      String? contentType, 
      String? copyright, 
      String? displayalbumname, 
      String? displayartistname, 
      String? displaysongname, 
      String? duration, 
      String? firstrecordtime, 
      String? formats, 
      String? hasmv, 
      String? id, 
      String? isPoint, 
      String? isbatch, 
      String? isdownload, 
      String? isshow, 
      String? isshowtype, 
      String? isstar, 
      String? mp3sig1, 
      String? mp3sig2, 
      String? mp4sig1, 
      String? mp4sig2, 
      String? musicattachinfoid, 
      String? mutiVer, 
      Mvpayinfo? mvpayinfo, 
      String? name, 
      String? nationid, 
      String? nsig1, 
      String? nsig2, 
      String? online, 
      String? opay, 
      String? overseasCopyright, 
      String? overseasPay, 
      String? params, 
      String? pay, 
      PayInfo? payInfo, 
      String? score100, 
      String? spPrivilege, 
      String? subsStrategy, 
      String? subsText, 
      String? tmeMusicianAdtype, 
      String? tpay,}){
    _aartist = aartist;
    _falbum = falbum;
    _fartist = fartist;
    _fsongname = fsongname;
    _minfo = minfo;
    _nminfo = nminfo;
    _adSubtype = adSubtype;
    _adType = adType;
    _album = album;
    _albumid = albumid;
    _artist = artist;
    _artistid = artistid;
    _audiobookpayinfo = audiobookpayinfo;
    _barrage = barrage;
    _cacheStatus = cacheStatus;
    _collectNum = collectNum;
    _contentType = contentType;
    _copyright = copyright;
    _displayalbumname = displayalbumname;
    _displayartistname = displayartistname;
    _displaysongname = displaysongname;
    _duration = duration;
    _firstrecordtime = firstrecordtime;
    _formats = formats;
    _hasmv = hasmv;
    _id = id;
    _isPoint = isPoint;
    _isbatch = isbatch;
    _isdownload = isdownload;
    _isshow = isshow;
    _isshowtype = isshowtype;
    _isstar = isstar;
    _mp3sig1 = mp3sig1;
    _mp3sig2 = mp3sig2;
    _mp4sig1 = mp4sig1;
    _mp4sig2 = mp4sig2;
    _musicattachinfoid = musicattachinfoid;
    _mutiVer = mutiVer;
    _mvpayinfo = mvpayinfo;
    _name = name;
    _nationid = nationid;
    _nsig1 = nsig1;
    _nsig2 = nsig2;
    _online = online;
    _opay = opay;
    _overseasCopyright = overseasCopyright;
    _overseasPay = overseasPay;
    _params = params;
    _pay = pay;
    _payInfo = payInfo;
    _score100 = score100;
    _spPrivilege = spPrivilege;
    _subsStrategy = subsStrategy;
    _subsText = subsText;
    _tmeMusicianAdtype = tmeMusicianAdtype;
    _tpay = tpay;
}

  Musiclist.fromJson(dynamic json) {
    _aartist = json['AARTIST'];
    _falbum = json['FALBUM'];
    _fartist = json['FARTIST'];
    _fsongname = json['FSONGNAME'];
    _minfo = json['MINFO'];
    _nminfo = json['N_MINFO'];
    _adSubtype = json['ad_subtype'];
    _adType = json['ad_type'];
    _album = json['album'];
    _albumid = json['albumid'];
    _artist = json['artist'];
    _artistid = json['artistid'];
    _audiobookpayinfo = json['audiobookpayinfo'] != null ? Audiobookpayinfo.fromJson(json['audiobookpayinfo']) : null;
    _barrage = json['barrage'];
    _cacheStatus = json['cache_status'];
    _collectNum = json['collect_num'];
    _contentType = json['content_type'];
    _copyright = json['copyright'];
    _displayalbumname = json['displayalbumname'];
    _displayartistname = json['displayartistname'];
    _displaysongname = json['displaysongname'];
    _duration = json['duration'];
    _firstrecordtime = json['firstrecordtime'];
    _formats = json['formats'];
    _hasmv = json['hasmv'];
    _id = json['id'];
    _isPoint = json['is_point'];
    _isbatch = json['isbatch'];
    _isdownload = json['isdownload'];
    _isshow = json['isshow'];
    _isshowtype = json['isshowtype'];
    _isstar = json['isstar'];
    _mp3sig1 = json['mp3sig1'];
    _mp3sig2 = json['mp3sig2'];
    _mp4sig1 = json['mp4sig1'];
    _mp4sig2 = json['mp4sig2'];
    _musicattachinfoid = json['musicattachinfoid'];
    _mutiVer = json['muti_ver'];
    _mvpayinfo = json['mvpayinfo'] != null ? Mvpayinfo.fromJson(json['mvpayinfo']) : null;
    _name = json['name'];
    _nationid = json['nationid'];
    _nsig1 = json['nsig1'];
    _nsig2 = json['nsig2'];
    _online = json['online'];
    _opay = json['opay'];
    _overseasCopyright = json['overseas_copyright'];
    _overseasPay = json['overseas_pay'];
    _params = json['params'];
    _pay = json['pay'];
    _payInfo = json['payInfo'] != null ? PayInfo.fromJson(json['payInfo']) : null;
    _score100 = json['score100'];
    _spPrivilege = json['spPrivilege'];
    _subsStrategy = json['subsStrategy'];
    _subsText = json['subsText'];
    _tmeMusicianAdtype = json['tme_musician_adtype'];
    _tpay = json['tpay'];
  }
  String? _aartist;
  String? _falbum;
  String? _fartist;
  String? _fsongname;
  String? _minfo;
  String? _nminfo;
  String? _adSubtype;
  String? _adType;
  String? _album;
  String? _albumid;
  String? _artist;
  String? _artistid;
  Audiobookpayinfo? _audiobookpayinfo;
  String? _barrage;
  String? _cacheStatus;
  String? _collectNum;
  String? _contentType;
  String? _copyright;
  String? _displayalbumname;
  String? _displayartistname;
  String? _displaysongname;
  String? _duration;
  String? _firstrecordtime;
  String? _formats;
  String? _hasmv;
  String? _id;
  String? _isPoint;
  String? _isbatch;
  String? _isdownload;
  String? _isshow;
  String? _isshowtype;
  String? _isstar;
  String? _mp3sig1;
  String? _mp3sig2;
  String? _mp4sig1;
  String? _mp4sig2;
  String? _musicattachinfoid;
  String? _mutiVer;
  Mvpayinfo? _mvpayinfo;
  String? _name;
  String? _nationid;
  String? _nsig1;
  String? _nsig2;
  String? _online;
  String? _opay;
  String? _overseasCopyright;
  String? _overseasPay;
  String? _params;
  String? _pay;
  PayInfo? _payInfo;
  String? _score100;
  String? _spPrivilege;
  String? _subsStrategy;
  String? _subsText;
  String? _tmeMusicianAdtype;
  String? _tpay;

  String? get aartist => _aartist;
  String? get falbum => _falbum;
  String? get fartist => _fartist;
  String? get fsongname => _fsongname;
  String? get minfo => _minfo;
  String? get nminfo => _nminfo;
  String? get adSubtype => _adSubtype;
  String? get adType => _adType;
  String? get album => _album;
  String? get albumid => _albumid;
  String? get artist => _artist;
  String? get artistid => _artistid;
  Audiobookpayinfo? get audiobookpayinfo => _audiobookpayinfo;
  String? get barrage => _barrage;
  String? get cacheStatus => _cacheStatus;
  String? get collectNum => _collectNum;
  String? get contentType => _contentType;
  String? get copyright => _copyright;
  String? get displayalbumname => _displayalbumname;
  String? get displayartistname => _displayartistname;
  String? get displaysongname => _displaysongname;
  String? get duration => _duration;
  String? get firstrecordtime => _firstrecordtime;
  String? get formats => _formats;
  String? get hasmv => _hasmv;
  String? get id => _id;
  String? get isPoint => _isPoint;
  String? get isbatch => _isbatch;
  String? get isdownload => _isdownload;
  String? get isshow => _isshow;
  String? get isshowtype => _isshowtype;
  String? get isstar => _isstar;
  String? get mp3sig1 => _mp3sig1;
  String? get mp3sig2 => _mp3sig2;
  String? get mp4sig1 => _mp4sig1;
  String? get mp4sig2 => _mp4sig2;
  String? get musicattachinfoid => _musicattachinfoid;
  String? get mutiVer => _mutiVer;
  Mvpayinfo? get mvpayinfo => _mvpayinfo;
  String? get name => _name;
  String? get nationid => _nationid;
  String? get nsig1 => _nsig1;
  String? get nsig2 => _nsig2;
  String? get online => _online;
  String? get opay => _opay;
  String? get overseasCopyright => _overseasCopyright;
  String? get overseasPay => _overseasPay;
  String? get params => _params;
  String? get pay => _pay;
  PayInfo? get payInfo => _payInfo;
  String? get score100 => _score100;
  String? get spPrivilege => _spPrivilege;
  String? get subsStrategy => _subsStrategy;
  String? get subsText => _subsText;
  String? get tmeMusicianAdtype => _tmeMusicianAdtype;
  String? get tpay => _tpay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AARTIST'] = _aartist;
    map['FALBUM'] = _falbum;
    map['FARTIST'] = _fartist;
    map['FSONGNAME'] = _fsongname;
    map['MINFO'] = _minfo;
    map['N_MINFO'] = _nminfo;
    map['ad_subtype'] = _adSubtype;
    map['ad_type'] = _adType;
    map['album'] = _album;
    map['albumid'] = _albumid;
    map['artist'] = _artist;
    map['artistid'] = _artistid;
    if (_audiobookpayinfo != null) {
      map['audiobookpayinfo'] = _audiobookpayinfo?.toJson();
    }
    map['barrage'] = _barrage;
    map['cache_status'] = _cacheStatus;
    map['collect_num'] = _collectNum;
    map['content_type'] = _contentType;
    map['copyright'] = _copyright;
    map['displayalbumname'] = _displayalbumname;
    map['displayartistname'] = _displayartistname;
    map['displaysongname'] = _displaysongname;
    map['duration'] = _duration;
    map['firstrecordtime'] = _firstrecordtime;
    map['formats'] = _formats;
    map['hasmv'] = _hasmv;
    map['id'] = _id;
    map['is_point'] = _isPoint;
    map['isbatch'] = _isbatch;
    map['isdownload'] = _isdownload;
    map['isshow'] = _isshow;
    map['isshowtype'] = _isshowtype;
    map['isstar'] = _isstar;
    map['mp3sig1'] = _mp3sig1;
    map['mp3sig2'] = _mp3sig2;
    map['mp4sig1'] = _mp4sig1;
    map['mp4sig2'] = _mp4sig2;
    map['musicattachinfoid'] = _musicattachinfoid;
    map['muti_ver'] = _mutiVer;
    if (_mvpayinfo != null) {
      map['mvpayinfo'] = _mvpayinfo?.toJson();
    }
    map['name'] = _name;
    map['nationid'] = _nationid;
    map['nsig1'] = _nsig1;
    map['nsig2'] = _nsig2;
    map['online'] = _online;
    map['opay'] = _opay;
    map['overseas_copyright'] = _overseasCopyright;
    map['overseas_pay'] = _overseasPay;
    map['params'] = _params;
    map['pay'] = _pay;
    if (_payInfo != null) {
      map['payInfo'] = _payInfo?.toJson();
    }
    map['score100'] = _score100;
    map['spPrivilege'] = _spPrivilege;
    map['subsStrategy'] = _subsStrategy;
    map['subsText'] = _subsText;
    map['tme_musician_adtype'] = _tmeMusicianAdtype;
    map['tpay'] = _tpay;
    return map;
  }

}

class PayInfo {
  PayInfo({
      String? cannotDownload, 
      String? cannotOnlinePlay, 
      String? download, 
      FeeType? feeType, 
      String? limitfree, 
      String? listenFragment, 
      String? localEncrypt, 
      String? ndown, 
      String? nplay, 
      String? overseasNdown, 
      String? overseasNplay, 
      String? play, 
      String? refrainEnd, 
      String? refrainStart, 
      String? tipsIntercept,}){
    _cannotDownload = cannotDownload;
    _cannotOnlinePlay = cannotOnlinePlay;
    _download = download;
    _feeType = feeType;
    _limitfree = limitfree;
    _listenFragment = listenFragment;
    _localEncrypt = localEncrypt;
    _ndown = ndown;
    _nplay = nplay;
    _overseasNdown = overseasNdown;
    _overseasNplay = overseasNplay;
    _play = play;
    _refrainEnd = refrainEnd;
    _refrainStart = refrainStart;
    _tipsIntercept = tipsIntercept;
}

  PayInfo.fromJson(dynamic json) {
    _cannotDownload = json['cannotDownload'];
    _cannotOnlinePlay = json['cannotOnlinePlay'];
    _download = json['download'];
    _feeType = json['feeType'] != null ? FeeType.fromJson(json['feeType']) : null;
    _limitfree = json['limitfree'];
    _listenFragment = json['listen_fragment'];
    _localEncrypt = json['local_encrypt'];
    _ndown = json['ndown'];
    _nplay = json['nplay'];
    _overseasNdown = json['overseas_ndown'];
    _overseasNplay = json['overseas_nplay'];
    _play = json['play'];
    _refrainEnd = json['refrain_end'];
    _refrainStart = json['refrain_start'];
    _tipsIntercept = json['tips_intercept'];
  }
  String? _cannotDownload;
  String? _cannotOnlinePlay;
  String? _download;
  FeeType? _feeType;
  String? _limitfree;
  String? _listenFragment;
  String? _localEncrypt;
  String? _ndown;
  String? _nplay;
  String? _overseasNdown;
  String? _overseasNplay;
  String? _play;
  String? _refrainEnd;
  String? _refrainStart;
  String? _tipsIntercept;

  String? get cannotDownload => _cannotDownload;
  String? get cannotOnlinePlay => _cannotOnlinePlay;
  String? get download => _download;
  FeeType? get feeType => _feeType;
  String? get limitfree => _limitfree;
  String? get listenFragment => _listenFragment;
  String? get localEncrypt => _localEncrypt;
  String? get ndown => _ndown;
  String? get nplay => _nplay;
  String? get overseasNdown => _overseasNdown;
  String? get overseasNplay => _overseasNplay;
  String? get play => _play;
  String? get refrainEnd => _refrainEnd;
  String? get refrainStart => _refrainStart;
  String? get tipsIntercept => _tipsIntercept;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cannotDownload'] = _cannotDownload;
    map['cannotOnlinePlay'] = _cannotOnlinePlay;
    map['download'] = _download;
    if (_feeType != null) {
      map['feeType'] = _feeType?.toJson();
    }
    map['limitfree'] = _limitfree;
    map['listen_fragment'] = _listenFragment;
    map['local_encrypt'] = _localEncrypt;
    map['ndown'] = _ndown;
    map['nplay'] = _nplay;
    map['overseas_ndown'] = _overseasNdown;
    map['overseas_nplay'] = _overseasNplay;
    map['play'] = _play;
    map['refrain_end'] = _refrainEnd;
    map['refrain_start'] = _refrainStart;
    map['tips_intercept'] = _tipsIntercept;
    return map;
  }

}

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

  String? get download => _download;
  String? get play => _play;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['download'] = _download;
    map['play'] = _play;
    return map;
  }

}