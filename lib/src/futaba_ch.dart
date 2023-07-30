import 'importer.dart';

part 'futaba_ch.g.dart';

@CopyWith()
@immutable
class FutabaChBoard extends BoardData {
  const FutabaChBoard(
      {required super.id, required super.name, required this.directory});
  final String directory;
  // final String name;
  String get catalog => '?mode=cat';
  String get sort => '?sort=';
  String get path => '//$directory.2chan.net/$id';
  String get url => '$path/futaba.htm';
  String get catalogUrl => '$path/futaba.php$catalog';
  String get newListUrl => '$path/futaba.php$catalog${sort}1';
  String get oldListUrl => '$path/futaba.php$catalog${sort}2';
  String get hugListUrl => '$path/futaba.php$catalog${sort}3';
  String get ikioiListUrl => '$path/futaba.php$catalog${sort}6';
}

@CopyWith()
@immutable
class FutabaChThread extends ThreadData {
  const FutabaChThread({
    required super.id,
    required super.title,
    required super.resCount,
    super.img,
    required this.directory,
    required super.boardId,
    super.difference,
    super.isNewPost,
  });
  // final String boardId;
  final String directory;

  String get url => '$directory.2chan.net/$boardId/res/$id.htm';
  @override
  String get thumbnailUrl => 'https://$directory.2chan.net$img';
}

@JsonSerializable()
@CopyWith()
@immutable
class FutabaChContent extends ContentData with WithDateTime {
  const FutabaChContent(
      {required super.index,
      this.thumbnail,
      this.src,
      required super.body,
      required this.number,
      required this.created,
      required this.agree,
      required this.name,
      required this.directory,
      this.title,
      this.quotes = const []});
  final String? thumbnail;
  final String? src;
  final int number;
  final String created;
  final int? agree;
  final String? title;
  final String name;
  final String directory;
  final List<String?> quotes;

  String? get thumnailUrl =>
      thumbnail != null ? 'https://$directory.2chan.net/$thumbnail' : null;
  String? get scrUrl =>
      src != null ? 'https://$directory.2chan.net/$src' : null;

  @override
  DateTime get createdAt {
    final datetime = created.substring(0, created.indexOf('('));
    final daytime = created.substring(created.indexOf(')') + 1);
    // logger.d('createdAt: $datetime, daytime: $daytime');
    // if (daytime == null) {
    //   return DateTime.now();
    // }

    return getDateTime(datetime, daytime);
  }

  @override
  String get getId {
    final idIndex = created.indexOf('ID:');
    return idIndex == -1 ? '' : created.substring(idIndex + 3);
  }

  String get getIp {
    final ipIndex = created.indexOf('IP:');
    return ipIndex == -1 ? '' : created.substring(ipIndex + 3);
  }

  @override
  Set<String?> get anchorList {
    final line = quotes.map((e) {
      final i = e?.replaceAll(RegExp(r'^>+'), '');
      return i?.replaceAll(RegExp(r'$\R'), '');
    }).toSet();
    return line;
  }

  // >+No.[0-9]+
  // >+.+

  factory FutabaChContent.fromJson(Map<String, dynamic> json) =>
      _$FutabaChContentFromJson(json);
  Map<String, dynamic> toJson() => _$FutabaChContentToJson(this);
}
