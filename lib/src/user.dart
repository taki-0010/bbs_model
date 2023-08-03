import 'package:model/src/importer.dart';

part 'user.g.dart';

@JsonSerializable()
@CopyWith()
@immutable
class UserSettingsData {
  const UserSettingsData({
    required this.forums,
    this.lastOpenedForum,
  });

  final List<ForumSettingsData?> forums;
  final Communities? lastOpenedForum;

  factory UserSettingsData.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserSettingsDataToJson(this);
}


@JsonSerializable()
@CopyWith()
@immutable
class CommentData {
  const CommentData(
      {required this.body,
      required this.name,
      required this.postAt,
      required this.forum,
      required this.threadId,
      required this.threadTitle,
      this.resnum});

  final String body;
  final String name;
  final String postAt;
  final Communities forum;
  final String threadId;
  final String threadTitle;
  final String? resnum;

  int? get index => int.tryParse(resnum ?? '0');

  factory CommentData.fromJson(Map<String, dynamic> json) =>
      _$CommentDataFromJson(json);
  Map<String, dynamic> toJson() => _$CommentDataToJson(this);
}
