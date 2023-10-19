import 'package:model/src/importer.dart';

part 'chan4.g.dart';

class Chan4Data {
  static final host = Communities.chan4.host;
  static const hostAlt = '4channel.org';
  static const endpoint = '4cdn.org';
  static const endpointA = 'a.4cdn.org';
  static const endpointI = 'i.4cdn.org';
  static const boards = 'boards.json';
  static const catalog = 'catalog.json';
  static const sub = 'boards';
  static const mobileSub = 'p';
  static const endpointSub = 'a';
  static const thread = 'thread';
  static const search = 'search';
  // https://boards.4channel.org/a/thread/258411307
  // https://boards.4chan.org/a/thread/258411307
  // https://boards.4channel.org/a/thread/258459900/kawaii
  // https://is2.4chan.org/a/1697395658490192.jpg
  // https://a.4chan.org/a/thread/1697395658490192.json

  // https://boards.4channel.org/a/archive

  static Uri? getThumbnailUri(final int? tim, final String boardId) {
    if (tim == null) {
      return null;
    }
    return Uri.https(endpointI, '$boardId/${tim}s.jpg');
  }

  static Uri? getSrcUri(
      final int? tim, final String? ext, final String boardId) {
    if (tim == null || ext == null) {
      return null;
    }
    return Uri.https(endpointI, '$boardId/$tim$ext');
  }

  // https://a.4cdn.org/po/thread/570368.json
  static Uri? jsonToHtmlUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    // logger.d('getThreadIdFromUri: tob: $tob, uri: $uri');
    if (tob == null) {
      return null;
    }
    final threadId = getThreadIdFromUri(uri);
    final boardId = getBoardIdFromUri(uri);
    if (boardId == null) {
      return null;
    }
    if (tob && threadId != null) {
      return Uri.https('$sub.$host', '$boardId/$thread/$threadId');
    }
    if (!tob) {
      return Uri.https('$sub.$host', boardId);
    }
    return null;
  }

  static bool? uriIsThreadOrBoard(final Uri uri) {
    if (uri.host.contains(host) ||
        uri.host.contains(hostAlt) ||
        uri.host.contains(endpoint)) {
      final seg = uri.pathSegments;
      if (seg.isEmpty) {
        return null;
      }
      final hostName = uri.host.split('.');
      if (hostName.length == 2) {
        return null;
      }
      if (hostName.first == sub ||
          hostName.first == mobileSub ||
          hostName.first == endpointSub) {
        if (seg.first == search) {
          return null;
        }
        if (seg.length == 1) {
          return false;
        }
        if (seg.length >= 3) {
          final threadId = seg[2].replaceAll('.json', '');
          if (seg[1] == thread && int.tryParse(threadId) != null) {
            return true;
          }
        }
      }
    }

    return null;
  }

  static String? getThreadIdFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    // logger.d('getThreadIdFromUri: tob: $tob, uri: $uri');
    if (tob == null || !tob) {
      return null;
    }
    final seg = uri.pathSegments;
    final threadId = seg[2].replaceAll('.json', '');
    return threadId;
  }

  static String? getBoardIdFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null) {
      return null;
    }
    // final path = uri.path;
    final seg = uri.pathSegments;
    // logger.d('getBoardIdFromUri: $path, seg: $seg, tob:$tob');
    return seg.first;
  }
}

@JsonSerializable(createToJson: false, explicitToJson: true)
@immutable
class Chan4Boards {
  const Chan4Boards({required this.boards});
  final List<Chan4BoardData> boards;
  factory Chan4Boards.fromJson(Map<String, dynamic> json) =>
      _$Chan4BoardsFromJson(json);
}

@JsonSerializable(
    fieldRename: FieldRename.snake,
    createFactory: false,
    createToJson: false,
    explicitToJson: true)
