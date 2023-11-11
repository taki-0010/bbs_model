import 'package:model/src/importer.dart';

part 'girls_ch.g.dart';

class GirlsChData {
  static final host = Communities.girlsCh.host;
  static const topics = 'topics';
  static const category = 'category';
  static const comment = 'comment';
  static final categoryPath = 'https://$host/$topics/$category';
  // https://girlschannel.net/comment/4828638/4483

  static bool? uriIsThreadOrBoard(final Uri uri) {
    if (!uri.host.contains(host)) {
      return null;
    }
    if (uri.path.contains(category)) {
      return false;
    }
    if (uri.path.contains(topics) || uri.path.contains(comment)) {
      return true;
    }
    return null;
  }

  static String? getBoardIdFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null) {
      return null;
    }
    final seg = uri.pathSegments;
    if (tob) {
      return null;
    }
    if (seg.length >= 3 && getBoardNameById(seg[2]) != null) {
      return seg[2];
    }
    return null;
  }

  static String? getThreadIdFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null || !tob) {
      return null;
    }
    final path = uri.pathSegments;
    if (path.length >= 2 && int.tryParse(path[1]) != null) {
      return path[1];
    }
    return null;
  }

  static int? getResNumFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null || !tob) {
      return null;
    }
    final path = uri.path;
    final seg = uri.pathSegments;
    if (path.contains(comment) && seg.length >= 3) {
      final str = seg[2];
      return int.tryParse(str);
    }
    return null;
  }

  static String? getBoardNameById(final String? id) {
    switch (id) {
      case 'animal':
        return '犬・猫・動物';
      case 'life':
        return '生活';
      case 'talk':
        return '質問・雑談';
      case 'news':
        return 'ニュース';
      case 'politics':
        return '政治・経済';
      case 'comic':
        return 'マンガ・アニメ・本';
      case 'work':
        return '仕事';
      case 'diet':
        return 'ダイエット';
      case 'hair':
        return '髪型';
      case 'movie':
        return 'ドラマ・映画';
      case 'cook':
        return '料理・食べ物';
      case 'fashion':
        return 'ファッション';
      case 'tech':
        return 'IT・インターネット';
      case 'images':
        return '画像';
      case 'tv':
        return 'テレビ・CM';
      case 'health':
        return '医療・健康';
      case 'gossip':
        return '芸能人';
      case 'cosme':
        return '美容・コスメ';
      case 'sports':
        return 'スポーツ';
      case 'music':
        return '音楽';
      case 'realtime':
        return '実況';
      case 'family':
        return '家族・子育て';
      case 'otona':
        return '大人';
      case 'love':
        return '恋愛・結婚';
      default:
        return null;
    }
  }
}

class GirlsChParser {
  static const createThreadUrl = 'https://girlschannel.net/topics/make_topic/';
  static final idReg = RegExp(r'[0-9]{5,}');
  static String? getIdFromUrl(final String value) {
    try {
      final id = idReg.allMatches(value);
      final data = id.first.group(0);
      return data;
    } catch (e) {
      logger.e(e);
    }
    return null;
  }
}

// @JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class GirlsChCategory extends BoardData {
  const GirlsChCategory(
      {required super.id,
      required super.name,
      required super.forum,
      required this.url});
  final String url;
  // final String name;
  // String get url => '/topics/category/$id/';
  // factory GirlsChCategory.fromJson(Map<String, dynamic> json) =>
  //     _$GirlsChCategoryFromJson(json);

  // Map<String, dynamic> toJson() => _$GirlsChCategoryToJson(this);
}

@CopyWith()
@immutable
class GirlsChThread extends ThreadData with WithDateTime {
  const GirlsChThread(
      {required super.id,
      required super.title,
      required super.resCount,
      // required super.lastIndex,
      required super.boardId,
      required super.type,
      required super.url,
      // super.threadLength,
      // super.difference,
      super.isNewPost,
      super.thumbnailFullUrl,
      super.thumbnailStr,
      required super.updateAtStr});
  // final String? img;
  // final String categoryId;

  // String get url => '/topics/$id/';

  @override
  double? get updateAt {
    if (dateTime == null) {
      return -1;
    }
    return dateTime!.millisecondsSinceEpoch * 0.001;
  }

  // SrcData? get thumbnail => thumbnailStr != null
  //     ? SrcData.fromJson(stringToJson(thumbnailStr!))
  //     : null;

  @override
  String? get thumbnailUrl => thumbnailFullUrl;

  @override
  DateTime? get dateTime {
    if (updateAtStr == null) {
      return null;
    }
    final splited = updateAtStr!.split(' ');
    final datetime = splited.isNotEmpty ? splited.first : null;
    final daytime = splited.isNotEmpty ? splited.last : null;
    if (datetime == null || daytime == null) {
      return null;
    }
    return getDateTime(datetime, '$daytime:00');
  }

  // @override
  // double get ikioi {
  //   if (dateTime == null) {
  //     return 0.0;
  //   }
  //   // final splited = updateAtStr!.split(' ');
  //   // final datetime = splited.isNotEmpty ? splited.first : null;
  //   // final daytime = splited.isNotEmpty ? splited.last : null;
  //   // if (datetime == null || daytime == null) {
  //   //   return 0.0;
  //   // }
  //   // final dateTime = getDateTime(datetime, '$daytime:00');
  //   final createdAt = dateTime!.toUtc().millisecondsSinceEpoch * 0.001;
  //   return getIkioi(createdAt.toInt(), resCount);
  // }
}

@JsonSerializable()
@CopyWith()
@immutable
class GirlsChContent extends ContentData with WithDateTime {
  const GirlsChContent(
      {required super.forum,
      required super.index,
      required super.name,
      required super.body,
      // super.src,
      required this.plus,
      required this.minus,
      required this.postAt,
      super.title,
      required this.categoryId,
      super.srcUrl,
      super.thumbUrl,
      this.id,
      super.threadThumbnail,
      super.urlSet,
      this.reportHash});
  // final int index;
  // final String name;
  // final String body;
  // final String? img;
  final int plus;
  final int minus;
  final String postAt;
  // final String? title;
  final String? id;
  final String categoryId;
  final String? reportHash;

  // 2023/08/25(金) 16:35:32

  @override
  DateTime get createdAt {
    final splited = postAt.split(' ');
    return getDateTime(splited[0], splited[1]);
  }

  @override
  String? get srcThumbnail => thumbUrl;
  @override
  String? get srcContent => srcUrl;

  @override
  String? get getPostId => id;

  @override
  String? get getUserName => name;

  @override
  Set<String?> get anchorList {
    final list = RegExp(r'>>[0-9]+').allMatches(body).toSet();
    // logger.d('anchor: ${list}');
    return list.map((e) => e.group(0)).toSet();
  }

  factory GirlsChContent.fromJson(Map<String, dynamic> json) =>
      _$GirlsChContentFromJson(json);
  Map<String, dynamic> toJson() => _$GirlsChContentToJson(this);
}

@immutable
class GirlsPages {
  const GirlsPages(
      {this.first, this.prev, this.next, this.last, required this.current});
  final int? first;
  final int? prev;
  final int? next;
  final int? last;
  final int current;
}
