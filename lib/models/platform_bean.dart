import 'package:flutter/cupertino.dart';

class PlatformBean {

  String platformName;
  String? platformLogo;
  Widget page;

  PlatformBean(this.platformName, {this.platformLogo, required this.page});

}