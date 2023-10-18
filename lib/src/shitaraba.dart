import 'package:model/src/importer.dart';

part 'shitaraba.g.dart';

enum RangeList {
  to1000(min: 1, max: 1000),
  to2000(min: 1001, max: 2000),
  to3000(min: 2001, max: 3000),
  to4000(min: 3001, max: 4000),
  to5000(min: 4001, max: 5000),
  to6000(min: 5001, max: 6000),
  to7000(min: 6001, max: 7000),
  to8000(min: 7001, max: 8000),
  to9000(min: 8001, max: 9000),
  to10000(min: 9001, max: 10000),
  last1000(min: 0, max: 0);

  const RangeList({required this.min, required this.max});
  final int min;
  final int max;
}

class ShitarabaData {
  static final host = Communities.shitaraba.host;
  static const sub = 'jbbs';
  static const threadPath = 'bbs/rawmode.cgi';
  static const htmlPath = 'bbs/read.cgi';
  static const writePath = 'bbs/write.cgi';
  static const subjectPath = 'bbs/subject.cgi';
  static const search = 'jbbs/search/';
  static final topUrl = 'rentalbbs.shitaraba.com';
  static const subject = 'subject.txt';
  static final idReg = RegExp(r'[0-9]{8,}');

  // board
  //pc https://jbbs.shitaraba.net/music/28333/
  //mb https://jbbs.shitaraba.net/bbs/subject.cgi/music/28333/
  // thread
  //htm https://jbbs.shitaraba.net/bbs/read.cgi/music/28333/1696818255/l50
  //dat https://jbbs.shitaraba.net/bbs/rawmode.cgi/music/28333/1696818255/l50

  // report
  // https://rentalbbs.shitaraba.com/jbbs/user_inquiry/?dir=music&bbs=28333

  static String reportUrl(final String category, final String boardId) {
    return 'https://rentalbbs.shitaraba.com/jbbs/user_inquiry/?dir=$category&bbs=$boardId';
  }

  static String getThreadUrlPath(
      {required final String category,
      required final String boardId,
      required final String threadId}) {
    return 'bbs/rawmode.cgi/$category/$boardId/$threadId';
  }

  static String htmlUrl(
      {required final String category,
      required final String boardId,
      required final String threadId}) {
    return '$sub.$host/$htmlPath/$category/$boardId/$threadId';
  }

  static Uri? htmlToDatUri(final Uri uri) {
    final category = getCategoryFromUri(uri);
    final boardId = getBoardIdFromUri(uri);
    final threadId = getThreadIdFromUri(uri);
    if (category != null && boardId != null && threadId != null) {
      final path = getThreadUrlPath(
          category: category, boardId: boardId, threadId: threadId);
      return Uri.https(uri.host, path);
    }
    return null;
  }

  static String favoriteBoardStr({
    required final String category,
    required final String boardId,
  }) {
    return '$category/$boardId';
  }

  static bool? uriIsThreadOrBoard(final Uri uri) {
    if (!uri.host.contains(host)) {
      return null;
    }
    final path = uri.path;
    if (path.contains(htmlPath) || path.contains(threadPath)) {
      return true;
    }
    final seg = uri.pathSegments;
    if (seg.length >= 2) {
      int? boardId;
      if (uri.path.contains(subjectPath)) {
        boardId = int.tryParse(seg[3]);
      } else {
        boardId = int.tryParse(seg[1]);
      }
      if (boardId != null) {
        return false;
      }
    }
    return null;
  }

  // static Uri? _validate(final String url) {
  //   final replasedRaw = url.replaceAll('$threadPath/', '');
  //   final data = replasedRaw.replaceAll('$htmlPath/', '');
  //   final uri = Uri.tryParse(data);
  //   if (uri == null) {
  //     return null;
  //   }
  //   return uri;
  // }

  // static bool validateUrl(final String url) {
  //   final uri = _validate(url);
  //   if (uri == null) {
  //     return false;
  //   }
  //   final domain = '$sub.$host';
  //   if (uri.host != domain) {
  //     return false;
  //   }
  //   logger.d('shitaraba val: $uri');
  //   final path = uri.pathSegments;
  //   if (path.length < 2) {
  //     return false;
  //   }
  //   final category = categoryName(path.first);
  //   if (category.isEmpty) {
  //     return false;
  //   }
  //   final boardId = int.tryParse(path[1]);
  //   if (boardId == null) {
  //     return false;
  //   }
  //   return true;
  // }

