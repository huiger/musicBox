
/// img : "http://img1.kwcdn.kuwo.cn/star/upload/3/3/1531190823779_.png"
/// mdigest : "5"
/// data : [{"extend":"","img":"https://kwimg4.kuwo.cn/star/upload/52/73/1600940595229_.png","digest":"43","name":"抖音专区","isnew":"0","id":"140"},{"extend":"","img":"https://kwimg4.kuwo.cn/star/upload/57/71/1600940613945_.png","digest":"43","name":"经典老歌专区","isnew":"0","id":"211"},{"extend":"","img":"https://kwimg3.kuwo.cn/star/upload/21/79/1617004704765_.png","digest":"43","name":"网红专区","isnew":"0","id":"87"},{"extend":"","img":"https://kwimg4.kuwo.cn/star/upload/5/86/1617253194650_.png","digest":"43","name":"DJ专区","isnew":"0","id":"1"},{"extend":"","img":"https://kwimg2.kuwo.cn/star/upload/2/36/1600940674082_.png","digest":"43","name":"轻音乐专区","isnew":"0","id":"13"},{"extend":"","img":"https://kwimg1.kuwo.cn/star/upload/88/1/1601368112905_.png","digest":"43","name":"国风专区","isnew":"0","id":"12"},{"extend":"","img":"https://kwimg1.kuwo.cn/star/upload/96/39/1600940742783_.png","digest":"43","name":"影视专区","isnew":"0","id":"156"},{"extend":"","img":"https://kwimg3.kuwo.cn/star/upload/42/96/1601001391218_.png","digest":"43","name":"铃声专区","isnew":"0","id":"143"},{"extend":"","img":"https://kwimg2.kuwo.cn/star/upload/21/87/1632913705587_.png","digest":"43","name":"动漫专区","isnew":"0","id":"6"},{"extend":"","img":"https://kwimg4.kuwo.cn/star/upload/90/83/1603939888179_.png","digest":"43","name":"新歌首发专区","isnew":"0","id":"17"},{"extend":"","img":"https://kwimg4.kuwo.cn/star/upload/1/38/1600940839312_.png","digest":"43","name":"K歌专区","isnew":"0","id":"147"},{"extend":"","img":"https://kwimg1.kuwo.cn/star/upload/46/64/1603939735378_.png","digest":"43","name":"小说专区","isnew":"0","id":"18"},{"extend":"","img":"http://kwimg2.kuwo.cn/star/upload/47/8/1603939584206_.png","digest":"43","name":"佛乐专区","isnew":"0","id":"9"},{"extend":"","img":"https://kwimg3.kuwo.cn/star/upload/90/50/1603939584150_.png","digest":"43","name":"儿童专区","isnew":"0","id":"3"},{"extend":"","img":"https://kwimg1.kuwo.cn/star/upload/55/73/1603939735387_.png","digest":"43","name":"评书专区","isnew":"0","id":"20"},{"extend":"","img":"https://kwimg2.kuwo.cn/star/upload/50/75/1603939959221_.png","digest":"43","name":"综艺专区","isnew":"1","id":"109"},{"extend":"|HOT","img":"https://kwimg4.kuwo.cn/star/upload/23/81/1603939584083_.png","digest":"43","name":"古典专区","isnew":"0","id":"164"},{"extend":"","img":"https://kwimg3.kuwo.cn/star/upload/47/7/1603939584107_.png","digest":"43","name":"Vlog音乐","isnew":"0","id":"166"}]
/// name : "专区"
/// id : "68"
/// type : "list"
/// img1 : "http://kwimg3.kuwo.cn/star/upload/47/20/1548987670838_.png"


class KwClassify {
  String img = '';
  String mdigest = '';
  List<KwNowClassifyDataBean> data = [];
  String name = '';
  String id = '';
  String type = '';
  String img1 = '';

  static KwClassify fromMap(Map<String, dynamic> map) {
    KwClassify classify = KwClassify();
    if (map == null) return classify;
    classify.img = map['img'];
    classify.mdigest = map['mdigest'];
    classify.data = []..addAll(
      (map['data'] as List).map((o) => KwNowClassifyDataBean.fromMap(o))
    );
    classify.name = map['name'];
    classify.id = map['id'];
    classify.type = map['type'];
    classify.img1 = map['img1'];
    return classify;
  }

  Map toJson() => {
    "img": img,
    "mdigest": mdigest,
    "data": data,
    "name": name,
    "id": id,
    "type": type,
    "img1": img1,
  };
}

/// extend : ""
/// img : "https://kwimg4.kuwo.cn/star/upload/52/73/1600940595229_.png"
/// digest : "43"
/// name : "抖音专区"
/// isnew : "0"
/// id : "140"

class KwNowClassifyDataBean {
  String extend = '';
  String img = '';
  String digest = '';
  String name = '';
  String isnew = '';
  String id = '';

  static KwNowClassifyDataBean fromMap(Map<String, dynamic> map) {
    KwNowClassifyDataBean dataBean = KwNowClassifyDataBean();
    if (map == null) return dataBean;
    dataBean.extend = map['extend'];
    dataBean.img = map['img'];
    dataBean.digest = map['digest'];
    dataBean.name = map['name'];
    dataBean.isnew = map['isnew'];
    dataBean.id = map['id'];
    return dataBean;
  }

  Map toJson() => {
    "extend": extend,
    "img": img,
    "digest": digest,
    "name": name,
    "isnew": isnew,
    "id": id,
  };
}