import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:spooky/app.dart';
import 'package:spooky/main.dart';
import 'package:spooky/utils/constants/app_constant.dart';

class DateFormatHelper {
  static BuildContext? get _context {
    if (!Global.instance.unitTesting) {
      return App.navigatorKey.currentContext;
    }
    return null;
  }

  static String? get languageCode {
    if (!Global.instance.unitTesting) {
      return _context?.locale.languageCode ?? AppConstant.fallbackLocale.languageCode;
    }
    return null;
  }

  static DateFormat toNameOfMonth({bool fullName = false}) {
    final DateFormat format = fullName ? DateFormat.MMMM(languageCode) : DateFormat.MMM(languageCode);
    return format;
  }

  static DateFormat toFullNameOfMonth() {
    final DateFormat format = DateFormat.MMMM(languageCode);
    return format;
  }

  static DateFormat toYear() {
    final DateFormat format = DateFormat.y(languageCode);
    return format;
  }

  static DateFormat toDay() {
    final DateFormat format = DateFormat.E(languageCode);
    return format;
  }

  static DateFormat toIntDay() {
    final DateFormat format = DateFormat.d(languageCode);
    return format;
  }

  static DateFormat dateFormat() {
    return DateFormat.yMd(languageCode);
  }

  static DateFormat yM() {
    return DateFormat.yMMMM(languageCode);
  }

  static DateFormat timeFormat() {
    return DateFormat.jm(languageCode);
  }

  static DateFormat dateTimeFormat() {
    return DateFormat.yMEd(languageCode).addPattern("- ${DateFormat.jms().pattern!}");
  }
}
