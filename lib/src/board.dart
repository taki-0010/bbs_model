import 'importer.dart';

part 'board.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class BoardData {
  const BoardData(
      {required this.id,
      required this.name,
      required this.forum,
      this.fiveChCategory,
      this.fiveCh,
      this.girlsCh,
      this.futabaCh,
      this.machi});
  final String id;
  final String name;
  final Communities forum;
  final FiveChCategoryData? fiveChCategory;
  final FiveChBoardData? fiveCh;
  final GirlsChCategory? girlsCh;
  final FutabaChBoard? futabaCh;
  final MachiBoardData? machi;

  factory BoardData.fromJson(Map<String, dynamic> json) =>
      _$BoardDataFromJson(json);
  Map<String, dynamic> toJson() => _$BoardDataToJson(this);
}

@immutable
class FetchBoardsResultData {
  const FetchBoardsResultData({
    this.boards,
    this.statusCode = 200,
  });
  final List<BoardData?>? boards;
  final int statusCode;

  FetchResult get result {
    if (boards != null && boards!.isNotEmpty) {
      return FetchResult.success;
    }
    if (statusCode >= 400) {
      return FetchResult.networkError;
    }

    return FetchResult.error;
  }
}

@JsonSerializable()
@CopyWith()
@immutable
class PostDraftData {
  const PostDraftData(
      {required this.documentId,
      required this.forum,
      required this.target,
      required this.targetId,
      required this.body,
      required this.title,
      required this.name,
      this.retentionPeriodSeconds});
  final String documentId;
  final Communities forum;
  final PostDraftTarget target;
  final String targetId;
  final String body;
  final String title;
  final String name;
  final int? retentionPeriodSeconds;

  factory PostDraftData.fromJson(Map<String, dynamic> json) =>
      _$PostDraftDataFromJson(json);
  Map<String, dynamic> toJson() => _$PostDraftDataToJson(this);
}
