import 'importer.dart';

part 'forum.g.dart';

@JsonSerializable()
@CopyWith()
@immutable
class ForumSettingsData {
  const ForumSettingsData(
      {required this.forum,
      required this.theme,
      required this.cacheExpire,
      this.threadsOrder = ThreadsOrder.ikioi,
      this.positionToGet = PositionToGet.first,
      this.visibleResCountThreshold = 5,
      this.openLinkByWebview = true,
      this.favoritesBoardList = const []});

  final Communities forum;
  final ThemeList theme;
  final CacheExpire cacheExpire;
  final ThreadsOrder threadsOrder;
  final PositionToGet positionToGet;
  final int visibleResCountThreshold;
  final bool openLinkByWebview;
  final List<String?> favoritesBoardList;

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
