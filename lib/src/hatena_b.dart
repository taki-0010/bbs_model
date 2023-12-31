import 'importer.dart';

part 'hatena_b.g.dart';

enum HatenaCategory {
  // all(label: '総合', id: 'hotentry'),
  genaral(label: '一般', id: 'general'),
  social(label: '世の中', id: 'social'),
  economics(label: '政治と経済', id: 'economics'),
  life(label: '暮らし', id: 'life'),
  knowledge(label: '学び', id: 'knowledge'),
  it(label: 'テクノロジー', id: 'it'),
  fun(label: 'おもしろ', id: 'fun'),
  entertainment(label: 'エンタメ', id: 'entertainment'),
  game(label: 'アニメとゲーム', id: 'game');

  const HatenaCategory({required this.label, required this.id});
  final String label;
  final String id;
}

class HatenaData {
  static final host = Communities.hatena.host;
  static const sub = 'b';
  static const hotentry = 'hotentry';
  static const entry = 'entry';
  static final domain = '$sub.$host';
  static const apiHost = 'bookmark.hatenaapis.com';

  // https://b.hatena.ne.jp/guide/guideline

  // https://b.hatena.ne.jp/-/report/bookmark?url=https%3A%2F%2Fwww.publickey1.jp%2Fblog%2F23%2Fpythonmojomacapplepython9c.html&user_name=bxmcr

  // https://b.hatena.ne.jp/-/report/entry?url=https%3A%2F%2Fpc.watch.impress.co.jp%2Fdocs%2Fcolumn%2Fsemicon%2F1541071.html
  // https
// https://b.hatena.ne.jp/entry/s/somethingorange.jp/entry/otakusabetu
  // http
// https://b.hatena.ne.jp/entry/somethingorange.jp/entry/otakusabetu
// https://b.hatena.ne.jp/hotentry.rss
// https://b.hatena.ne.jp/hotentry/general
  // https://b.hatena.ne.jp/hotentry/game.rss
  // https://bookmark.hatenaapis.com/count/entry?url=http%3A%2F%2Fwww.hatena.ne.jp%2F
// https://b.hatena.ne.jp/entry/s/pc.watch.impress.co.jp/docs/column/hothot/1540490.html
// https://b.hatena.ne.jp/hotentry/it
// https://b.hatena.ne.jp/entry/jsonlite/?url=http%3A%2F%2Fwww.hatena.ne.jp%2F

  // https://b.hatena.ne.jp/entry/4743822195490264335/comment/wittro

  // https://b.hatena.ne.jp/q/flutter?target=all&users=20&safe=on&sort=recent&date_range=5y
// https://b.hatena.ne.jp/entry/4740168581049266767/comment/blueboy

  static Uri boardUri(final String id) {
    return Uri.https(domain, '$hotentry/$id');
  }

  static String _getUrl(final Uri uri) {
    final path = uri.path;
    final seg = uri.pathSegments;
    final withHttps = seg[1] == 's';
    final index =
        withHttps ? path.indexOf('/s/') + 3 : path.indexOf('/$entry/') + 7;
    logger.d('hatena: getUrl: $path, seg: $seg');
    return path.substring(index);
    // final index = value.indexOf('/s/');
    // if (index != -1) {
    //   return value.substring(index + 3);
    // }
    // return null;
  }

  static Uri? htmlToJsonUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob != null && tob) {
      // final path = uri.path;
      final subed = _getUrl(uri);
      // if (subed != null) {
      final escaped = Uri.encodeComponent(subed);
      logger.d('hatena es: $escaped');
      return Uri.parse('https://$domain/$entry/jsonlite/?url=$escaped');
      // return Uri.parse('https://$domain/$entry/s/$escaped');
      // }
    }
    return null;
  }

  static Uri? commentUri(final ContentData item) {
    if (item is HatenaContent) {
      return Uri.https(domain, 'entry/${item.eid}/comment/${item.getUserName}');
    }
    return null;
  }

  static Uri reportCommentUri(
    final ContentData item,
    final String url,
  ) {
    final escaped = Uri.encodeComponent(url);
    return Uri.parse(
        'https://$domain/-/report/bookmark?url=$escaped&user_name=${item.name}');
  }

  static Uri reportThreadUri(final String url) {
    final escaped = Uri.encodeComponent(url);
    return Uri.parse('https://$domain/-/report/entry?url=$escaped');
  }

  static String parseThreadPath(final String url) {
    logger.d('hatena: parse: $url');
    final replased = url.substring(url.indexOf('://') + 3);
    final withHttps = url.startsWith('https');
    return '$domain/$entry/${withHttps ? 's/' : ''}$replased';
  }

  static bool? uriIsThreadOrBoard(final Uri uri) {
    final h = uri.host;
    if (h.contains(host) || apiHost == h) {
      final seg = uri.pathSegments;
      if (seg.isEmpty) {
        return null;
      }
      if (seg.first == 'guide') {
        return null;
      }
      logger.d('hatena flag: $seg');
      final s = h.split('.');
      if (s.length >= 4 && s.first == sub) {
        if (seg.length >= 2) {
          if (seg.first == hotentry) {
            if (boardNameById(seg.last) != null) {
              return false;
            }
          }
          if (seg.first == entry) {
            if (seg[2] == 'comment') {
              return null;
            }
            return true;
          }
        }
      }
    }
    return null;
  }

  // static String? getBoardIdFromUri(final Uri uri) {

  // }

  static Uri boardRssUri(final HatenaCategory value) {
    return Uri.https(domain, '$hotentry/${value.id}.rss');
    // if (value == HatenaCategory.all) {
    //   return Uri.https(domain, '${value.id}.rss');
    // } else {
    //   return Uri.https(domain, '$hotentry/${value.id}.rss');
    // }
  }

  static String? getThreadIdFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null || !tob) {
      return null;
    }
    final path = uri.path;
    final seg = uri.pathSegments;
    if (seg[1] == 'jsonlite' || seg[1] == 'json') {
      final param = uri.queryParameters;
      if (param.containsKey('url')) {
        final url = param['url']!;
        return Uri.decodeComponent(url);
      }
    } else {
      final withHttps = seg[1] == 's';
      final index =
          withHttps ? path.indexOf('/s/') + 3 : path.indexOf('/entry/') + 7;
      final subed = path.substring(index);
      // final subed = _getUrl(path);
      // if (subed != null) {
      final str = subed.startsWith('http')
          ? subed
          : 'http${withHttps ? 's' : ''}://$subed';
      return Uri.decodeComponent(str);
    }
    return null;
  }

  static String? boardNameById(final String id) {
    String? name;
    for (final i in HatenaCategory.values) {
      if (i.id == id) {
        name = i.label;
      }
    }
    return name;
  }

  static String? boardIdFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null) {
      return null;
    }
    if (tob) {
      return null;
    }
    final seg = uri.pathSegments;
    if (seg.length >= 2) {
      return seg[1];
    }
    return null;
  }

  static String? getCommentNameFromUri(final Uri uri) {
    if (uri.host.contains(host)) {
      final seg = uri.pathSegments;
      if (seg.length >= 4 && seg[2] == 'comment') {
        return seg.last;
      }
    }
    return null;
  }
}

