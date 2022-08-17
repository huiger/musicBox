
import 'package:music_box/net/request_config.dart';

class KuWoRequest extends RequestConfig {

  @override
  setBaseUrl(String url) {
    return 'http://kbangserver.kuwo.cn/ksong.s?from=pc&fmt=json&pn=0&rn=100&type=bang&data=content&id=286&show_copyright_off=0&pcmp4=1&isbang=1&_=1660009172573';
  }

}