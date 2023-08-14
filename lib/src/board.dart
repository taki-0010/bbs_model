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
      this.futabaCh});
  final String id;
  final String name;
  final Communities forum;
  final FiveChCategoryData? fiveChCategory;
  final FiveChBoardData? fiveCh;
  final GirlsChCategory? girlsCh;
  final FutabaChBoard? futabaCh;

  factory BoardData.fromJson(Map<String, dynamic> json) =>
      _$BoardDataFromJson(json);
  Map<String, dynamic> toJson() => _$BoardDataToJson(this);
}

abstract class BoardBase {
  const BoardBase();
}