  // static String? getCategoryFromUrl(final String url) {
  //   final uri = _validate(url);
  //   if (uri == null) {
  //     return null;
  //   }
  //   final path = uri.pathSegments;
  //   if (path.length < 2) {
  //     return null;
  //   }
  //   return path.first;
  // }

  // static String? getBoardIdFromUrl(final String url) {
  //   final uri = _validate(url);
  //   if (uri == null) {
  //     return null;
  //   }
  //   final path = uri.pathSegments;
  //   if (path.length < 2) {
  //     return null;
  //   }
  //   return path[1];
  // }

  // static String? getThreadIdFromUrl(final String url) {
  //   final uri = _validate(url);
  //   if (uri == null) {
  //     return null;
  //   }
  //   final id = idReg.allMatches(url);
  //   if (id.length >= 2) {
  //     return id.elementAt(1).group(0);
  //   }
  //   final data = id.first.group(0);
  //   return data;
  // }

  static String? getCategoryFromUri(final Uri uri) {
    final threadOrBoard = uriIsThreadOrBoard(uri);
    if (threadOrBoard == null) {
      return null;
    }
    final path = uri.path;
    final seg = uri.pathSegments;
    if (path.contains('bbs/')) {
      if (seg.length >= 4) {
        return seg[2];
      }
    }
    if (seg.length >= 2) {
      return seg[0];
    }
    return null;
  }

  static String? getBoardIdFromUri(final Uri uri) {
    final threadOrBoard = uriIsThreadOrBoard(uri);
    if (threadOrBoard == null) {
      return null;
    }
    final path = uri.path;
    final seg = uri.pathSegments;
    if (path.contains('bbs/')) {
      if (seg.length >= 4) {
        return seg[3];
      }
    }
    if (seg.length >= 2) {
      return seg[1];
    }
    return null;
  }

  static String? getThreadIdFromUri(final Uri uri) {
    final threadOrBoard = uriIsThreadOrBoard(uri);
    if (threadOrBoard == null || !threadOrBoard) {
      return null;
    }
    final path = uri.path;
    final mached = idReg.firstMatch(path);
    if (mached != null) {
      return mached.group(0);
    }
    return null;
  }

  static int? getResNumFromUri(final Uri uri) {
    final threadOrBoard = uriIsThreadOrBoard(uri);
    if (threadOrBoard == null || !threadOrBoard) {
      return null;
    }
    final seg = uri.pathSegments;
    if (seg.length >= 6) {
      final str = seg.last;
      return StringMethodData.getResNum(str);
    }
    return null;
  }

  static String? getFavoriteStr(final Uri uri) {
    final category = getCategoryFromUri(uri);
    final boardId = getBoardIdFromUri(uri);
    if (category != null && boardId != null) {
      return favoriteBoardStr(category: category, boardId: boardId);
    }
    return null;
  }

  static String categoryName(final String value) {
    switch (value) {
      case 'music':
        return '音楽/芸能/芸術/ファッション';
      case 'game':
        return 'ゲーム/囲碁/将棋';
      case 'netgame':
        return 'ネットゲーム/オンラインゲーム';
      case 'computer':
        return 'コンピュータ';
      case 'internet':
        return 'インターネット';
      case 'sports':
        return 'スポーツ/趣味/健康';
      case 'otaku':
        return '同人/コミケ/二次創作';
      case 'travel':
        return '旅行/地域';
      case 'school':
        return '学校/受験/学生コミュニティ';
      case 'movie':
        return '映画/テレビ/本/サブカル';
      case 'anime':
        return 'アニメ/アニメグッズ';
      case 'comic':
        return 'マンガ';
      case 'business':
        return 'ビジネス/経済';
      case 'auto':
        return '自動車/バイク/乗り物';
      case 'study':
        return '学問/人文/科学';
      case 'news':
        return 'ニュース/マスメディア/政治';
      case 'shop':
        return 'ショッピング/流通';
      case 'radio':
        return 'ラジオ/ネットラジオ';
      case 'r18':
        return 'アダルト';
      default:
        return '';
    }
  }

