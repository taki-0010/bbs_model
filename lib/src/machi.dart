import 'package:model/src/importer.dart';

part 'machi.g.dart';

class MachiData {
  static final host = Communities.machi.host;
  static const threads = 'bbs/json.cgi';
  static const bbsMenu = 'bbsmenu.html';
  static const search = 'bbs/search.cgi';
  static const threadPath = 'bbs/read.cgi';
  static const sp = 'sp.html';

  // threads
  // http://www.machi.to/bbs/json.cgi/tawara/

  // thread
  // http://www.machi.to/bbs/json.cgi/tawara/1269441710/
  // https://machi.to/bbs/read.cgi/hokkaidou/1689276249/500

  static Uri? htmlToDatUri(final Uri uri) {
    final boardId = getBoardIdFromUri(uri);
    final threadId = getThreadIdFromUri(uri);
    if (boardId != null && threadId != null) {
      return Uri.https(host, '$threadPath/$boardId/$threadId');
    }
    return null;
  }

  static bool? uriIsThreadOrBoard(final Uri uri) {
    if (!uri.host.contains(host)) {
      return null;
    }
    if (uri.path.contains(bbsMenu)) {
      return null;
    }
    if (uri.path.contains(threadPath)) {
      return true;
    }
    if (uri.path.contains(threads)) {
      return true;
    }
    final path = uri.pathSegments;
    if (getBoardNameById(path.first).isNotEmpty) {
      return false;
    }
    return null;
  }

  static String? getBoardIdFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null) {
      return null;
    }
    // final path = uri.path;
    final seg = uri.pathSegments;
    // logger.d('getBoardIdFromUri: $path, seg: $seg, tob:$tob');
    if (tob) {
      if (seg.length >= 3) {
        return seg[2];
      }
    }
    if (seg.isNotEmpty && getBoardNameById(seg.first).isNotEmpty) {
      return seg.first;
    }
    return null;
  }

  static String? getThreadIdFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null || !tob) {
      return null;
    }
    final path = uri.path;
    final mached = FiveChData.idReg.firstMatch(path);
    if (mached != null) {
      return mached.group(0);
    }
    return null;
  }

  static int? getResNumFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null || !tob) {
      return null;
    }
    final seg = uri.pathSegments;
    if (seg.length >= 5) {
      final str = seg.last;
      return StringMethodData.getResNum(str);
    }
    return null;
  }

  // static String? getThreadIdFromUrl(final String url) {
  //   return '';
  // }

  // static String? getBoardIdFromUrl(final String? url) {
  //   final replacedHttps = url?.replaceAll(RegExp(r'''https?://'''), '');
  //   final replacedSlash = replacedHttps?.replaceAll('//', '');
  //   final replacedWWW = replacedSlash?.replaceAll('www.', '');
  //   final replaced = replacedWWW?.replaceAll('machi.to/bbs/read.cgi/', '');
  //   final boardId = replaced?.substring(0, replaced.indexOf('/'));
  //   return boardId;
  // }

  static String getBoardNameById(final String? id) {
    switch (id) {
      case 'hokkaidou':
        return '北海道';
      case 'touhoku':
        return '東北';
      case 'kousinetu':
        return '北陸・甲信越';
      case 'kanto':
        return '関東';
      case 'tokyo':
        return '東京';
      case 'tama':
        return '多摩';
      case 'kana':
        return '神奈川';
      case 'toukai':
        return '東海';
      case 'kinki':
        return '近畿';
      case 'osaka':
        return '大阪';
      case 'cyugoku':
        return '中国';
      case 'sikoku':
        return '四国';
      case 'kyusyu':
        return '九州';
      case 'okinawa':
        return '沖縄';
      case 'tawara':
        return '会議室';
      default:
        return '';
    }
  }
}

// @JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class MachiBoardData extends BoardData {
  const MachiBoardData({
    required super.id,
    required super.name,
    required super.forum,
  });
  // final String id;
  // final String url;

  // factory MachiBoardData.fromJson(Map<String, dynamic> json) =>
  //     _$MachiBoardDataFromJson(json);

  // Map<String, dynamic> toJson() => _$MachiBoardDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class MachiThreadsBaseData {
  const MachiThreadsBaseData(
      {this.thread = const [], required this.status, required this.bbs});
  final List<MachiThreadDataFromJson?> thread;
  final String status;
  final String bbs;

  factory MachiThreadsBaseData.fromJson(Map<String, dynamic> json) =>
      _$MachiThreadsBaseDataFromJson(json);

  Map<String, dynamic> toJson() => _$MachiThreadsBaseDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class MachiThreadDataFromJson {
  const MachiThreadDataFromJson(
      {required this.subject,
      required this.no,
      required this.res,
      required this.key});

  final String subject;
  final int no;
  final String res;
  final String key;

  String getUrl(final String boardId) =>
      '${MachiData.host}/${MachiData.threads}/$boardId/$key';

  factory MachiThreadDataFromJson.fromJson(Map<String, dynamic> json) =>
      _$MachiThreadDataFromJsonFromJson(json);

  Map<String, dynamic> toJson() => _$MachiThreadDataFromJsonToJson(this);
}