@CopyWith()
@immutable
class Chan4BoardData extends BoardData {
  const Chan4BoardData(
      {required super.id,
      required super.name,
      required super.forum,
      required this.board,
      required this.title,
      required this.wsBoard,
      required this.perPage,
      required this.pages,
      required this.maxFilesize,
      required this.maxWebmFilesize,
      required this.maxCommentChars,
      required this.maxWebmDuration,
      required this.bumpLimit,
      required this.imageLimit,
      required this.cooldowns,
      required this.metaDescription,
      this.isArchived,
      this.spoilers,
      this.customSpoilers,
      this.boardFlags,
      this.countryFlags,
      this.userIds,
      this.oekaki,
      this.sjisTags,
      this.codeTags,
      this.mathTags,
      this.textOnly,
      this.forcedAnon,
      this.webmAudio,
      this.requireSubject,
      this.minImageWidth,
      this.minImageHeight});
  final String board;
  final String title;
  final int wsBoard;
  final int perPage;
  final int pages;
  final int maxFilesize;
  final int maxWebmFilesize;
  final int maxCommentChars;
  final int maxWebmDuration;
  final int bumpLimit;
  final int imageLimit;
  final Map<String, int> cooldowns;
  final String metaDescription;
  final int? isArchived;
  final int? spoilers;
  final int? customSpoilers;
  final Map<String, String>? boardFlags;
  final int? countryFlags;
  final int? userIds;
  final int? oekaki;
  final int? sjisTags;
  final int? codeTags;
  final int? mathTags;
  final int? textOnly;
  final int? forcedAnon;
  final int? webmAudio;
  final int? requireSubject;
  final int? minImageWidth;
  final int? minImageHeight;

  Uri get currentBoardUri => Uri.https('boards.${Chan4Data.host}', board);

  factory Chan4BoardData.fromJson(Map<String, dynamic> json) =>
      _chan4BoardDataFromJson(json);
}

