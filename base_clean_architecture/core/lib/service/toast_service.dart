import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ToastService {
  
  show({
    required String msg,
    Toast? toastLength,
    int timeInSecForIosWeb = 1,
    double? fontSize,
    ToastGravity? gravity,
    Color? backgroundColor,
    Color? textColor,
    bool webShowClose = false,
    webBgColor = "linear-gradient(to right, #00b09b, #96c93d)",
    webPosition = "right",
  }) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        timeInSecForIosWeb: timeInSecForIosWeb,
        fontSize: fontSize,
        gravity: gravity,
        backgroundColor: backgroundColor,
        textColor: textColor,
        webShowClose: webShowClose,
        webBgColor: webBgColor,
        webPosition: webPosition
    );
  }
}
