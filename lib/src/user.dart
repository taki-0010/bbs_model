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
    // this.agreedTerms = false
    // this.addedFonts = const [],
  });

  final String id;
  final List<Communities> forums;
  final String randomAvatar;
  final Communities lastOpenedForum;
  final LangList language;
  // final bool agreedTerms;
  // final List<String?> addedFonts;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@CopyWith()
@immutable
class PostData {
  const PostData(
      {required this.body,
      required this.name,
      required this.title,
      this.media,
      this.filename,
      required this.email,
      // required this.sage,
      this.postThread = false,
      this.resnum});
  final String body;
  final String name;
  final String title;
  final Uint8List? media;
  final String? filename;
  // final bool sage;
  final String email;
  final bool postThread;
  final int? resnum;
}

@JsonSerializable()
@CopyWith()
@immutable
class TemplateData {
  const TemplateData({
    required this.documentId,
    required this.forum,
    required this.userId,
    this.names = const [],
    this.subjects = const [],
    this.bodys = const [],
  });
  final String documentId;
  final Communities forum;
  final String userId;
  final List<String?> names;
  final List<String?> subjects;
  final List<String?> bodys;

  factory TemplateData.fromJson(Map<String, dynamic> json) =>
      _$TemplateDataFromJson(json);
  Map<String, dynamic> toJson() => _$TemplateDataToJson(this);
}
