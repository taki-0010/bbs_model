import 'package:model/src/importer.dart';

part 'girls_ch.g.dart';

@CopyWith()
@immutable
class GirlsChCategory extends BoardData {
  const GirlsChCategory({required super.id, required super.name});
  // final String url;
  // final String name;
  String get url => '/topics/category/$id/';

    @override
  Communities? get type => Communities.girlsCh;
}

@CopyWith()
@immutable
class GirlsChThread extends ThreadData with WithDateTime {
  const GirlsChThread(
      {required super.id,
      required super.title,
      required super.resCount,
      required super.boardId,
      super.difference,
      super.isNewPost,
      super.img,
      required super.updateAtStr});
  // final String? img;
  // final String categoryId;

  String get url => '/topics/$id/';
  @override
  String? get thumbnailUrl => img?.thumbnailUri;

  @override
  double get ikioi {
    if (updateAtStr == null) {
      return 0.0;
    }
    final splited = updateAtStr!.split(' ');
    final datetime = splited.firstOrNull;
    final daytime = splited.lastOrNull;
    if (datetime == null || daytime == null) {
      return 0.0;
    }
    final dateTime = getDateTime(datetime, '$daytime:00');
    final createdAt = dateTime.toUtc().millisecondsSinceEpoch * 0.001;
    return getIkioi(createdAt.toInt(), resCount);
  }
}

@JsonSerializable()
@CopyWith()
@immutable
class GirlsChContent extends ContentData with WithDateTime {
  const GirlsChContent(
      {required super.index,
      required this.name,
      required super.body,
      super.src,
      required this.plus,
      required this.minus,
      required this.postAt,
      this.title,
      required this.categoryId,
      this.id,
      super.urlSet});
  // final int index;
  final String name;
  // final String body;
  // final String? img;
  final int plus;
  final int minus;
  final String postAt;
  final String? title;
  final String? id;
  final String categoryId;

  @override
  DateTime get createdAt {
    final splited = postAt.split(' ');
    return getDateTime(splited[0], splited[1]);
  }

  @override
  String? get srcThumbnail => src?.srcUri;
  @override
  String? get srcContent => src?.srcUri;

  @override
  String get getId => id ?? '';

  @override
  Set<String?> get anchorList {
    final list = RegExp(r'>>[0-9]*').allMatches(body).toSet();
    // logger.d('anchor: ${list}');
    return list.map((e) => e.group(0)).toSet();
  }

  factory GirlsChContent.fromJson(Map<String, dynamic> json) =>
      _$GirlsChContentFromJson(json);
  Map<String, dynamic> toJson() => _$GirlsChContentToJson(this);
}
