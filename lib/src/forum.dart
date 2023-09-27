import 'importer.dart';

part 'forum.g.dart';

@JsonSerializable()
@CopyWith()
@immutable
class ForumSettingsData {
  const ForumSettingsData(
      {required this.userId,
      required this.forum,
      required this.theme,
      required this.retentionPeriod,
      this.threadsOrder = ThreadsOrder.hot,
      this.positionToGet = PositionToGet.first,
      this.commentCountDisplayThreshold = 5,
      this.openLink = true,
      this.blurThumbnail = false,
      this.useFavoritesBoards = false,
      this.favoritesBoardList = const [],
      this.searchWordList = const [],
      this.searchBoardIdForFutaba = 'b',
      this.deleteKeyForFutaba = '48009',
      this.sortHistoryByRetention = false,
      // this.sortHistory = SortHistory.hot,
      this.sortHistoryList = SortHistoryList.boards,
      this.googleFonts,
      this.addedFonts = const [],
      this.boardImportance = const [],
      this.threadsImportance = const [],
      this.listViewStyle = ListViewStyle.list});

  final String userId;
  final Communities forum;
  final ThemeList theme;
  final RetentionPeriodList retentionPeriod;
  final ThreadsOrder threadsOrder;
  final PositionToGet positionToGet;
  final int commentCountDisplayThreshold;
  final bool openLink;
  final bool blurThumbnail;
  final bool useFavoritesBoards;
  final List<String?> favoritesBoardList;
  final List<String?> searchWordList;
  final String searchBoardIdForFutaba;
  final String deleteKeyForFutaba;
  final bool sortHistoryByRetention;
  // final SortHistory sortHistory;
  final SortHistoryList sortHistoryList;
  final String? googleFonts;
  final List<String?> addedFonts;
  final List<String?> boardImportance;
  final List<String?> threadsImportance;
  final ListViewStyle listViewStyle;

  List<ImportanceData?> get boardImportanceList => boardImportance
      .map((e) => e != null ? ImportanceData.fromJson(stringToJson(e)) : null)
      .toList();

  List<ImportanceData?> get threadsImportanceList => threadsImportance
      .map((e) => e != null ? ImportanceData.fromJson(stringToJson(e)) : null)
      .toList();

  factory ForumSettingsData.fromJson(Map<String, dynamic> json) =>
      _$ForumSettingsDataFromJson(json);
  Map<String, dynamic> toJson() => _$ForumSettingsDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class SrcData {
  const SrcData({this.thumbnailUri, this.srcUri});
  final String? thumbnailUri;
  final String? srcUri;

  factory SrcData.fromJson(Map<String, dynamic> json) =>
      _$SrcDataFromJson(json);
  Map<String, dynamic> toJson() => _$SrcDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class SrcDataForStorage {
  const SrcDataForStorage({
    this.data,
    required this.id,
  });
  final String id;
  final List<int>? data;

  factory SrcDataForStorage.fromJson(Map<String, dynamic> json) =>
      _$SrcDataForStorageFromJson(json);
  Map<String, dynamic> toJson() => _$SrcDataForStorageToJson(this);
}

class InitialForumData {
  static const searchWords = ['ニュース', 'スポーツ', '天気'];
  static const searchWordsFutaba = ['雑談', '画像', '天気'];
  static ForumSettingsData? getInitialSettings(
      final Communities value, final String userId) {
    // final userId = user?.$id;
    // logger.i('userId: $userId');
    // if (userId == null) return null;
    final base = ForumSettingsData(
        userId: userId,
        forum: value,
        theme: ThemeList.m3Purple,
        threadsOrder: ThreadsOrder.hot,
        commentCountDisplayThreshold: 2,
        useFavoritesBoards: false,
        searchWordList: searchWords,
        // sortHistory: SortHistory.boards,
        sortHistoryList: SortHistoryList.boards,
        retentionPeriod: RetentionPeriodList.oneWeek);
    switch (value) {
      case Communities.fiveCh:
        return base.copyWith(
            theme: ThemeList.m3Purple,
            retentionPeriod: RetentionPeriodList.byPostPace);
      case Communities.girlsCh:
        return base.copyWith(theme: ThemeList.pinkSakura, listViewStyle: ListViewStyle.gridMedium);
      case Communities.futabaCh:
        return base.copyWith(
            searchWordList: searchWordsFutaba,
            theme: ThemeList.sanJuanBlue,
            threadsOrder: ThreadsOrder.catalog,
            listViewStyle: ListViewStyle.gridSmall,
            deleteKeyForFutaba: randomInt().toString(),
            retentionPeriod: RetentionPeriodList.oneDay);
      case Communities.pinkCh:
        return base.copyWith(
            theme: ThemeList.espresso,
            retentionPeriod: RetentionPeriodList.byPostPace);
      default:
    }
    return null;
  }
}
