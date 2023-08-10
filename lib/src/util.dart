import 'package:string_extensions/string_extensions.dart';

import 'importer.dart';

final class StringMethodData {
  static final escape = HtmlUnescape();
  static String replaceSpecialNum(final String value) {
    final existNum = RegExp(r'&#[0-9]+;').firstMatch(value);
    if (existNum?.group(0) == null) {
      return value;
    }
    final text = escape.convert(existNum!.group(0)!);
    return value.replaceAll(existNum.group(0)!, text);
  }

  static String replaceSpecialStr(final String value) {
    final existStr = RegExp(r'&[\w]+;').firstMatch(value);
    if (existStr?.group(0) != null) {
      final text = escape.convert(existStr!.group(0)!);
      return value.replaceAll(existStr.group(0)!, text);
    }
    return value;
  }

  static String replaceText(final String value) {
    final replacedNum = replaceSpecialNum(value);
    return replaceSpecialStr(replacedNum);
  }

  static String convert(final String value) => escape.convert(value);

  static String stlipHtml(final String value) => value.stripHtml ?? '';

  static String firstAndEllipsis(final String value) {
    final i = value.first(n: 9);
    return i != null ? '$i...' : value;
  }
}
