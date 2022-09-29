import 'package:flutter/material.dart';

class DisplayScreen {
  static late MediaQueryData _mediaData;
  static late double displayWidth;
  static late double displayHeight;

  void init(BuildContext aContext) {
    _mediaData = MediaQuery.of(aContext);
    displayWidth = _mediaData.size.width;
    displayHeight = _mediaData.size.height;
  }

  Size get screenSize => _mediaData.size;
}
