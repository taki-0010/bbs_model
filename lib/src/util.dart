// import 'package:string_extensions/string_extensions.dart';

import 'dart:convert';
import 'dart:math';

import 'package:youtube_parser/youtube_parser.dart';

import 'importer.dart';

class UrlParser {
  static final xEmbeStr = '''
<blockquote class="twitter-tweet"><p lang="ja" dir="ltr"><a href="https://twitter.com/{{name}}/status/{{str}}?ref_src=twsrc%5Etfw"></a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
''';

  static String? xComEmbed(final String url) {
    if (!url.contains('status/')) {
      return null;
    }
    final index = url.indexOf('.com/') + 5;
    final subed = url.substring(index);
    final slash = subed.indexOf('/');
    final userName = subed.substring(0, slash);
    final statusIndex = url.indexOf('status/') + 7;
    final idData = url.substring(statusIndex);

    final id = RegExp(r'\d+').firstMatch(idData);
    // final data = id.isNotEmpty ? id.first : null;
    final idStr = id?.group(0);
    if (idStr == null) {
      return null;
    }
    // logger.d('x.com: user: $userName, id: $idStr');
    final replacedName = xEmbeStr.replaceAll('{{name}}', userName);
    return replacedName.replaceAll('{{str}}', idStr);
  }
}

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
  static String get kosugi => _kosugi;

  static const apache = 'APACHE LICENSE v2.0';
  static const open = 'Open Font License';
}

int randomInt({int count = 999}) {
  return Random().nextInt(count);
}

String jsonToString(final Map<String, dynamic> value) {
  return value.toString();
}

Map<String, dynamic> stringToJson(final String value) {
  // logger.e('stringToJson: $value');
  return json.decode(value);
}

class StringMethodData {
  static final escape = HtmlUnescape();
  static const urlReg = r'''h?ttps?://[\w!\?/\+\-_~=;\.,\*&@#\$%\(\)'\[\]]+''';
  static const idReg8 = r'''ID:.{8}''';
  static const idReg4 = r'''ID:.{4}''';
  static String? getYoutubeStr(final String value) => getIdFromUrl(value);
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

  static String _replaceText(final String value) {
    final replacedNum = replaceSpecialNum(value);
    return replaceSpecialStr(replacedNum);
  }

  static String replaceText(final String value) {
    final result = _replaceText(value);
    return result.isEmpty ? '' : result;
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

  static String addArrowToAllLines(final String value) {
    final splited = value.trim().split('\n');
    return splited.map((e) => '>$e\n').join();
  }
}
