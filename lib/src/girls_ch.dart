import 'package:model/src/importer.dart';

part 'girls_ch.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class GirlsChCategory {
  const GirlsChCategory({required this.url});
  final String url;
  // final String name;
  // String get url => '/topics/category/$id/';
      factory GirlsChCategory.fromJson(Map<String, dynamic> json) =>
      _$GirlsChCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$GirlsChCategoryToJson(this);

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
      // super.difference,
      super.isNewPost,
      // super.thumbnail,
      super.thumbnailStr,
      required super.updateAtStr});
  // final String? img;
  // final String categoryId;

  // String get url => '/topics/$id/';

  SrcData? get thumbnail => thumbnailStr != null
      ? SrcData.fromJson(stringToJson(thumbnailStr!))
      : null;

  @override
  String? get thumbnailUrl => thumbnail?.thumbnailUri;

  @override
  double get ikioi {
    if (updateAtStr == null) {
      return 0.0;
    }
    final splited = updateAtStr!.split(' ');
    final datetime = splited.isNotEmpty ? splited.first : null;
    final daytime =  splited.isNotEmpty ? splited.last : null;
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
      required super.name,
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
  // final String name;
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
