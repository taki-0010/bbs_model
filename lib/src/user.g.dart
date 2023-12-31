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

abstract class _$PostDataCWProxy {
  PostData body(String body);

  PostData name(String name);

  PostData title(String title);

  PostData media(Uint8List? media);

  PostData filename(String? filename);

  PostData email(String email);

  PostData postThread(bool postThread);

  PostData resnum(int? resnum);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostData(...).copyWith(id: 12, name: "My name")
  /// ````
  PostData call({
    String? body,
    String? name,
    String? title,
    Uint8List? media,
    String? filename,
    String? email,
    bool? postThread,
    int? resnum,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPostData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPostData.copyWith.fieldName(...)`
class _$PostDataCWProxyImpl implements _$PostDataCWProxy {
  const _$PostDataCWProxyImpl(this._value);

  final PostData _value;

  @override
  PostData body(String body) => this(body: body);

  @override
  PostData name(String name) => this(name: name);

  @override
  PostData title(String title) => this(title: title);

  @override
  PostData media(Uint8List? media) => this(media: media);

  @override
  PostData filename(String? filename) => this(filename: filename);

  @override
  PostData email(String email) => this(email: email);

  @override
  PostData postThread(bool postThread) => this(postThread: postThread);

  @override
  PostData resnum(int? resnum) => this(resnum: resnum);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostData(...).copyWith(id: 12, name: "My name")
  /// ````
  PostData call({
    Object? body = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? media = const $CopyWithPlaceholder(),
    Object? filename = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? postThread = const $CopyWithPlaceholder(),
    Object? resnum = const $CopyWithPlaceholder(),
  }) {
    return PostData(
      body: body == const $CopyWithPlaceholder() || body == null
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      media: media == const $CopyWithPlaceholder()
          ? _value.media
          // ignore: cast_nullable_to_non_nullable
          : media as Uint8List?,
      filename: filename == const $CopyWithPlaceholder()
          ? _value.filename
          // ignore: cast_nullable_to_non_nullable
          : filename as String?,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      postThread:
          postThread == const $CopyWithPlaceholder() || postThread == null
              ? _value.postThread
              // ignore: cast_nullable_to_non_nullable
              : postThread as bool,
      resnum: resnum == const $CopyWithPlaceholder()
          ? _value.resnum
          // ignore: cast_nullable_to_non_nullable
          : resnum as int?,
    );
  }
}

extension $PostDataCopyWith on PostData {
  /// Returns a callable class that can be used as follows: `instanceOfPostData.copyWith(...)` or like so:`instanceOfPostData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PostDataCWProxy get copyWith => _$PostDataCWProxyImpl(this);
}

abstract class _$TemplateDataCWProxy {
  TemplateData documentId(String documentId);

  TemplateData forum(Communities forum);

  TemplateData userId(String userId);

  TemplateData names(List<String?> names);

  TemplateData emails(List<String?> emails);

  TemplateData subjects(List<String?> subjects);

  TemplateData bodys(List<String?> bodys);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TemplateData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TemplateData(...).copyWith(id: 12, name: "My name")
  /// ````
  TemplateData call({
    String? documentId,
    Communities? forum,
    String? userId,
    List<String?>? names,
    List<String?>? emails,
    List<String?>? subjects,
    List<String?>? bodys,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTemplateData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTemplateData.copyWith.fieldName(...)`
class _$TemplateDataCWProxyImpl implements _$TemplateDataCWProxy {
  const _$TemplateDataCWProxyImpl(this._value);

  final TemplateData _value;

  @override
  TemplateData documentId(String documentId) => this(documentId: documentId);

  @override
  TemplateData forum(Communities forum) => this(forum: forum);

  @override
  TemplateData userId(String userId) => this(userId: userId);

  @override
  TemplateData names(List<String?> names) => this(names: names);

  @override
  TemplateData emails(List<String?> emails) => this(emails: emails);

  @override
  TemplateData subjects(List<String?> subjects) => this(subjects: subjects);

  @override
  TemplateData bodys(List<String?> bodys) => this(bodys: bodys);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TemplateData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TemplateData(...).copyWith(id: 12, name: "My name")
  /// ````
  TemplateData call({
    Object? documentId = const $CopyWithPlaceholder(),
    Object? forum = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? names = const $CopyWithPlaceholder(),
    Object? emails = const $CopyWithPlaceholder(),
    Object? subjects = const $CopyWithPlaceholder(),
    Object? bodys = const $CopyWithPlaceholder(),
  }) {
    return TemplateData(
      documentId:
          documentId == const $CopyWithPlaceholder() || documentId == null
              ? _value.documentId
              // ignore: cast_nullable_to_non_nullable
              : documentId as String,
      forum: forum == const $CopyWithPlaceholder() || forum == null
          ? _value.forum
          // ignore: cast_nullable_to_non_nullable
          : forum as Communities,
      userId: userId == const $CopyWithPlaceholder() || userId == null
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      names: names == const $CopyWithPlaceholder() || names == null
          ? _value.names
          // ignore: cast_nullable_to_non_nullable
          : names as List<String?>,
      emails: emails == const $CopyWithPlaceholder() || emails == null
          ? _value.emails
          // ignore: cast_nullable_to_non_nullable
          : emails as List<String?>,
      subjects: subjects == const $CopyWithPlaceholder() || subjects == null
          ? _value.subjects
          // ignore: cast_nullable_to_non_nullable
          : subjects as List<String?>,
      bodys: bodys == const $CopyWithPlaceholder() || bodys == null
          ? _value.bodys
          // ignore: cast_nullable_to_non_nullable
          : bodys as List<String?>,
    );
  }
}

extension $TemplateDataCopyWith on TemplateData {
  /// Returns a callable class that can be used as follows: `instanceOfTemplateData.copyWith(...)` or like so:`instanceOfTemplateData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TemplateDataCWProxy get copyWith => _$TemplateDataCWProxyImpl(this);
}

abstract class _$TemplateItemCWProxy {
  TemplateItem id(int id);

  TemplateItem data(String data);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TemplateItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TemplateItem(...).copyWith(id: 12, name: "My name")
  /// ````
  TemplateItem call({
    int? id,
    String? data,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTemplateItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTemplateItem.copyWith.fieldName(...)`
class _$TemplateItemCWProxyImpl implements _$TemplateItemCWProxy {
  const _$TemplateItemCWProxyImpl(this._value);

  final TemplateItem _value;

  @override
  TemplateItem id(int id) => this(id: id);

  @override
  TemplateItem data(String data) => this(data: data);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TemplateItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TemplateItem(...).copyWith(id: 12, name: "My name")
  /// ````
  TemplateItem call({
    Object? id = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
  }) {
    return TemplateItem(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      data: data == const $CopyWithPlaceholder() || data == null
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as String,
    );
  }
}

extension $TemplateItemCopyWith on TemplateItem {
  /// Returns a callable class that can be used as follows: `instanceOfTemplateItem.copyWith(...)` or like so:`instanceOfTemplateItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TemplateItemCWProxy get copyWith => _$TemplateItemCWProxyImpl(this);
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
  Communities.shitaraba: 'shitaraba',
  Communities.open2Ch: 'open2Ch',
  Communities.machi: 'machi',
  Communities.hatena: 'hatena',
  Communities.mal: 'mal',
  Communities.youtube: 'youtube',
  Communities.chan4: 'chan4',
};

const _$LangListEnumMap = {
  LangList.ja: 'ja',
  LangList.en: 'en',
};

TemplateData _$TemplateDataFromJson(Map<String, dynamic> json) => TemplateData(
      documentId: json['documentId'] as String,
      forum: $enumDecode(_$CommunitiesEnumMap, json['forum']),
      userId: json['userId'] as String,
      names: (json['names'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      emails: (json['emails'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      subjects: (json['subjects'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      bodys: (json['bodys'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TemplateDataToJson(TemplateData instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'forum': _$CommunitiesEnumMap[instance.forum]!,
      'userId': instance.userId,
      'names': instance.names,
      'emails': instance.emails,
      'subjects': instance.subjects,
      'bodys': instance.bodys,
    };

TemplateItem _$TemplateItemFromJson(Map<String, dynamic> json) => TemplateItem(
      id: json['id'] as int,
      data: json['data'] as String,
    );

Map<String, dynamic> _$TemplateItemToJson(TemplateItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
    };
