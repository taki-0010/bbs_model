import 'package:model/src/importer.dart';

part 'shitaraba.g.dart';

class ShitarabaData {
  static final host = Communities.shitaraba.host;
  static const sub = 'jbbs';
  static const threadPath = 'bbs/rawmode.cgi';
  static const htmlPath = 'bbs/read.cgi';
  static final topUrl = 'rentalbbs.shitaraba.com';
  static String getThreadUrlPath(
      {required final String category,
      required final String boardId,
      required final String threadId}) {
    return 'bbs/rawmode.cgi/$category/$boardId/$threadId';
  }

  static String favoriteBoardStr({
    required final String category,
    required final String boardId,
  }) {
    return '$category/$boardId';
  }

  static Uri? _validate(final String url) {
    final replasedRaw = url.replaceAll('$threadPath/', '');
    final data = replasedRaw.replaceAll('$htmlPath/', '');
    final uri = Uri.tryParse(data);
    if (uri == null) {
      return null;
    }
    return uri;
  }

  static bool validateUrl(final String url) {
    final uri = _validate(url);
    if (uri == null) {
      return false;
    }
    final domain = '$sub.$host';
    if (uri.host != domain) {
      return false;
    }
    logger.d('shitaraba val: $uri');
    final path = uri.pathSegments;
    if (path.length < 2) {
      return false;
    }
    final category = categoryName(path.first);
    if (category.isEmpty) {
      return false;
    }
    final boardId = int.tryParse(path[1]);
    if (boardId == null) {
      return false;
    }
    return true;
  }

  static String? getCategoryFromUrl(final String url) {
    final uri = _validate(url);
    if (uri == null) {
      return null;
    }
    final path = uri.pathSegments;
    if (path.length < 2) {
      return null;
    }
    return path.first;
  }

  static String? getBoardIdFromUrl(final String url) {
    final uri = _validate(url);
    if (uri == null) {
      return null;
    }
    final path = uri.pathSegments;
    if (path.length < 2) {
      return null;
    }
    return path[1];
  }

  static String? getFavoriteStr(final String url) {
    final category = getCategoryFromUrl(url);
    final boardId = getBoardIdFromUrl(url);
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
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class ShitarabaCategoryData {
  const ShitarabaCategoryData({
    required this.id,
    // this.boards = const []
  });
  final String id;
  // final List<BoardData?> boards;

  factory ShitarabaCategoryData.fromJson(Map<String, dynamic> json) =>
      _$ShitarabaCategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShitarabaCategoryDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class ShitarabaBoardData {
  const ShitarabaBoardData(
      {required this.id,
      required this.category,
      required this.name,
      required this.sub});
  final String id;
  final String category;
  final String name;
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
      {required super.index,
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
