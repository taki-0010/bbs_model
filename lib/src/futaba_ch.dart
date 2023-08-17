import 'importer.dart';

part 'futaba_ch.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class FutabaChBoard {
  const FutabaChBoard({required this.directory, required this.path});
  final String directory;
  final String path;
  // final String name;
  String get catalog => '?mode=cat';
  String get sort => '&sort=';
  // String get path => '//$directory.2chan.net/$id';
  String get url => '$path/futaba.htm';
  String get catalogUrl => '$path/futaba.php$catalog';
  String get newListUrl => '$path/futaba.php$catalog${sort}1';
  String get oldListUrl => '$path/futaba.php$catalog${sort}2';
  String get hugListUrl => '$path/futaba.php$catalog${sort}3';
  String get ikioiListUrl => '$path/futaba.php$catalog${sort}6';

  factory FutabaChBoard.fromJson(Map<String, dynamic> json) =>
      _$FutabaChBoardFromJson(json);

  Map<String, dynamic> toJson() => _$FutabaChBoardToJson(this);
}

@CopyWith()
@immutable
class FutabaChThread extends ThreadData with WithDateTime {
  const FutabaChThread({
    required super.id,
    required super.title,
    required super.resCount,
    // required super.lastIndex,
    super.thumbnailStr,
    // super.thumbnail,
    required this.directory,
    required super.boardId,
    required super.type,
    required super.url,
    // super.difference,
    super.isNewPost,
    super.updateAtStr,
    super.catalog,
  });
  // final String boardId;
  final String directory;

    SrcData? get thumbnail => thumbnailStr != null
      ? SrcData.fromJson(stringToJson(thumbnailStr!))
      : null;

  // String get url => '$directory.2chan.net/$boardId/res/$id.htm';
  @override
  String get thumbnailUrl => 'https://$directory.2chan.net${thumbnail?.thumbnailUri}';
   @override
  double get ikioi {
    // final current = DateTime.now().millisecondsSinceEpoch * 0.001;
    // // final createdNum = datId.substring(0, datId.length - 4);
    // final created = int.tryParse(id) ?? 0;
    // final diviDay = ((current - created) / 86400);
    // final result = resCount / diviDay;
    // // logger.d(
    // //     'ikioi: $result, resCount:$resCount, current:$current, datId:$datId, created:$createdNum, diviDay:$diviDay');
    // return double.tryParse(result.toStringAsFixed(2)) ?? 0;
    return getIkioi(int.tryParse(id) ?? 0, resCount);
  }
}

@JsonSerializable()
@CopyWith()
@immutable
class FutabaChContent extends ContentData with WithDateTime {
  const FutabaChContent(
      {required super.index,
      // this.thumbnail,
      super.src,
      required super.body,
      required this.number,
      required this.created,
      required this.agree,
      required super.name,
      required this.directory,
      this.title,
      
      this.quotes = const []});
  // final String? thumbnail;
  // final String? src;
  final int number;
  final String created;
  final int? agree;
  final String? title;
  // final String name;
  final String directory;
  final List<String?> quotes;

  @override
  String? get srcThumbnail => src?.thumbnailUri != null
      ? 'https://$directory.2chan.net/${src?.thumbnailUri}'
      : null;

  @override
  String? get srcContent => src?.srcUri != null
      ? 'https://$directory.2chan.net/${src?.srcUri}'
      : null;

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
