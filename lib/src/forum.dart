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
      this.blurThumbnail = false,
      this.useFavoritesBoards = false,
      this.favoritesBoardList = const [],
      this.searchWordList = const [],
      this.deleteKeyForFutaba = '48009',
      this.searchBoardId,
      this.sortHistoryList = SortHistoryList.boards,
      this.googleFonts,
      this.addedFonts = const [],
      this.importanceList = const [],
      this.listViewStyle = ListViewStyle.list,
      this.movedToLastThreads = MovedToLastThreads.none,
      this.threadsOrderType = ThreadsOrderType.importance,
      this.autoDownloadableSizeLimit = AutoDownloadableSizeLimit.noLimit,
      this.timeago = TimeagoList.enable,
      this.nsfw = false,
      this.lastUsedName,
      this.lastUsedEmail,
      this.lastUsedSubject,
      this.saveLastUsedName = false,
      this.saveLastUsedEmail = false,
      this.saveLastUsedSubject = false});

  final String userId;
  final Communities forum;
  final ThemeList theme;
  final RetentionPeriodList retentionPeriod;
  final bool blurThumbnail;
  final bool useFavoritesBoards;
  final List<String?> favoritesBoardList;
  final List<String?> searchWordList;
  final String deleteKeyForFutaba;
  final String? searchBoardId;
  final SortHistoryList sortHistoryList;
  final String? googleFonts;
  final List<String?> addedFonts;
  final List<String?> importanceList;
  final ListViewStyle listViewStyle;
  final MovedToLastThreads movedToLastThreads;
  final ThreadsOrderType threadsOrderType;
  final AutoDownloadableSizeLimit autoDownloadableSizeLimit;
  final TimeagoList timeago;
  final bool nsfw;
  final bool saveLastUsedName;
  final bool saveLastUsedEmail;
  final bool saveLastUsedSubject;
  final String? lastUsedName;
  final String? lastUsedEmail;
  final String? lastUsedSubject;

  // List<ImportanceData?> get boardImportanceList => boardImportance
  //     .map((e) => e != null ? ImportanceData.fromJson(stringToJson(e)) : null)
  //     .toList();

  // List<ImportanceData?> get threadsImportanceList => threadsImportance
  //     .map((e) => e != null ? ImportanceData.fromJson(stringToJson(e)) : null)
  //     .toList();

  List<ImportanceData?> get getImportanceList => importanceList
      .map((e) => e != null ? ImportanceData.fromJson(stringToJson(e)) : null)
      .toList();

  factory ForumSettingsData.fromJson(Map<String, dynamic> json) =>
      _$ForumSettingsDataFromJson(json);
  Map<String, dynamic> toJson() => _$ForumSettingsDataToJson(this);
}

// @JsonSerializable(explicitToJson: true)
// @CopyWith()
// @immutable
// class SrcData {
//   const SrcData({this.thumbnailUri, this.srcUri});
//   final String? thumbnailUri;
//   final String? srcUri;

//   factory SrcData.fromJson(Map<String, dynamic> json) =>
//       _$SrcDataFromJson(json);
//   Map<String, dynamic> toJson() => _$SrcDataToJson(this);
// }

// @JsonSerializable(explicitToJson: true)
// @CopyWith()
// @immutable
// class SrcDataForStorage {
//   const SrcDataForStorage({
//     this.data,
//     required this.id,
//   });
//   final String id;
//   final List<int>? data;

//   factory SrcDataForStorage.fromJson(Map<String, dynamic> json) =>
//       _$SrcDataForStorageFromJson(json);
//   Map<String, dynamic> toJson() => _$SrcDataForStorageToJson(this);
// }

