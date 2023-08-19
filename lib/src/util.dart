// import 'package:string_extensions/string_extensions.dart';

import 'dart:convert';
import 'dart:math';

import 'importer.dart';

String jsonToString(final Map<String, dynamic> value) {
  return value.toString();
}

Map<String, dynamic> stringToJson(final String value) {
  // logger.e('stringToJson: $value');
  return json.decode(value);
}

class FutabaParser {
  static const catalog = '?mode=cat';
  static const sort = '&sort=';
  static String getBoardPath(
      {required final String directory,
      required final String boardId,
      required final ThreadsOrder order}) {
    final path = '$directory.2chan.net/$boardId';
    // String get url => '$path/futaba.htm';
    // String get catalogUrl => '$path/futaba.php$catalog';
    // String get newListUrl => '$path/futaba.php$catalog${sort}1';
    // String get oldListUrl => '$path/futaba.php$catalog${sort}2';
    // String get hugListUrl => '$path/futaba.php$catalog${sort}3';
    // String get ikioiListUrl => '$path/futaba.php$catalog${sort}6';
    switch (order) {
      case ThreadsOrder.catalog:
        return '$path/futaba.php$catalog';
      case ThreadsOrder.biggerResCount:
        return '$path/futaba.php$catalog${sort}3';
      case ThreadsOrder.newOrder:
        return '$path/futaba.php$catalog${sort}1';
      default:
    }
    return '';
  }
}

class StringMethodData {
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

  // static String stlipHtml(final String value) => value;

  static String firstAndEllipsis(final String value) {
    int count = 0;
    int strLength = 0;
    String? result;
    final textcode = Characters(value);
    final splittedText = textcode.string.split('');
    for (final t in splittedText) {
      final bytes = strByteNum(t);
      strLength += 1;
      count += bytes;
      if (count >= 26) {
        result = value.substring(0, strLength);
        break;
      }
    }
    // final i = value.first(n: 14);
    return result != null ? '$result...' : value;
    // final i = value.first(n: 14);
    // return i != null ? '$i...' : value;
  }

  static int strByteNum(final String value) {
    // logger.d('byte: ${value.readAsBytesSync()}');
    // final textcode = Characters(value);
    // textcode.firstOrNull?.asy
    final bool isTwo = RegExp(r'[^\x01-\x7E]').hasMatch(value);
    return isTwo ? 2 : 1;
  }

  static String generateRandomString([int length = 25]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz';
    final random = Random.secure();
    final randomStr =
        List.generate(length, (_) => charset[random.nextInt(charset.length)])
            .join();
    return randomStr;
  }
}