@CopyWith()
@immutable
class MachiThreadData extends ThreadData with WithDateTime {
  const MachiThreadData(
      {required super.id,
      required super.title,
      required super.resCount,
      required super.boardId,
      required super.type,
      required super.url,
      // super.difference,
      super.boardName,
      super.isNewPost,
      required super.updateAtStr});

  @override
  String? get thumbnailUrl => null;

  @override
  DateTime? get dateTime {
    final datetime = int.tryParse(id) ?? 0;
    // logger.d('datetime: machi: $datetime, id: $id');
    return DateTime.fromMillisecondsSinceEpoch(datetime * 1000);
  }

  @override
  double get ikioi {
    if (resCount == -1) {
      return -1.0;
    }
    return getIkioi(int.tryParse(id) ?? 0, resCount);
  }
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class MachiContentBaseData {
  const MachiContentBaseData(
      {this.log = const [],
      required this.status,
      required this.bbs,
      required this.subject,
      required this.key});
  final List<MachiContentDataFromJson?> log;
  final String status;
  final String bbs;
  final String key;
  final String subject;

  factory MachiContentBaseData.fromJson(Map<String, dynamic> json) =>
      _$MachiContentBaseDataFromJson(json);

  Map<String, dynamic> toJson() => _$MachiContentBaseDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class MachiContentDataFromJson {
  const MachiContentDataFromJson(
      {required this.time,
      required this.no,
      required this.status,
      required this.mail,
      required this.host,
      required this.message,
      required this.name});

  final int no;
  final String time;
  final String status;
  final String name;
  final String mail;
  final String host;
  final String message;

  // String getUrl(final String boardId) =>
  //     '${MachiData.host}/${MachiData.threads}/$boardId/$key';

  factory MachiContentDataFromJson.fromJson(Map<String, dynamic> json) =>
      _$MachiContentDataFromJsonFromJson(json);

  Map<String, dynamic> toJson() => _$MachiContentDataFromJsonToJson(this);
}

@JsonSerializable()
@CopyWith()
@immutable
class MachiContentData extends ContentData with WithDateTime {
  const MachiContentData(
      {required super.forum,
      required super.index,
      required super.name,
      required this.email,
      required this.dateAndId,
      required super.body,
      super.title,
      super.urlSet,
      // required this.domain,
      // required this.directoryName,
      super.userId});
  // final String name;
  final String email;
  final String dateAndId;
  // final String? title;
  // final String domain;
  // final String directoryName;
  // final String? userId;
  // final List<String?>? urlSet;

  @override
  DateTime? get createdAt {
    try {
      final splited = dateAndId.split(' ');
      return getDateTime(splited[0], splited[1]);
    } catch (e) {
      logger.e('5ch: createdAt: $e');
    }
    return null;
  }

  @override
  String? get getPostId {
    final splited = dateAndId.split(' ');
    if (splited.length > 2) {
      final id = splited[2];
      final subtring = id.length > 3 ? id.substring(3) : '';
      // if(subtring.endsWith('●'))
      // logger.d('getId: splited: $splited, id:$id, sub:$subtring');

      return subtring == '???' ? null : subtring;
    }
    return null;
  }

  String? get getUserTrip {
    if (name.contains('◆') && name.contains('<b>')) {
      return name.substring(name.indexOf('◆'), name.lastIndexOf('<b>'));
    }
    return null;
  }

  @override
  String? get getUserName {
    String result = name;
    if (name.contains('<b>')) {
      final replaceTrip = name.replaceAll('$getUserTrip', '');
      final rep = replaceTrip.replaceAll('</b>', '');
      final re = rep.replaceAll('<b>', '');
      final r = re.trim();
      result = '$r $getUserTrip';
    }
    return result;
  }

  @override
  String? get getUserId => userId;

  @override
  Set<String?> get anchorList {
    final list = RegExp(r'>>[0-9]+').allMatches(body).toSet();
    // logger.d('anchor: ${list}');
    return list.map((e) => e.group(0)).toSet();
  }

  factory MachiContentData.fromJson(Map<String, dynamic> json) =>
      _$MachiContentDataFromJson(json);
  Map<String, dynamic> toJson() => _$MachiContentDataToJson(this);
}