  static String categoryEmoji(final String value) {
    switch (value) {
      case 'music':
        return '🎤';
      case 'game':
        return '🎮';
      case 'netgame':
        return '🕹️';
      case 'computer':
        return '💻️';
      case 'internet':
        return '📱';
      case 'sports':
        return '⚽';
      case 'otaku':
        return '👩‍🎨';
      case 'travel':
        return '🛩️';
      case 'school':
        return '🏫';
      case 'movie':
        return '🎞️';
      case 'anime':
        return '📺️';
      case 'comic':
        return '🎨';
      case 'business':
        return '📈';
      case 'auto':
        return '🚗';
      case 'study':
        return '👩‍🎓';
      case 'news':
        return '👩‍🏫';
      case 'shop':
        return '🏬';
      case 'radio':
        return '📻';
      case 'r18':
        return '🔞';
      default:
        return '';
    }
  }

  static RangeList? getRange(final ThreadBase thread) {
    if (thread.type != Communities.shitaraba) {
      return null;
    }
    if (thread is ThreadData) {
      return RangeList.last1000;
    }
    if (thread is ThreadMarkData) {
      return thread.range;
    }
    return null;
    // final range = RangeList.values.firstWhere(
    //   (element) =>
    //       element.min <= lastOpenedIndex && element.max >= lastOpenedIndex,
    //   orElse: () => RangeList.to1000,
    // );
    // return range;
  }

  static String getRangePath(final RangeList range) {
    if (range == RangeList.last1000) {
      return 'l1000';
    }
    return '${range.min}-${range.max}';
  }

  static List<RangeList?> getRangeList(final int resCount) {
    if (resCount <= 1000) {
      return [];
    }
    final list =
        RangeList.values.where((element) => element.min <= resCount).toList();
    return list;
  }
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class ShitarabaCategoryData extends BoardData {
  const ShitarabaCategoryData({
    required super.id,
    required super.name,
    required super.forum,
    // this.boards = const []
  });
  // final String id;
  // final List<BoardData?> boards;

  factory ShitarabaCategoryData.fromJson(Map<String, dynamic> json) =>
      _$ShitarabaCategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShitarabaCategoryDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class ShitarabaBoardData extends BoardData {
  const ShitarabaBoardData(
      {required super.id,
      required super.name,
      required super.forum,
      required this.category,
      required this.sub});
  // final String id;
  final String category;
  // final String name;
  final String sub;

  factory ShitarabaBoardData.fromJson(Map<String, dynamic> json) =>
      _$ShitarabaBoardDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShitarabaBoardDataToJson(this);
}

@CopyWith()
@immutable
class ShitarabaThreadData extends ThreadData with WithDateTime {
  const ShitarabaThreadData(
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
  int? get createdAt => int.tryParse(id);

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

@JsonSerializable()
@CopyWith()
@immutable
class ShitarabaContentData extends ContentData with WithDateTime {
  const ShitarabaContentData(
      {required super.forum,
      required super.index,
      required super.name,
      this.email,
      // required this.dateAndId,
      required super.body,
      super.title,
      super.urlSet,
      required this.category,
      required this.boardId,
      required this.id,
      required this.date,
      // required this.domain,
      // required this.directoryName,
      super.userId});
  // final String name;
  final String? email;
  final String category;
  final String boardId;
  final String id;
  final String date;

  @override
  DateTime? get createdAt {
    try {
      final splited = date.split(' ');
      final first = splited.first.substring(0, date.indexOf('('));
      return getDateTime(first, splited[1]);
    } catch (e) {
      logger.e('shitaraba: createdAt: $e');
    }
    return null;
  }

  @override
  String? get getPostId {
    // final splited = dateAndId.split(' ');
    // if (splited.length > 2) {
    //   final id = splited[2];
    //   final subtring = id.length > 3 ? id.substring(3) : '';
    //   // if(subtring.endsWith('●'))
    //   // logger.d('getId: splited: $splited, id:$id, sub:$subtring');

    //   return subtring == '???' ? null : subtring;
    // }
    return id;
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

  factory ShitarabaContentData.fromJson(Map<String, dynamic> json) =>
      _$ShitarabaContentDataFromJson(json);
  Map<String, dynamic> toJson() => _$ShitarabaContentDataToJson(this);
}