Chan4BoardData _chan4BoardDataFromJson(Map<String, dynamic> json) {
  final id = json['board'] as String;
  final name = json['title'] as String;
  return Chan4BoardData(
    id: id,
    name: name,
    forum: Communities.chan4,
    board: id,
    title: name,
    wsBoard: json['ws_board'] as int,
    perPage: json['per_page'] as int,
    pages: json['pages'] as int,
    maxFilesize: json['max_filesize'] as int,
    maxWebmFilesize: json['max_webm_filesize'] as int,
    maxCommentChars: json['max_comment_chars'] as int,
    maxWebmDuration: json['max_webm_duration'] as int,
    bumpLimit: json['bump_limit'] as int,
    imageLimit: json['image_limit'] as int,
    cooldowns: Map<String, int>.from(json['cooldowns'] as Map),
    metaDescription: json['meta_description'] as String,
    isArchived: json['is_archived'] as int?,
    spoilers: json['spoilers'] as int?,
    customSpoilers: json['custom_spoilers'] as int?,
    boardFlags: (json['board_flags'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    countryFlags: json['country_flags'] as int?,
    userIds: json['user_ids'] as int?,
    oekaki: json['oekaki'] as int?,
    sjisTags: json['sjis_tags'] as int?,
    codeTags: json['code_tags'] as int?,
    mathTags: json['math_tags'] as int?,
    textOnly: json['text_only'] as int?,
    forcedAnon: json['forced_anon'] as int?,
    webmAudio: json['webm_audio'] as int?,
    requireSubject: json['require_subject'] as int?,
    minImageWidth: json['min_image_width'] as int?,
    minImageHeight: json['min_image_height'] as int?,
  );
}

@JsonSerializable(
  createToJson: false,
)
@CopyWith()
@immutable
class Chan4CatalogListData {
  const Chan4CatalogListData({required this.page, this.threads = const []});
  final int page;
  final List<Chan4BaseDataFromJson?> threads;

  factory Chan4CatalogListData.fromJson(Map<String, dynamic> json) =>
      _$Chan4CatalogListDataFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
@CopyWith()
@immutable
class Chan4BaseDataFromJson {
  const Chan4BaseDataFromJson({
    required this.no,
    required this.now,
    this.name,
    required this.resto,
    required this.time,
    this.sticky,
    this.closed,
    this.tim,
    this.sub,
    this.trip,
    this.id,
    this.com,
    this.capcode,
    this.country,
    this.countryName,
    this.filename,
    this.ext,
    this.fsize,
    this.md5,
    this.w,
    this.h,
    this.tnW,
    this.tnH,
    this.filedeleted,
    this.spoiler,
    this.customSpoiler,
    this.omittedPosts,
    this.omittedImages,
    this.replies,
    this.images,
    this.bumplimit,
    this.imagelimit,
    this.lastModified,
    this.tag,
    this.semanticUrl,
    this.since4pass,
    this.uniqueIps,
    this.mImg,
    this.lastReplies = const [],
    this.boardFlag,
    this.flagName,
    this.archived,
    this.archivedOn,
  });
  final int no;
  final String now;
  final String? name;
  final int resto;
  final int time;
  final int? sticky;
  final int? closed;
  final int? tim;
  final String? sub;
  final String? trip;
  final String? id;
  final String? com;
  final String? capcode;
  final String? country;
  final String? countryName;
  final String? filename;
  final String? ext;
  final int? fsize;
  final String? md5;
  final int? w;
  final int? h;
  final int? tnW;
  final int? tnH;
  final int? filedeleted;
  final int? spoiler;
  final int? customSpoiler;
  final int? omittedPosts;
  final int? omittedImages;
  final int? replies;
  final int? images;
  final int? bumplimit;
  final int? imagelimit;
  final int? lastModified;
  final String? tag;
  final String? semanticUrl;
  final int? since4pass;
  final int? uniqueIps;
  final int? mImg;
  final String? boardFlag;
  final String? flagName;
  final int? archived;
  final int? archivedOn;
  final List<Chan4BaseDataFromJson?> lastReplies;

  // @override
  // String? get thumbnailUrl {
  //   // if(ext == '.webm' || ext == '.pdf' || ext == '.swf'){
  //   return 'https://${Chan4Data.endpointI}/$boardId/${tim}s.jpg';
  //   // }
  //   // return 'https://${Chan4Data.endpointI}/$boardId/$tim$ext';
  // }

  factory Chan4BaseDataFromJson.fromJson(Map<String, dynamic> json) =>
      _$Chan4BaseDataFromJsonFromJson(json);
}

@CopyWith()
@immutable
class Chan4ThreadData extends ThreadData with WithDateTime {
  const Chan4ThreadData(
      {required super.id,
      required super.title,
      required super.resCount,
      required super.boardId,
      required super.type,
      required super.url,
      super.thumbnailStr,
      this.ext,
      this.tim,
      this.archived = false,
      this.time,
      this.lastModified});
  final String? ext;
  final int? tim;
  final bool archived;
  final int? time;
  final int? lastModified;

  @override
  double? get updateAt => lastModified?.toDouble();

  @override
  int? get createdAt => time;

  @override
  double get ikioi {
    if(time == null){
      return -1;
    }
    return getIkioi(time! * 1000, resCount);
  }

  @override
  String? get thumbnailUrl {
    final data = Chan4Data.getThumbnailUri(tim, boardId);
    if (data != null) {
      return data.toString();
    }
    return null;
  }

  @override
  DateTime? get dateTime {
    if (time == null) {
      return null;
    }
    // final datetime = int.tryParse(id) ?? 0;
    // logger.d('datetime: machi: $datetime, id: $id');
    return DateTime.fromMillisecondsSinceEpoch(time! * 1000);
  }
}

@JsonSerializable(
  createToJson: false,
)
@CopyWith()
@immutable
class Chan4ContentFromJson {
  const Chan4ContentFromJson({this.posts = const []});
  // final int page;
  final List<Chan4BaseDataFromJson?> posts;

  factory Chan4ContentFromJson.fromJson(Map<String, dynamic> json) =>
      _$Chan4ContentFromJsonFromJson(json);
}

// @JsonSerializable()
@CopyWith()
@immutable
class Chan4Content extends ContentData {
  const Chan4Content(
      {required super.forum,
      required super.index,
      required super.name,
      required super.body,
      super.title,
      super.urlSet,
      super.userId,
      required this.time,
      this.tim,
      this.ext,
      required this.boardId,
      required this.no,
      this.country,
      this.countryName,
      this.fileName});

  final int time;
  final int? tim;
  final String? ext;
  final String boardId;
  final int no;
  final String? country;
  final String? countryName;
  final String? fileName;

  @override
  String? get srcThumbnail {
    final data = Chan4Data.getThumbnailUri(tim, boardId);
    if (data != null) {
      return data.toString();
    }
    return null;
  }

  @override
  String? get srcContent {
    final data = Chan4Data.getSrcUri(tim, ext, boardId);
    if (data != null) {
      return data.toString();
    }
    return null;
  }

  @override
  DateTime get createdAt => DateTime.fromMillisecondsSinceEpoch(time * 1000);

  @override
  String? get getUserName => name;

  @override
  String? get getUserId => userId;

  @override
  Set<String?> get anchorList {
    final list = RegExp(r'>>[0-9]+').allMatches(body).toSet();
    // logger.d('anchor: ${list}');
    return list.map((e) => e.group(0)).toSet();
  }
}
