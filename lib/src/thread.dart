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

  String get getFullUrl => 'https://${url.replaceAll('https://', '')}';

  Uri get uri => Uri.parse(getFullUrl);

  String? get fiveChUrlForHtml {
    if (url.contains('5ch.net')) {
      final sub = url.substring(0, url.indexOf('.'));
      final path = '$sub.5ch.net/test/read.cgi/$boardId/$id';
      return 'https://$path';
    }
    return null;
  }

  String? get pinkChUrlForHtml {
    if (url.contains(Communities.pinkCh.host)) {
      final sub = url.substring(0, url.indexOf('.'));
      final path = '$sub.${Communities.pinkCh.host}/test/read.cgi/$boardId/$id';
      return 'https://$path';
    }
    return null;
  }

  String? get compatibleUrl => fiveChUrlForHtml ?? pinkChUrlForHtml;

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

  double get ikioi {
    return 0.0;
  }

  DateTime? get dateTime => DateTime.now();

  // factory ThreadData.fromJson(Map<String, dynamic> json) =>
  //     _$ThreadDataFromJson(json);
  // Map<String, dynamic> toJson() => _$ThreadDataToJson(this);
}

// @JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class ThreadContentData {
  const ThreadContentData(
      {required this.id,
      required this.boardId,
      required this.type,
      this.archived = false,
      this.content = const []});
  final String id;
  final String boardId;
  final Communities type;
  final bool archived;
  // final String title;
  final List<ContentData?> content;

  int? get lastIndex => content.isNotEmpty ? content.last?.index : null;

  // factory ThreadContentData.fromJson(Map<String, dynamic> json) =>
  //     _$ThreadContentDataFromJson(json);
  // Map<String, dynamic> toJson() => _$ThreadContentDataToJson(this);
}
