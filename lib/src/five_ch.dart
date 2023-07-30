import 'importer.dart';

part 'five_ch.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
@CopyWith()
@immutable
class FiveChBoardMetaData {
  const FiveChBoardMetaData(
      {required this.lastModifyString,
      required this.description,
      required this.lastModify,
      required this.menuList});
  final String lastModifyString;
  final String description;
  final int lastModify;
  final List<FiveChBoardCategoryJsonData> menuList;

  factory FiveChBoardMetaData.fromJson(Map<String, dynamic> json) =>
      _$FiveChBoardMetaDataFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
@CopyWith()
@immutable
class FiveChBoardCategoryJsonData {
  const FiveChBoardCategoryJsonData(
      {required this.categoryNumber,
      required this.categoryName,
      required this.categoryContent});
  final String categoryNumber;
  final String categoryName;
  final List<FiveChBoardJsonData> categoryContent;

  factory FiveChBoardCategoryJsonData.fromJson(Map<String, dynamic> json) =>
      _$FiveChBoardCategoryJsonDataFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
@CopyWith()
@immutable
final class FiveChBoardJsonData {
  const FiveChBoardJsonData(
      {required this.categoryOrder,
      required this.directoryName,
      required this.url,
      required this.category,
      required this.categoryName,
      required this.boardName});
  final int categoryOrder;
  final String directoryName;
  final String url;
  final int category;
  final String categoryName;
  final String boardName;

  factory FiveChBoardJsonData.fromJson(Map<String, dynamic> json) =>
      _$FiveChBoardJsonDataFromJson(json);
}

@CopyWith()
@immutable
class FiveChCategoryData extends BoardData {
  const FiveChCategoryData(
      {required super.id,
      required super.name,
      required this.categoryNumber,
      required this.categoryContent});
  final String categoryNumber;
  final List<FiveChBoardData> categoryContent;
}

@CopyWith()
@immutable
class FiveChBoardData extends BoardData {
  const FiveChBoardData(
      {required super.id,
      required super.name,
      required this.url,
      required this.category,
      required this.categoryOrder,
      required this.categoryName,
      required this.directoryName});
  final int categoryOrder;
  final String directoryName;
  final String url;
  final int category;
  final String categoryName;

  String? get domain {
    final replaced = url.replaceFirst('https://', '');
    final domain = replaced.substring(0, replaced.indexOf('/'));
    return domain;
  }
}

@CopyWith()
@immutable
class FiveChThreadTitleData extends ThreadData with WithDateTime {
  const FiveChThreadTitleData(
      {required super.id,
      required super.title,
      required super.resCount,
      required this.filesize,
      required this.permission,
      required this.lastmodifyNum,
      required this.domain,
      required super.boardId,
      super.difference,
      super.isNewPost,
      required super.updateAtStr});
  final int filesize;
  final String permission;
  final int lastmodifyNum;
  final String domain;
  // final String boardId;

  // String get datId {
  //   return '$id.dat';
  // }

  @override
  String? get thumbnailUrl => null;

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
class FiveChThreadContentData extends ContentData with WithDateTime {
  const FiveChThreadContentData(
      {required super.index,
      required this.name,
      this.email,
      required this.dateAndId,
      required super.body,
      this.title,
      super.urlSet,
      required this.domain,
      required this.directoryName});
  final String name;
  final String? email;
  final String dateAndId;
  final String? title;
  final String domain;
  final String directoryName;
  // final List<String?>? urlSet;

  @override
  DateTime get createdAt {
    final splited = dateAndId.split(' ');
    return getDateTime(splited[0], splited[1]);
  }

  @override
  String get getId {
    final splited = dateAndId.split(' ');
    if (splited.isNotEmpty) {
      final id = splited[2];
      final subtring = id.length > 3 ? id.substring(3) : '';
      // if(subtring.endsWith('●'))
      // logger.d('getId: id:$id, sub:$subtring');

      return subtring == '???' ? '' : subtring;
    }
    return '';
  }

  @override
  Set<String?> get anchorList {
    final list = RegExp(r'>>[0-9]*').allMatches(body).toSet();
    // logger.d('anchor: ${list}');
    return list.map((e) => e.group(0)).toSet();
  }

  factory FiveChThreadContentData.fromJson(Map<String, dynamic> json) =>
      _$FiveChThreadContentDataFromJson(json);
  Map<String, dynamic> toJson() => _$FiveChThreadContentDataToJson(this);
}
