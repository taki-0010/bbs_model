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
  static final domain = '$sub.$host';
  static const apiHost = 'bookmark.hatenaapis.com';

// https://b.hatena.ne.jp/hotentry.rss
// https://b.hatena.ne.jp/hotentry/general
  // https://b.hatena.ne.jp/hotentry/game.rss
  // https://bookmark.hatenaapis.com/count/entry?url=http%3A%2F%2Fwww.hatena.ne.jp%2F

  static String replaseStr(final String url) {
    final escape = Uri.encodeFull(url).toString();
    final slash = escape.replaceAll('/', '%2F');
    final colon = slash.replaceAll(':', '%3A');
    return colon;
  }

  static Uri boardUri(final HatenaCategory value) {
    if (value == HatenaCategory.all) {
      return Uri.https(domain, '${value.id}.rss');
    } else {
      return Uri.https(domain, '$hotentry/${value.id}.rss');
    }
  }

  static String boardNameById(final String id) {
    String? name;
    for (final i in HatenaCategory.values) {
      if (i.id == id) {
        name = i.label;
      }
    }
    return name ?? id;
  }
}

@immutable
class HatenaBoardData extends BoardData {
  const HatenaBoardData(
      {required super.id, required super.name, required super.forum});
}

@immutable
class HatenaThreadData extends ThreadData {
  const HatenaThreadData({
    required super.id,
    required super.title,
    required this.dec,
    required super.resCount,
    required super.boardId,
    required super.type,
    required super.url,
    this.tags = const [],
  });
  final String dec;
  // final String url;
  final List<String?> tags;
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
  final String count;
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
      {this.user, this.tags, this.timestamp, this.comment});
  final String? user;
  final dynamic tags;
  final dynamic timestamp;
  final String? comment;

  factory HatenaBookmarkData.fromJson(Map<String, dynamic> json) =>
      _$HatenaBookmarkDataFromJson(json);
}

@immutable
class HatenaContent extends ContentData {
  HatenaContent(
      {required super.forum,
      required super.index,
      required super.body,
      required super.name});
}
