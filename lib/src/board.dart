import 'importer.dart';

// part 'board.g.dart';

// @JsonSerializable(explicitToJson: true)
// @CopyWith()
// @immutable
abstract class BoardData {
  const BoardData({
    required this.id,
    required this.name,
    required this.forum,
    // this.fiveChCategory,
    // this.fiveCh,
    // this.girlsCh,
    // this.futabaCh,
    // this.machi,
    // this.shitarabaCategory,
    // this.shitarabaBoard,
    // this.open2chBoards = const[]
  });
  final String id;
  final String name;
  final Communities forum;

  // String? get sub => shitarabaBoard?.sub;

  // factory BoardData.fromJson(Map<String, dynamic> json) =>
  //     _$BoardDataFromJson(json);
  // Map<String, dynamic> toJson() => _$BoardDataToJson(this);

  bool get isCategory => false;
  List<BoardData> get childrenBoards => [];
  String get categoryName => '';
}

@immutable
class FetchBoardsResultData {
  const FetchBoardsResultData({
    this.boards,
    this.statusCode = 200,
  });
  final List<BoardData?>? boards;
  final int? statusCode;

  FetchResult get result {
    if (boards != null && boards!.isNotEmpty) {
      return FetchResult.success;
    }
    if (statusCode != null && statusCode! >= 400) {
      return FetchResult.networkError;
    }

    return FetchResult.error;
  }
}

@immutable
class BoardMetaData {
  const BoardMetaData(
      {required this.data, required this.directory, required this.boardId});
  final String data;
  final String directory;
  final String boardId;
}
