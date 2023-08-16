import 'importer.dart';
import 'package:timeago/timeago.dart' as ta;
part 'main.g.dart';

@JsonSerializable()
@CopyWith()
@immutable
class ThreadMarkData extends ThreadBase {
  const ThreadMarkData(
      {required super.id,
      required super.type,
      // required this.cacheId,
      required this.gotAt,
      // this.favorite = false,
      required super.resCount,
      this.favorite = false,
      // required super.lastIndex,
      super.thumbnail,
      // this.archived = false,
      required super.url,
      // this.thumbnailUrl,
      required super.boardId,
      required super.title,
      super.boardName,
      super.positionToGet = PositionToGet.first,
      // super.difference,

      this.startIndex,
      this.endIndex,
      required this.retentionPeriod,
      this.marks = const {},
      this.mutePosterIds = const {},
      this.muteUserIds = const {}
      // this.fiveCh,
      // this.girlsCh,
      // this.futabaCh
      });
  // final String id;
  // final int cacheId;
  final String gotAt;
  
  // final bool archived;
  final int? startIndex;
  final int? endIndex;
  // final String url;
  // final int lastResCount;
  // final String? thumbnailUrl;
  // final String boardId;
  // final String? title;
  // final PositionToGet positionToGet;
  final bool favorite;
  final String retentionPeriod;
  final Set<ResMarkData?> marks;
  final Set<String?> mutePosterIds;
  final Set<String?> muteUserIds;
  // final int startIndex;
  // final int endIndex;
  // final int? lastPositionedIndex;
  // final List<FiveChThreadContentData?>? fiveCh;
  // final List<GirlsChContent?>? girlsCh;
  // final List<FutabaChContent?>? futabaCh;

  @override
  int get getResCount => endIndex ?? 0;

  @override
  String? get thumbnailUrl => thumbnail?.thumbnailUri;

  // String get futabaDirectory {
  //   final origin = uri.origin;
  //   final index = origin.indexOf('.');
  //   return origin.substring(0, index);
  // }

  // bool get empty => fiveCh == null && girlsCh == null && futabaCh == null;
  // List<ContentData?>? get content {
  //   switch (type) {
  //     case Communities.fiveCh:
  //       return fiveCh;
  //     case Communities.girlsCh:
  //       return girlsCh;
  //     case Communities.futabaCh:
  //       return futabaCh;
  //     default:
  //       return null;
  //   }
  // }

  // Communities? get type {
  //   if (fiveCh != null) {
  //     return Communities.fiveCh;
  //   } else if (girlsCh != null) {
  //     return Communities.girlsCh;
  //   } else if (futabaCh != null) {
  //     return Communities.futabaCh;
  //   }
  //   return null;
  // }

  // String? get title {
  //   switch (type) {
  //     case Communities.fiveCh:
  //       return fiveCh?.firstOrNull?.title;
  //     case Communities.girlsCh:
  //       return girlsCh?.firstOrNull?.title;
  //     case Communities.futabaCh:
  //       return futabaCh?.firstOrNull?.title;
  //     default:
  //       return null;
  //   }
  // }

  factory ThreadMarkData.fromJson(Map<String, dynamic> json) =>
      _$ThreadMarkDataFromJson(json);
  Map<String, dynamic> toJson() => _$ThreadMarkDataToJson(this);
}

@JsonSerializable()
@CopyWith()
@immutable
final class ResMarkData {
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
final class LastOpenedIndex {
  const LastOpenedIndex({this.boards, this.threads, this.contents});
  final int? boards;
  final int? threads;
  final Set<LastOpenedContentIndex?>? contents;

  factory LastOpenedIndex.fromJson(Map<String, dynamic> json) =>
      _$LastOpenedIndexFromJson(json);
  Map<String, dynamic> toJson() => _$LastOpenedIndexToJson(this);
}

@JsonSerializable()
@CopyWith()
@immutable
final class LastOpenedContentIndex {
  const LastOpenedContentIndex({required this.id, required this.index});
  final String id;
  final int index;

  factory LastOpenedContentIndex.fromJson(Map<String, dynamic> json) =>
      _$LastOpenedContentIndexFromJson(json);
  Map<String, dynamic> toJson() => _$LastOpenedContentIndexToJson(this);
}

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
      required this.name});
  final int index;
  final String body;
  final List<String?>? urlSet;
  final SrcData? src;
  final String name;

  String? get srcThumbnail => null;
  String? get srcContent => null;

  DateTime get createdAt => DateTime.now();
  String get getId => '';
  Set<String?> get anchorList => {};
  String? get getUserId => null;
}

mixin class WithDateTime {
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
final class GroupData {
  const GroupData({required this.date, required this.firstIndex});
  final String date;
  final int firstIndex;
}