@immutable
class HatenaBoardData extends BoardData {
  const HatenaBoardData(
      {required super.id, required super.name, required super.forum});
}

@CopyWith()
@immutable
class HatenaThreadData extends ThreadData with WithDateTime {
  const HatenaThreadData(
      {required super.id,
      required super.title,
      required this.dec,
      required super.resCount,
      required super.boardId,
      required super.type,
      required super.url,
      super.thumbnailFullUrl,
      this.tags = const [],
      super.thumbnailStr,
      this.dateStr,
      this.dateUtc,
      this.searched = false
      // required this.originalUrl
      });
  final String dec;
  // final String url;
  final List<String?> tags;
  final String? dateStr;
  final DateTime? dateUtc;
  final bool searched;
  // final String originalUrl;

  @override
  int? get createdAt {
    if (dateTime == null) {
      return null;
    }
    return dateTime!.millisecondsSinceEpoch;
  }

  @override
  DateTime? get dateTime {
    if (dateUtc != null) {
      return dateUtc;
    }
    if (dateStr == null) {
      return null;
    }
    final f = DateFormat('yyyy/MM/dd');
    return f.parse(dateStr!);
  }

  // SrcData? get thumbnail => thumbnailStr != null
  //     ? SrcData.fromJson(stringToJson(thumbnailStr!))
  //     : null;

  // String get url => '$directory.2chan.net/$boardId/res/$id.htm';
  @override
  String? get thumbnailUrl => thumbnailFullUrl;

  @override
  double get ikioi {
    if (searched) {
      return -1.0;
    }
    return getIkioi(createdAt ?? 0, resCount);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
@CopyWith()
@immutable
class HatenaEntryData {
  const HatenaEntryData(
      {required this.title,
      required this.count,
      required this.url,
      required this.entryUrl,
      required this.screenshot,
      required this.eid,
      this.bookmarks = const []});
  final String title;
  final int count;
  final String url;
  final String entryUrl;
  final String screenshot;
  final String eid;
  final List<HatenaBookmarkData?> bookmarks;

  factory HatenaEntryData.fromJson(Map<String, dynamic> json) =>
      _$HatenaEntryDataFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
@CopyWith()
@immutable
class HatenaBookmarkData {
  const HatenaBookmarkData(
      {required this.user,
      this.tags = const [],
      required this.timestamp,
      required this.comment});
  final String user;
  final List<String?> tags;
  final String timestamp;
  final String comment;

  factory HatenaBookmarkData.fromJson(Map<String, dynamic> json) =>
      _$HatenaBookmarkDataFromJson(json);
}

// class HatenaContentJson{
//   const HatenaContentJson({});
//   final String title;
//   final String eid;
//   final String screenshot;
//   final String entryUrl;
// }

@immutable
class HatenaContent extends ContentData {
  const HatenaContent(
      {required super.forum,
      required super.index,
      required super.body,
      required super.name,
      super.urlSet,
      super.title,
      this.email,
      // super.src,
      super.srcUrl,
      super.thumbUrl,
      required this.boardId,
      required this.eid,
      required this.timestamp});
  final String? email;
  final String eid;
  final String timestamp;
  final String boardId;

  @override
  String? get srcThumbnail => thumbUrl;

    @override
  String? get srcContent => thumbUrl;

  @override
  String? get getUserName => name;

  @override
  String? get getUserId => name;

  @override
  DateTime? get createdAt {
    if (timestamp.isEmpty) {
      return null;
    }
    try {
      final f = DateFormat('yyyy/MM/dd hh:mm');
      return f.parse(timestamp);
    } catch (e) {
      logger.e('hatena: createdAt: $e');
    }
    return null;
  }

  @override
  Uri? get avatarUri {
    // https://cdn.profile-image.st-hatena.com/users/mewton/profile.png
    return Uri.tryParse(
        'https://cdn.profile-image.st-hatena.com/users/$name/profile.png');
  }
}