class InitialForumData {
  static const searchWords = ['ニュース', 'スポーツ', '天気'];
  static const searchWordsFutaba = ['雑談', '画像', '天気'];
  static const searchWordsChan4 = ['News', 'SDGs', 'waifu draw'];
  static const searchWordsMal = ['isekai', 'shonen', 'mecha'];
  static const searchWordsYt = ['music', 'fortnite', 'travel'];
  static ForumSettingsData? getInitialSettings(
      final Communities value, final String userId) {
    // final userId = user?.$id;
    // logger.i('userId: $userId');
    // if (userId == null) return null;
    final base = ForumSettingsData(
        userId: userId,
        forum: value,
        theme: ThemeList.m3Purple,
        threadsOrderType: ThreadsOrderType.hot,
        useFavoritesBoards: false,
        searchWordList: searchWords,
        sortHistoryList: SortHistoryList.boards,
        retentionPeriod: RetentionPeriodList.oneWeek);
    switch (value) {
      case Communities.fiveCh:
        return base.copyWith(
            theme: ThemeList.m3Purple,
            sortHistoryList: SortHistoryList.history,
            retentionPeriod: RetentionPeriodList.byPostPace);
      case Communities.girlsCh:
        return base.copyWith(
            theme: ThemeList.pinkSakura,
            threadsOrderType: ThreadsOrderType.newerResponce,
            listViewStyle: ListViewStyle.gridMedium);
      case Communities.shitaraba:
        return base.copyWith(
            theme: ThemeList.espresso,
            sortHistoryList: SortHistoryList.history,
            retentionPeriod: RetentionPeriodList.byPostPace);
      case Communities.futabaCh:
        return base.copyWith(
            searchWordList: searchWordsFutaba,
            theme: ThemeList.verdunLime,
            searchBoardId: 'b',
            threadsOrderType: ThreadsOrderType.catalog,
            sortHistoryList: SortHistoryList.history,
            listViewStyle: ListViewStyle.gridSmall,
            deleteKeyForFutaba: randomInt().toString(),
            retentionPeriod: RetentionPeriodList.oneDay);
      case Communities.pinkCh:
        return base.copyWith(
            theme: ThemeList.goldSunset,
            retentionPeriod: RetentionPeriodList.byPostPace);
      case Communities.machi:
        return base.copyWith(
            theme: ThemeList.indigoNights,
            searchBoardId: 'tokyo',
            sortHistoryList: SortHistoryList.history,
            movedToLastThreads: MovedToLastThreads.over1000,
            retentionPeriod: RetentionPeriodList.oneMonth);
      case Communities.open2Ch:
        return base.copyWith(
            theme: ThemeList.sanJuanBlue,
            sortHistoryList: SortHistoryList.history,
            retentionPeriod: RetentionPeriodList.oneWeek);
      case Communities.chan4:
        return base.copyWith(
            theme: ThemeList.greenForest,
            searchWordList: searchWordsChan4,
            searchBoardId: 'a',
            listViewStyle: ListViewStyle.gridMedium,
            retentionPeriod: RetentionPeriodList.oneWeek);
      case Communities.hatena:
        return base.copyWith(
            theme: ThemeList.brandBlues,
            searchWordList: searchWords,
            timeago: TimeagoList.disable,
            retentionPeriod: RetentionPeriodList.oneWeek);
      case Communities.mal:
        return base.copyWith(
            theme: ThemeList.hippieBlue,
            searchWordList: searchWordsMal,
            searchBoardId: '1',
            threadsOrderType: ThreadsOrderType.newerResponce,
            timeago: TimeagoList.disableSecondsAndMinutes,
            retentionPeriod: RetentionPeriodList.twoWeeks);
      case Communities.youtube:
        return base.copyWith(
            theme: ThemeList.redTornado,
            searchWordList: searchWordsYt,
            // useFavoritesBoards: true,
            favoritesBoardList: [
              'ch/UCBR8-60-B28hp2BmDPdntcQ',
              'pl/PLIPIdmqWalEVfd_43DzOt6c1tE-9nYOnH'
            ],
            threadsOrderType: ThreadsOrderType.newerThread,
            timeago: TimeagoList.disable,
            retentionPeriod: RetentionPeriodList.twoWeeks);
      default:
    }
    return null;
  }
}
