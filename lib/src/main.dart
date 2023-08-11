import 'importer.dart';
import 'package:timeago/timeago.dart' as ta;
part 'main.g.dart';

@JsonSerializable()
@CopyWith()
@immutable
class ContentMetaData extends ThreadBase {
  const ContentMetaData(
      {required super.id,
      required this.cacheId,
      required this.gotAt,
      this.favorite = false,
      required super.resCount,
      super.thumbnail,
      this.archived = false,
      // this.thumbnailUrl,
      required super.boardId,
      required super.title,
      this.positionToGet = PositionToGet.first,
      super.difference,
      // this.startIndex = 1,
      // this.endIndex = 1000,
      this.fiveCh,
      this.girlsCh,
      this.futabaCh});
  // final String id;
  final int cacheId;
  final String gotAt;
  final bool favorite;
  final bool archived;
  // final int lastResCount;
  // final String? thumbnailUrl;
  // final String boardId;
  // final String? title;
  final PositionToGet positionToGet;
  // final int startIndex;
  // final int endIndex;
  // final int? lastPositionedIndex;
  final List<FiveChThreadContentData?>? fiveCh;
  final List<GirlsChContent?>? girlsCh;
  final List<FutabaChContent?>? futabaCh;

  @override
  int get getResCount => endIndex ?? 0;

  @override
  String? get thumbnailUrl => thumbnail?.thumbnailUri;

  bool get empty => fiveCh == null && girlsCh == null && futabaCh == null;
  List<ContentData?>? get content {
    switch (type) {
      case Communities.fiveCh:
        return fiveCh;
      case Communities.girlsCh:
        return girlsCh;
      case Communities.futabaCh:
        return futabaCh;
      default:
        return null;
    }
  }

  Communities? get type {
    if (fiveCh != null) {
      return Communities.fiveCh;
    } else if (girlsCh != null) {
      return Communities.girlsCh;
    } else if (futabaCh != null) {
      return Communities.futabaCh;
    }
    return null;
  }

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

  int? get startIndex {
    switch (type) {
      case Communities.fiveCh:
        return fiveCh?.firstOrNull?.index;
      case Communities.girlsCh:
        return girlsCh?.firstOrNull?.index;
      case Communities.futabaCh:
        return futabaCh?.firstOrNull?.index;
      default:
        return null;
    }
  }

  int? get endIndex {
    switch (type) {
      case Communities.fiveCh:
        return fiveCh?.lastOrNull?.index;
      case Communities.girlsCh:
        return girlsCh?.lastOrNull?.index;
      case Communities.futabaCh:
        return futabaCh?.lastOrNull?.index;
      default:
        return null;
    }
  }

  String? get fiveChKey {
    if (fiveCh != null) {
      final replaced = id.replaceAll('.dat', '');
      final result = replaced.replaceAll('fiveCh_', '');
      return result;
    }
    return null;
  }

  DateTime get createdAt {
    return content?.firstOrNull?.createdAt ?? DateTime.now();
  }

  String get getUrl {
    switch (type) {
      case Communities.fiveCh:
        return '$fiveDomain/test/read.cgi/$fiveDirectoryName/$id';
      case Communities.girlsCh:
        return 'girlschannel.net/topics/$id';
      case Communities.futabaCh:
        return '$futabaDirectory.2chan.net/$boardId/res/$id.htm';
      default:
        return '';
    }
  }

  String get getFullUrl => 'https://$getUrl';

  Uri get url => Uri.parse(getFullUrl);

  bool get useWebview =>
      type == Communities.girlsCh || type == Communities.futabaCh;

  // String? get boardId {
  //   switch (type) {
  //     case Communities.fiveCh:
  //       return fiveDirectoryName;
  //     case Communities.futabaCh:

  //     default:
  //   }
  // }

  String? get futabaDirectory => futabaCh?.firstOrNull?.directory;
  String? get fiveDomain => fiveCh?.firstOrNull?.domain;
  String? get fiveDirectoryName => fiveCh?.firstOrNull?.directoryName;

  factory ContentMetaData.fromJson(Map<String, dynamic> json) =>
      _$ContentMetaDataFromJson(json);
  Map<String, dynamic> toJson() => _$ContentMetaDataToJson(this);
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

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
final class BoardDataForStorage {
  const BoardDataForStorage({required this.board, required this.threads});
  final BoardData board;
  final List<ThreadData?> threads;

  factory BoardDataForStorage.fromJson(Map<String, dynamic> json) =>
      _$BoardDataForStorageFromJson(json);
  Map<String, dynamic> toJson() => _$BoardDataForStorageToJson(this);
}

abstract class ThreadBase {
  const ThreadBase(
      {required this.id,
      required this.title,
      required this.resCount,
      required this.boardId,
      this.difference,
      this.boardName,
      this.thumbnail});
  final String id;
  final String title;
  final int resCount;
  final String boardId;
  final SrcData? thumbnail;
  final int? difference;
  final String? boardName;

  int get getResCount => resCount;

  String? get thumbnailUrl => null;
}

@JsonSerializable(explicitToJson: true)
// @CopyWith()
@immutable
class ThreadData extends ThreadBase {
  const ThreadData(
      {required super.id,
      required super.title,
      required super.resCount,
      super.thumbnail,
      // this.img,
      this.updateAtStr,
      super.difference,
      required super.boardId,
      super.boardName,
      this.catalog = false,
      this.isNewPost = false});
  // final String id;
  // final String title;
  // final int resCount;
  // final SrcData? img;
  final String? updateAtStr;
  // final int? difference;
  final bool isNewPost;
  final bool catalog;
  // final String boardId;

  // String? get thumbnailUrl {
  //   return null;
  // }

  double get ikioi {
    return 0.0;
  }

  factory ThreadData.fromJson(Map<String, dynamic> json) =>
      _$ThreadDataFromJson(json);
  Map<String, dynamic> toJson() => _$ThreadDataToJson(this);
}

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
    final yearData = date.firstOrNull ?? '0';
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
