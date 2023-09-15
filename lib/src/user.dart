import 'dart:typed_data';

import 'package:model/src/importer.dart';

part 'user.g.dart';

@JsonSerializable()
@CopyWith()
@immutable
class UserData {
  const UserData({
    required this.id,
    required this.forums,
    required this.randomAvatar,
    required this.lastOpenedForum,
    required this.language,
    // this.addedFonts = const [],
  });

  final String id;
  final List<Communities> forums;
  final String randomAvatar;
  final Communities lastOpenedForum;
  final LangList language;
  // final List<String?> addedFonts;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

// @JsonSerializable()
// @CopyWith()
// @immutable
// class UserSettingsData {
//   const UserSettingsData({
//     required this.forums,
//     this.lastOpenedForum,
//   });

//   final List<ForumSettingsData?> forums;
//   final Communities? lastOpenedForum;

//   factory UserSettingsData.fromJson(Map<String, dynamic> json) =>
//       _$UserSettingsDataFromJson(json);
//   Map<String, dynamic> toJson() => _$UserSettingsDataToJson(this);
// }

// @JsonSerializable()
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
      required this.sage,
      this.media,
      this.filename,
      this.resnum});

  final String body;
  final String name;
  final String postAt;
  final Communities forum;
  final String threadId;
  final String threadTitle;
  final String? resnum;
  final Uint8List? media;
  final String? filename;
  final bool sage;

  int? get index => int.tryParse(resnum ?? '0');

  // factory CommentData.fromJson(Map<String, dynamic> json) =>
  //     _$CommentDataFromJson(json);
  // Map<String, dynamic> toJson() => _$CommentDataToJson(this);
}
