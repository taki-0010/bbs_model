import 'importer.dart';

part 'hatena_b.g.dart';

enum HatenaCategory {
  all(label: '総合', id: 'hotentry'),
  genaral(label: '一般', id: 'genaral'),
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

  // https://b.hatena.ne.jp/-/report/bookmark?url=https%3A%2F%2Fwww.publickey1.jp%2Fblog%2F23%2Fpythonmojomacapplepython9c.html&user_name=bxmcr

  // https://b.hatena.ne.jp/-/report/entry?url=https%3A%2F%2Fpc.watch.impress.co.jp%2Fdocs%2Fcolumn%2Fsemicon%2F1541071.html

// https://b.hatena.ne.jp/hotentry.rss
// https://b.hatena.ne.jp/hotentry/general
  // https://b.hatena.ne.jp/hotentry/game.rss
  // https://bookmark.hatenaapis.com/count/entry?url=http%3A%2F%2Fwww.hatena.ne.jp%2F
// https://b.hatena.ne.jp/entry/s/pc.watch.impress.co.jp/docs/column/hothot/1540490.html
// https://b.hatena.ne.jp/hotentry/it
// https://b.hatena.ne.jp/entry/jsonlite/?url=http%3A%2F%2Fwww.hatena.ne.jp%2F

  // https://b.hatena.ne.jp/entry/4743822195490264335/comment/wittro

  // https://b.hatena.ne.jp/q/flutter?target=all&users=20&safe=on&sort=recent&date_range=5y

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
    final replased = url.substring(url.indexOf('://') + 3);
    return '$domain/$entry/s/$replased';
  }

  static bool? uriIsThreadOrBoard(final Uri uri) {
    final h = uri.host;
    if (h.contains(host) || apiHost == h) {
      final s = h.split('.');
      if (s.length >= 4 && s.first == sub) {
        final seg = uri.pathSegments;
        if (seg.length >= 2) {
          if (seg.first == hotentry) {
            if (boardNameById(seg.last) != null) {
              return false;
            }
          }
          if (seg.first == entry) {
            return true;
          }
        }
      }
    }
    return null;
  }

  // static String? getBoardIdFromUri(final Uri uri) {

  // }

  static Uri boardUri(final HatenaCategory value) {
    if (value == HatenaCategory.all) {
      return Uri.https(domain, '${value.id}.rss');
    } else {
      return Uri.https(domain, '$hotentry/${value.id}.rss');
    }
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
      this.tags = const [],
      super.thumbnailStr,
      this.dateStr,
      this.dateUtc
      // required this.originalUrl
      });
  final String dec;
  // final String url;
  final List<String?> tags;
  final String? dateStr;
  final DateTime? dateUtc;
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

  SrcData? get thumbnail => thumbnailStr != null
      ? SrcData.fromJson(stringToJson(thumbnailStr!))
      : null;

  // String get url => '$directory.2chan.net/$boardId/res/$id.htm';
  @override
  String get thumbnailUrl => thumbnail?.thumbnailUri != null
      ? Uri.tryParse(thumbnail!.thumbnailUri!).toString()
      : '';

  @override
  double get ikioi {
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
      required this.eid,
      required this.timestamp});
  final String? email;
  final String eid;
  final String timestamp;

  @override
  String? get getUserName => name;

  @override
  String? get getUserId => name;

  @override
  DateTime? get createdAt {
    try {
      final f = DateFormat('yyyy/MM/dd hh:mm');
      return f.parse(timestamp);
    } catch (e) {
      logger.e('hatena: createdAt: $e');
    }
    return null;
  }
}
