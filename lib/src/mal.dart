// import 'package:hashlib/hashlib.dart';
import 'package:model/src/importer.dart';

part 'mal.g.dart';

class MalData {
  late String _clientId;
  String get clientId => _clientId;
  MalData._internal();
  static final MalData instance = MalData._internal();
  factory MalData() => instance;
  void set(final String value) => _clientId = value;
  bool get error => clientId == ConstantsDataBase.notFound;

  static final host = Communities.mal.host;
  static final apiHost = 'api.$host';
}

@JsonSerializable(createToJson: false, explicitToJson: true)
@immutable
class MalBoardsBaseJson {
  const MalBoardsBaseJson({required this.categories});
  final List<MalCategoryJson> categories;

  factory MalBoardsBaseJson.fromJson(Map<String, dynamic> json) =>
      _$MalBoardsBaseJsonFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
@immutable
class MalCategoryJson {
  const MalCategoryJson({required this.title, required this.boards});
  final String title;
  final List<MalBoardJson> boards;

  factory MalCategoryJson.fromJson(Map<String, dynamic> json) =>
      _$MalCategoryJsonFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
@immutable
class MalBoardJson {
  const MalBoardJson(
      {required this.id,
      required this.title,
      required this.description,
      required this.subboards});
  final int id;
  final String title;
  final String description;
  final List<MalSubBoardJson> subboards;

  factory MalBoardJson.fromJson(Map<String, dynamic> json) =>
      _$MalBoardJsonFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
@immutable
class MalSubBoardJson {
  const MalSubBoardJson({
    required this.id,
    required this.title,
  });
  final int id;
  final String title;

  factory MalSubBoardJson.fromJson(Map<String, dynamic> json) =>
      _$MalSubBoardJsonFromJson(json);
}

@immutable
class MalBoardData extends BoardData {
  const MalBoardData(
      {required super.id,
      required super.name,
      required super.forum,
      this.subboard = false});
  final bool subboard;
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@immutable
class MalThreadsBaseJson {
  const MalThreadsBaseJson({
    required this.data,
    required this.paging,
  });
  final List<MalThreadJson?> data;
  final dynamic paging;

  factory MalThreadsBaseJson.fromJson(Map<String, dynamic> json) =>
      _$MalThreadsBaseJsonFromJson(json);
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@immutable
class MalThreadJson {
  const MalThreadJson({
    required this.id,
    required this.numberOfPosts,
    required this.title,
    required this.createdAt,
    required this.lastPostCreatedAt,
    this.isLocked = false,
    required this.createdBy,
  });
  final int id;
  final int numberOfPosts;
  // final int limit;
  // final int offset;
  final String title;
  final String createdAt;
  final String lastPostCreatedAt;
  final bool isLocked;
  final MalUserJson createdBy;

  factory MalThreadJson.fromJson(Map<String, dynamic> json) =>
      _$MalThreadJsonFromJson(json);
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@immutable
class MalUserJson {
  const MalUserJson(
      {required this.id,
      required this.name,
      this.modsTitle,
      this.forumTitle,
      this.forumAvator});
  final int id;
  final String name;
  final String? modsTitle;
  final String? forumTitle;
  final String? forumAvator;
  factory MalUserJson.fromJson(Map<String, dynamic> json) =>
      _$MalUserJsonFromJson(json);
}

@immutable
class MalThreadData extends ThreadData with WithDateTime {
  const MalThreadData(
      {required super.id,
      required super.title,
      required super.resCount,
      required super.boardId,
      required super.type,
      required super.url,
      this.isSubboard = false});

  final bool isSubboard;
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@immutable
class MalContentDataJson {
  const MalContentDataJson({
    required this.data,
    required this.paging,
  });
  final MalContentBaseJson data;
  final dynamic paging;

  factory MalContentDataJson.fromJson(Map<String, dynamic> json) =>
      _$MalContentDataJsonFromJson(json);
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@immutable
class MalContentBaseJson {
  const MalContentBaseJson({
    required this.posts,
    required this.title,
  });
  final List<MalContentJson?> posts;
  final String title;

  factory MalContentBaseJson.fromJson(Map<String, dynamic> json) =>
      _$MalContentBaseJsonFromJson(json);
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@immutable
class MalContentJson {
  const MalContentJson({
    required this.id,
    required this.number,
    required this.body,
    required this.createdAt,
    required this.signature,
    // this.isLocked = false,
    required this.createdBy,
  });
  final int id;
  final int number;
  // final int limit;
  // final int offset;
  final String body;
  final String createdAt;
  final String signature;
  // final bool isLocked;
  final MalUserJson createdBy;

  factory MalContentJson.fromJson(Map<String, dynamic> json) =>
      _$MalContentJsonFromJson(json);
}

@immutable
class MalContentData extends ContentData {
  const MalContentData(
      {required super.forum,
      required super.index,
      required super.body,
      required super.name,
      super.title,
      required this.createdAtStr,
      required this.signature,
      required this.user});
  final String createdAtStr;
  final String signature;
  final MalUserJson user;

  @override
  String? get getUserName => user.name;

  @override
  DateTime? get createdAt {
    final p = DateTime.tryParse(createdAtStr);
    return p;
  }

  @override
  Uri? get avatarUri {
    if (user.forumAvator == null) {
      return null;
    }
    final data = Uri.tryParse(user.forumAvator!);
    if (data == null) {
      return null;
    }
    if (UrlParser.getType(user.forumAvator) == MediaTypeList.image) {
      return data;
    }
    return null;
  }
}
