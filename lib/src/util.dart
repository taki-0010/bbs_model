// import 'package:string_extensions/string_extensions.dart';

import 'dart:convert';
import 'dart:math';

import 'importer.dart';

class GoogleFontsList {
  // static const _default = '(Default)';
  static const _kosugi = 'Kosugi';
  static const _shipporiMincho = 'Shippori Mincho';
  static const _zenMaruGothic = 'Zen Maru Gothic';
  static const _zenKurenaido = 'Zen Kurenaido';
  static const _kaiseiDecol = 'Kaisei Decol';
  static const _dotGothic16 = 'DotGothic16';
  // static const _add = 'Add';
  final list = [
    _kosugi,
    _shipporiMincho,
    _zenMaruGothic,
    _zenKurenaido,
    _kaiseiDecol,
    _dotGothic16,
    // _add
  ];
  String get kosugi => _kosugi;
}

int randomInt() {
  return Random().nextInt(999);
}

String jsonToString(final Map<String, dynamic> value) {
  return value.toString();
}

Map<String, dynamic> stringToJson(final String value) {
  // logger.e('stringToJson: $value');
  return json.decode(value);
}

class FiveChParser {
  static final idReg = RegExp(r'[0-9]{5,}');
  // https://egg.5ch.net/test/read.cgi/software/1690261572/l50
  // https://egg.5ch.net/software/dat/1690261572.dat
  static String? toDatUrl(final String value) {
    String? result;
    try {
      if (value.contains('test/read.cgi/')) {
        result = value.replaceAll('test/read.cgi/', '');
      } else {
        return null;
      }
      final splited = result.split('/');
      final id = splited.firstWhere(
        (element) => element.contains(idReg),
        orElse: () => '',
      );
      if (id.isEmpty) {
        return null;
      }
      final path = result.substring(0, result.indexOf(idReg));
      result = '${path}dat/$id.dat';
      return result;
    } catch (e) {
      logger.e(e);
    }
    return null;
  }

  static String? getId(final String value) {
    try {
      final id = idReg.allMatches(value);
      final data = id.first.group(0);
      return data;
    } catch (e) {
      logger.e(e);
    }
    return null;
  }

  static String? getBoardIdFromDat(final String value) {
    try {
      final uri = Uri.parse(value);
      return uri.pathSegments[0];
    } catch (e) {
      logger.e(e);
    }
    return null;
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

  static String toTitleCase(final String value) => ReCase(value).titleCase;
}
