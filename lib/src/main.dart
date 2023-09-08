import 'importer.dart';
import 'package:timeago/timeago.dart' as ta;
part 'main.g.dart';

@JsonSerializable()
@CopyWith()
@immutable
class ThreadMarkData extends ThreadBase {
  const ThreadMarkData({
    required super.id,
    required super.type,
    required super.resCount,
    this.favorite = false,
    // required super.lastIndex,
    // super.thumbnail,
    super.thumbnailStr,
    // this.archived = false,
    required super.url,
    // this.thumbnailUrl,
    required super.boardId,
    required super.title,
    // super.boardName,
    super.positionToGet = PositionToGet.first,
    // super.difference,
    this.lastOpendIndex,
    this.lastReadAt,
    required this.sessionId,
    required this.userId,
    required this.documentId,
    this.retentionPeriodSeconds = 0,
    required this.createdAtBySeconds,
    this.marks = const {},
    this.importance = const [],
    this.agreedIndexSet = const{}
    // this.mutePosterIds = const {},
    // this.muteUserIds = const {}
  });
  final String userId;
  final String documentId;

  final int? lastOpendIndex;
  final int? lastReadAt;
  final String sessionId;
  final bool favorite;
  // final String retentionPeriod;
  final int retentionPeriodSeconds;
  final int createdAtBySeconds;
  final Set<String?> marks;
  // final Set<String?> mutePosterIds;
  // final Set<String?> muteUserIds;
  final List<String?> importance;
  final Set<int?> agreedIndexSet;

  SrcData? get thumbnail => thumbnailStr != null
      ? SrcData.fromJson(stringToJson(thumbnailStr!))
      : null;

  List<ImportanceData?> get importanceList => importance
      .map((e) => e != null ? ImportanceData.fromJson(stringToJson(e)) : null)
      .toList();

  Set<ResMarkData?> get markList => marks
      .map((e) => e != null ? ResMarkData.fromJson(stringToJson(e)) : null)
      .toSet();

  // @override
  // int get getResCount => endIndex ?? 0;

  @override
  String? get thumbnailUrl => thumbnail?.thumbnailUri;

  factory ThreadMarkData.fromJson(Map<String, dynamic> json) =>
      _$ThreadMarkDataFromJson(json);
  Map<String, dynamic> toJson() => _$ThreadMarkDataToJson(this);
}

@JsonSerializable()
@CopyWith()
@immutable
class ResMarkData {
  const ResMarkData({
    required this.index,
    required this.icon,
  });
  final int index;
  final MarkIcon icon;
  // final Set<LastOpenedContentIndex?>? contents;

  factory ResMarkData.fromJson(Map<String, dynamic> json) =>
      _$ResMarkDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResMarkDataToJson(this);
}

@JsonSerializable()
@CopyWith()
@immutable
class ImportanceData {
  const ImportanceData(
      {required this.id,
      required this.target,
      required this.strValue,
      required this.level});
  final int id;
  final ImportanceTarget target;
  final String strValue;
  final ImportanceList level;

  factory ImportanceData.fromJson(Map<String, dynamic> json) =>
      _$ImportanceDataFromJson(json);
  Map<String, dynamic> toJson() => _$ImportanceDataToJson(this);
}

// @JsonSerializable()
// @CopyWith()
// @immutable
// class LastOpenedIndex {
//   const LastOpenedIndex({this.boards, this.threads, this.contents});
//   final int? boards;
//   final int? threads;
//   final Set<LastOpenedContentIndex?>? contents;

//   factory LastOpenedIndex.fromJson(Map<String, dynamic> json) =>
//       _$LastOpenedIndexFromJson(json);
//   Map<String, dynamic> toJson() => _$LastOpenedIndexToJson(this);
// }

// @JsonSerializable()
// @CopyWith()
// @immutable
// class LastOpenedContentIndex {
//   const LastOpenedContentIndex({required this.id, required this.index});
//   final String id;
//   final int index;

//   factory LastOpenedContentIndex.fromJson(Map<String, dynamic> json) =>
//       _$LastOpenedContentIndexFromJson(json);
//   Map<String, dynamic> toJson() => _$LastOpenedContentIndexToJson(this);
// }

// @JsonSerializable(explicitToJson: true)
// @CopyWith()
// @immutable
// final class BoardDataForStorage {
//   const BoardDataForStorage({required this.board, required this.threads});
//   final BoardData board;
//   final List<ThreadData?> threads;

//   factory BoardDataForStorage.fromJson(Map<String, dynamic> json) =>
//       _$BoardDataForStorageFromJson(json);
//   Map<String, dynamic> toJson() => _$BoardDataForStorageToJson(this);
// }

abstract class ContentData {
  const ContentData(
      {required this.index,
      required this.body,
      this.urlSet,
      this.src,
      this.title,
      this.userId,
      this.threadThumbnail,
      required this.name});
  final int index;
  final String body;
  final List<String?>? urlSet;
  final SrcData? src;
  final String name;
  final String? userId;
  final String? title;
  final String? threadThumbnail;

  String? get srcThumbnail => null;
  String? get srcContent => null;

  DateTime? get createdAt => null;
  String? get getPostId => null;
  Set<String?> get anchorList => {};
  String? get getUserId => null;
  String? get getUserName => null;
}

mixin WithDateTime {
  String getTimeago(final DateTime value) {
    return ta.format(value);
  }

  DateTime getDateTime(final String datetime, final String time) {
    final date = datetime.split('/');
    final yearData = date.isNotEmpty ? date.first : '0';
    final yaerStr = yearData.length == 2 ? '20$yearData' : yearData;
    final year = int.tryParse(yaerStr) ?? 0;
    final month = int.tryParse(date[1]) ?? 0;
    final dayStr = date[2].substring(0, 2);
    final day = int.tryParse(dayStr) ?? 0;
    final timeSplited = time.split(':');
    final hour = int.tryParse(timeSplited[0]) ?? 0;
    final minute = int.tryParse(timeSplited[1]) ?? 0;
    final secoundsStr =
        timeSplited[2].isNotEmpty ? timeSplited[2].substring(0, 2) : '0';
    final seconds = int.tryParse(secoundsStr) ?? 0;
    final formated = DateTime(year, month, day, hour, minute, seconds);
    return formated;
  }

  double getIkioi(final int createdAt, final int resCount) {
    final current = DateTime.now().millisecondsSinceEpoch * 0.001;
    // final createdNum = datId.substring(0, datId.length - 4);
    // final created = int.tryParse(datetime) ?? 0;
    final diviDay = ((current - createdAt) / 86400);
    final result = resCount / diviDay;
    // logger.d(
    //     'ikioi: $result, resCount:$resCount, current:$current, datId:$datId, created:$createdNum, diviDay:$diviDay');
    return double.tryParse(result.toStringAsFixed(2)) ?? 0;
  }
}

@immutable
class GroupData {
  const GroupData({required this.date, required this.firstIndex});
  final String date;
  final int firstIndex;
}
