import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void travarTela() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void setColorStatusBar(Color statusBarColor,
    {Brightness statusBarBrightness = Brightness.dark}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: statusBarColor,
  ));
}
