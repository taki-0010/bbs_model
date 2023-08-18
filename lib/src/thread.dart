import 'importer.dart';
part 'thread.g.dart';

abstract class ThreadBase {
  const ThreadBase(
      {required this.id,
      required this.type,
      required this.title,
      required this.resCount,
      // required this.lastIndex,
      required this.boardId,
      // this.difference,
      required this.url,
      this.boardName,
      required this.positionToGet,
      // this.thumbnail,
      this.thumbnailStr});
  final String id;
  final Communities type;
  final String title;
  final int resCount;
  // final int lastIndex;
  final String boardId;
  // final SrcData? thumbnail;
  // final int? difference;
  final String? boardName;
  final String url;
  final PositionToGet positionToGet;
  final String? thumbnailStr;

  int get getResCount => resCount;

  String? get thumbnailUrl => null;

  bool get useWebview =>
      type == Communities.girlsCh || type == Communities.futabaCh;

  String get getFullUrl => 'https://$url';

  Uri get uri => Uri.parse(getFullUrl);

  String get futabaDirectory {
    final origin = uri.host;
    final index = origin.indexOf('.');
    return origin.substring(0, index);
  }
}

// @JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class ThreadData extends ThreadBase {
  const ThreadData(
      {required super.id,
      required super.title,
      required super.resCount,
      // required super.lastIndex,
      required super.type,
      // super.thumbnail,
      super.thumbnailStr,
      required super.url,
      // this.positionToGet = PositionToGet.first,
      // this.img,
      this.updateAtStr,
      // super.difference,
      required super.boardId,
      super.boardName,
      super.positionToGet = PositionToGet.first,
      this.catalog = false,
      // this.content = const [],
      this.isNewPost = false});
  // final PositionToGet positionToGet;
  // final String id;
  // final String title;
  // final int resCount;
  // final SrcData? img;
  final String? updateAtStr;
  // final int? difference;
  final bool isNewPost;
  final bool catalog;
  // final List<ContentData?> content;
  // final String boardId;

  // String? get thumbnailUrl {
  //   return null;
  // }

  // int get lastIndex {
  //   final lastItem = content.lastOrNull;
  //   switch (lastItem) {
  //     case FiveChThreadContentData():
  //       return lastItem.index;
  //     case GirlsChContent():
  //       return lastItem.index;
  //     case FutabaChContent():
  //       return lastItem.index;
  //     default:
  //   }
  //   return 0;
  // }

  double get ikioi {
    return 0.0;
  }

  // factory ThreadData.fromJson(Map<String, dynamic> json) =>
  //     _$ThreadDataFromJson(json);
  // Map<String, dynamic> toJson() => _$ThreadDataToJson(this);
}

// @JsonSerializable(explicitToJson: true)
// @CopyWith()
@immutable
class ThreadContentData {
  const ThreadContentData(
      {required this.id,
      required this.boardId,
      required this.type,
      this.content = const []});
  final String id;
  final String boardId;
  final Communities type;
  // final String title;
  final List<ContentData?> content;

  // factory ThreadContentData.fromJson(Map<String, dynamic> json) =>
  //     _$ThreadContentDataFromJson(json);
  // Map<String, dynamic> toJson() => _$ThreadContentDataToJson(this);
}
