import 'package:flutter/material.dart';

class AppSize {
  BuildContext _context;
  bool appBarEnabled;

  AppSize(this._context, {this.appBarEnabled = false}) {
    if (appBarEnabled) {
      _appBar = AppBar();
    }
  }

  AppBar _appBar;

  void setAppBarEnable(bool enable, {AppBar apBar}) {
    appBarEnabled = enable;
    if (apBar != null) {
      _appBar = apBar;
    } else {
      _appBar = AppBar();
    }
  }

  MediaQueryData get mediaQuery {
    return MediaQuery.of(_context);
  }

  EdgeInsets get padding {
    return mediaQuery.padding;
  }

  double get width {
    return mediaQuery.size.width;
  }

  double get height {
    //remove o top
    var heigth = mediaQuery.size.height - padding.top;

    if (appBarEnabled) {
      heigth = heigth - _appBar.preferredSize.height;
    }

    return heigth;
  }
}
