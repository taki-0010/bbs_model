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
      this.useFavoritesBoards = false,
      this.favoritesBoardList = const [],
      this.searchWordList = const [],
      this.searchBoardIdForFutaba = 'b',
      this.sortHistoryByRetention = false,
      this.googleFonts,
      this.addedFonts = const [],
      this.boardImportance = const [],
      this.threadsImportance = const []});

  final String userId;
  final Communities forum;
  final ThemeList theme;
  final RetentionPeriodList retentionPeriod;
  final ThreadsOrder threadsOrder;
  final PositionToGet positionToGet;
  final int commentCountDisplayThreshold;
  final bool openLink;
  final bool useFavoritesBoards;
  final List<String?> favoritesBoardList;
  final List<String?> searchWordList;
  final String searchBoardIdForFutaba;
  final bool sortHistoryByRetention;
  final String? googleFonts;
  final List<String?> addedFonts;
  final List<String?> boardImportance;
  final List<String?> threadsImportance;

  List<ImportanceData?> get boardImportanceList => boardImportance
      .map((e) => e != null ? ImportanceData.fromJson(stringToJson(e)) : null)
      .toList();

  List<ImportanceData?> get threadsImportanceList => threadsImportance
      .map((e) => e != null ? ImportanceData.fromJson(stringToJson(e)) : null)
      .toList();

  factory ForumSettingsData.fromJson(Map<String, dynamic> json) =>
      _$ForumSettingsDataFromJson(json);
  Map<dynamic, dynamic> toJson() => _$ForumSettingsDataToJson(this);
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
