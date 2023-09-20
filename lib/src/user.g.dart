// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserDataCWProxy {
  UserData id(String id);

  UserData forums(List<Communities> forums);

  UserData randomAvatar(String randomAvatar);

  UserData lastOpenedForum(Communities lastOpenedForum);

  UserData language(LangList language);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserData(...).copyWith(id: 12, name: "My name")
  /// ````
  UserData call({
    String? id,
    List<Communities>? forums,
    String? randomAvatar,
    Communities? lastOpenedForum,
    LangList? language,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserData.copyWith.fieldName(...)`
class _$UserDataCWProxyImpl implements _$UserDataCWProxy {
  const _$UserDataCWProxyImpl(this._value);

  final UserData _value;

  @override
  UserData id(String id) => this(id: id);

  @override
  UserData forums(List<Communities> forums) => this(forums: forums);

  @override
  UserData randomAvatar(String randomAvatar) =>
      this(randomAvatar: randomAvatar);

  @override
  UserData lastOpenedForum(Communities lastOpenedForum) =>
      this(lastOpenedForum: lastOpenedForum);

  @override
  UserData language(LangList language) => this(language: language);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserData(...).copyWith(id: 12, name: "My name")
  /// ````
  UserData call({
    Object? id = const $CopyWithPlaceholder(),
    Object? forums = const $CopyWithPlaceholder(),
    Object? randomAvatar = const $CopyWithPlaceholder(),
    Object? lastOpenedForum = const $CopyWithPlaceholder(),
    Object? language = const $CopyWithPlaceholder(),
  }) {
    return UserData(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      forums: forums == const $CopyWithPlaceholder() || forums == null
          ? _value.forums
          // ignore: cast_nullable_to_non_nullable
          : forums as List<Communities>,
      randomAvatar:
          randomAvatar == const $CopyWithPlaceholder() || randomAvatar == null
              ? _value.randomAvatar
              // ignore: cast_nullable_to_non_nullable
              : randomAvatar as String,
      lastOpenedForum: lastOpenedForum == const $CopyWithPlaceholder() ||
              lastOpenedForum == null
          ? _value.lastOpenedForum
          // ignore: cast_nullable_to_non_nullable
          : lastOpenedForum as Communities,
      language: language == const $CopyWithPlaceholder() || language == null
          ? _value.language
          // ignore: cast_nullable_to_non_nullable
          : language as LangList,
    );
  }
}

extension $UserDataCopyWith on UserData {
  /// Returns a callable class that can be used as follows: `instanceOfUserData.copyWith(...)` or like so:`instanceOfUserData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserDataCWProxy get copyWith => _$UserDataCWProxyImpl(this);
}

abstract class _$CommentDataCWProxy {
  CommentData body(String body);

  CommentData name(String name);

  CommentData postAt(String postAt);

  CommentData sage(bool sage);

  CommentData media(Uint8List? media);

  CommentData filename(String? filename);

  CommentData resnum(String? resnum);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommentData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommentData(...).copyWith(id: 12, name: "My name")
  /// ````
  CommentData call({
    String? body,
    String? name,
    String? postAt,
    bool? sage,
    Uint8List? media,
    String? filename,
    String? resnum,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCommentData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCommentData.copyWith.fieldName(...)`
class _$CommentDataCWProxyImpl implements _$CommentDataCWProxy {
  const _$CommentDataCWProxyImpl(this._value);

  final CommentData _value;

  @override
  CommentData body(String body) => this(body: body);

  @override
  CommentData name(String name) => this(name: name);

  @override
  CommentData postAt(String postAt) => this(postAt: postAt);

  @override
  CommentData sage(bool sage) => this(sage: sage);

  @override
  CommentData media(Uint8List? media) => this(media: media);

  @override
  CommentData filename(String? filename) => this(filename: filename);

  @override
  CommentData resnum(String? resnum) => this(resnum: resnum);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommentData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommentData(...).copyWith(id: 12, name: "My name")
  /// ````
  CommentData call({
    Object? body = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? postAt = const $CopyWithPlaceholder(),
    Object? sage = const $CopyWithPlaceholder(),
    Object? media = const $CopyWithPlaceholder(),
    Object? filename = const $CopyWithPlaceholder(),
    Object? resnum = const $CopyWithPlaceholder(),
  }) {
    return CommentData(
      body: body == const $CopyWithPlaceholder() || body == null
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      postAt: postAt == const $CopyWithPlaceholder() || postAt == null
          ? _value.postAt
          // ignore: cast_nullable_to_non_nullable
          : postAt as String,
      sage: sage == const $CopyWithPlaceholder() || sage == null
          ? _value.sage
          // ignore: cast_nullable_to_non_nullable
          : sage as bool,
      media: media == const $CopyWithPlaceholder()
          ? _value.media
          // ignore: cast_nullable_to_non_nullable
          : media as Uint8List?,
      filename: filename == const $CopyWithPlaceholder()
          ? _value.filename
          // ignore: cast_nullable_to_non_nullable
          : filename as String?,
      resnum: resnum == const $CopyWithPlaceholder()
          ? _value.resnum
          // ignore: cast_nullable_to_non_nullable
          : resnum as String?,
    );
  }
}

extension $CommentDataCopyWith on CommentData {
  /// Returns a callable class that can be used as follows: `instanceOfCommentData.copyWith(...)` or like so:`instanceOfCommentData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CommentDataCWProxy get copyWith => _$CommentDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as String,
      forums: (json['forums'] as List<dynamic>)
          .map((e) => $enumDecode(_$CommunitiesEnumMap, e))
          .toList(),
      randomAvatar: json['randomAvatar'] as String,
      lastOpenedForum:
          $enumDecode(_$CommunitiesEnumMap, json['lastOpenedForum']),
      language: $enumDecode(_$LangListEnumMap, json['language']),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'forums': instance.forums.map((e) => _$CommunitiesEnumMap[e]!).toList(),
      'randomAvatar': instance.randomAvatar,
      'lastOpenedForum': _$CommunitiesEnumMap[instance.lastOpenedForum]!,
      'language': _$LangListEnumMap[instance.language]!,
    };

const _$CommunitiesEnumMap = {
  Communities.fiveCh: 'fiveCh',
  Communities.girlsCh: 'girlsCh',
  Communities.futabaCh: 'futabaCh',
  Communities.pinkCh: 'pinkCh',
};

const _$LangListEnumMap = {
  LangList.ja: 'ja',
  LangList.en: 'en',
};
