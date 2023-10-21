// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shitaraba.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ShitarabaCategoryDataCWProxy {
  ShitarabaCategoryData id(String id);

  ShitarabaCategoryData name(String name);

  ShitarabaCategoryData forum(Communities forum);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShitarabaCategoryData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShitarabaCategoryData(...).copyWith(id: 12, name: "My name")
  /// ````
  ShitarabaCategoryData call({
    String? id,
    String? name,
    Communities? forum,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfShitarabaCategoryData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfShitarabaCategoryData.copyWith.fieldName(...)`
class _$ShitarabaCategoryDataCWProxyImpl
    implements _$ShitarabaCategoryDataCWProxy {
  const _$ShitarabaCategoryDataCWProxyImpl(this._value);

  final ShitarabaCategoryData _value;

  @override
  ShitarabaCategoryData id(String id) => this(id: id);

  @override
  ShitarabaCategoryData name(String name) => this(name: name);

  @override
  ShitarabaCategoryData forum(Communities forum) => this(forum: forum);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShitarabaCategoryData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShitarabaCategoryData(...).copyWith(id: 12, name: "My name")
  /// ````
  ShitarabaCategoryData call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? forum = const $CopyWithPlaceholder(),
  }) {
    return ShitarabaCategoryData(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      forum: forum == const $CopyWithPlaceholder() || forum == null
          ? _value.forum
          // ignore: cast_nullable_to_non_nullable
          : forum as Communities,
    );
  }
}

extension $ShitarabaCategoryDataCopyWith on ShitarabaCategoryData {
  /// Returns a callable class that can be used as follows: `instanceOfShitarabaCategoryData.copyWith(...)` or like so:`instanceOfShitarabaCategoryData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ShitarabaCategoryDataCWProxy get copyWith =>
      _$ShitarabaCategoryDataCWProxyImpl(this);
}

abstract class _$ShitarabaBoardDataCWProxy {
  ShitarabaBoardData id(String id);

  ShitarabaBoardData name(String name);

  ShitarabaBoardData forum(Communities forum);

  ShitarabaBoardData category(String category);

  ShitarabaBoardData sub(String sub);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShitarabaBoardData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShitarabaBoardData(...).copyWith(id: 12, name: "My name")
  /// ````
  ShitarabaBoardData call({
    String? id,
    String? name,
    Communities? forum,
    String? category,
    String? sub,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfShitarabaBoardData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfShitarabaBoardData.copyWith.fieldName(...)`
class _$ShitarabaBoardDataCWProxyImpl implements _$ShitarabaBoardDataCWProxy {
  const _$ShitarabaBoardDataCWProxyImpl(this._value);

  final ShitarabaBoardData _value;

  @override
  ShitarabaBoardData id(String id) => this(id: id);

  @override
  ShitarabaBoardData name(String name) => this(name: name);

  @override
  ShitarabaBoardData forum(Communities forum) => this(forum: forum);

  @override
  ShitarabaBoardData category(String category) => this(category: category);

  @override
  ShitarabaBoardData sub(String sub) => this(sub: sub);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShitarabaBoardData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShitarabaBoardData(...).copyWith(id: 12, name: "My name")
  /// ````
  ShitarabaBoardData call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? forum = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
    Object? sub = const $CopyWithPlaceholder(),
  }) {
    return ShitarabaBoardData(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      forum: forum == const $CopyWithPlaceholder() || forum == null
          ? _value.forum
          // ignore: cast_nullable_to_non_nullable
          : forum as Communities,
      category: category == const $CopyWithPlaceholder() || category == null
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as String,
      sub: sub == const $CopyWithPlaceholder() || sub == null
          ? _value.sub
          // ignore: cast_nullable_to_non_nullable
          : sub as String,
    );
  }
}

extension $ShitarabaBoardDataCopyWith on ShitarabaBoardData {
  /// Returns a callable class that can be used as follows: `instanceOfShitarabaBoardData.copyWith(...)` or like so:`instanceOfShitarabaBoardData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ShitarabaBoardDataCWProxy get copyWith =>
      _$ShitarabaBoardDataCWProxyImpl(this);
}

abstract class _$ShitarabaThreadDataCWProxy {
  ShitarabaThreadData id(String id);

  ShitarabaThreadData title(String title);

  ShitarabaThreadData resCount(int resCount);

  ShitarabaThreadData boardId(String boardId);

  ShitarabaThreadData type(Communities type);

  ShitarabaThreadData url(String url);

  ShitarabaThreadData boardName(String? boardName);

  ShitarabaThreadData isNewPost(bool isNewPost);

  ShitarabaThreadData updateAtStr(String? updateAtStr);

  ShitarabaThreadData category(String category);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShitarabaThreadData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShitarabaThreadData(...).copyWith(id: 12, name: "My name")
  /// ````
  ShitarabaThreadData call({
    String? id,
    String? title,
    int? resCount,
    String? boardId,
    Communities? type,
    String? url,
    String? boardName,
    bool? isNewPost,
    String? updateAtStr,
    String? category,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfShitarabaThreadData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfShitarabaThreadData.copyWith.fieldName(...)`
class _$ShitarabaThreadDataCWProxyImpl implements _$ShitarabaThreadDataCWProxy {
  const _$ShitarabaThreadDataCWProxyImpl(this._value);

  final ShitarabaThreadData _value;

  @override
  ShitarabaThreadData id(String id) => this(id: id);

  @override
  ShitarabaThreadData title(String title) => this(title: title);

  @override
  ShitarabaThreadData resCount(int resCount) => this(resCount: resCount);

  @override
  ShitarabaThreadData boardId(String boardId) => this(boardId: boardId);

  @override
  ShitarabaThreadData type(Communities type) => this(type: type);

  @override
  ShitarabaThreadData url(String url) => this(url: url);

  @override
  ShitarabaThreadData boardName(String? boardName) =>
      this(boardName: boardName);

  @override
  ShitarabaThreadData isNewPost(bool isNewPost) => this(isNewPost: isNewPost);

  @override
  ShitarabaThreadData updateAtStr(String? updateAtStr) =>
      this(updateAtStr: updateAtStr);

  @override
  ShitarabaThreadData category(String category) => this(category: category);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShitarabaThreadData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShitarabaThreadData(...).copyWith(id: 12, name: "My name")
  /// ````
  ShitarabaThreadData call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? resCount = const $CopyWithPlaceholder(),
    Object? boardId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? boardName = const $CopyWithPlaceholder(),
    Object? isNewPost = const $CopyWithPlaceholder(),
    Object? updateAtStr = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
  }) {
    return ShitarabaThreadData(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      resCount: resCount == const $CopyWithPlaceholder() || resCount == null
          ? _value.resCount
          // ignore: cast_nullable_to_non_nullable
          : resCount as int,
      boardId: boardId == const $CopyWithPlaceholder() || boardId == null
          ? _value.boardId
          // ignore: cast_nullable_to_non_nullable
          : boardId as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as Communities,
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
      boardName: boardName == const $CopyWithPlaceholder()
          ? _value.boardName
          // ignore: cast_nullable_to_non_nullable
          : boardName as String?,
      isNewPost: isNewPost == const $CopyWithPlaceholder() || isNewPost == null
          ? _value.isNewPost
          // ignore: cast_nullable_to_non_nullable
          : isNewPost as bool,
      updateAtStr: updateAtStr == const $CopyWithPlaceholder()
          ? _value.updateAtStr
          // ignore: cast_nullable_to_non_nullable
          : updateAtStr as String?,
      category: category == const $CopyWithPlaceholder() || category == null
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as String,
    );
  }
}

extension $ShitarabaThreadDataCopyWith on ShitarabaThreadData {
  /// Returns a callable class that can be used as follows: `instanceOfShitarabaThreadData.copyWith(...)` or like so:`instanceOfShitarabaThreadData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ShitarabaThreadDataCWProxy get copyWith =>
      _$ShitarabaThreadDataCWProxyImpl(this);
}

abstract class _$ShitarabaContentDataCWProxy {
  ShitarabaContentData forum(Communities forum);

  ShitarabaContentData index(int index);

  ShitarabaContentData name(String name);

  ShitarabaContentData email(String? email);

  ShitarabaContentData body(String body);

  ShitarabaContentData title(String? title);

  ShitarabaContentData urlSet(List<String?>? urlSet);

  ShitarabaContentData category(String category);

  ShitarabaContentData boardId(String boardId);

  ShitarabaContentData id(String id);

  ShitarabaContentData date(String date);

  ShitarabaContentData userId(String? userId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShitarabaContentData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShitarabaContentData(...).copyWith(id: 12, name: "My name")
  /// ````
  ShitarabaContentData call({
    Communities? forum,
    int? index,
    String? name,
    String? email,
    String? body,
    String? title,
    List<String?>? urlSet,
    String? category,
    String? boardId,
    String? id,
    String? date,
    String? userId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfShitarabaContentData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfShitarabaContentData.copyWith.fieldName(...)`
class _$ShitarabaContentDataCWProxyImpl
    implements _$ShitarabaContentDataCWProxy {
  const _$ShitarabaContentDataCWProxyImpl(this._value);

  final ShitarabaContentData _value;

  @override
  ShitarabaContentData forum(Communities forum) => this(forum: forum);

  @override
  ShitarabaContentData index(int index) => this(index: index);

  @override
  ShitarabaContentData name(String name) => this(name: name);

  @override
  ShitarabaContentData email(String? email) => this(email: email);

  @override
  ShitarabaContentData body(String body) => this(body: body);

  @override
  ShitarabaContentData title(String? title) => this(title: title);

  @override
  ShitarabaContentData urlSet(List<String?>? urlSet) => this(urlSet: urlSet);

  @override
  ShitarabaContentData category(String category) => this(category: category);

  @override
  ShitarabaContentData boardId(String boardId) => this(boardId: boardId);

  @override
  ShitarabaContentData id(String id) => this(id: id);

  @override
  ShitarabaContentData date(String date) => this(date: date);

  @override
  ShitarabaContentData userId(String? userId) => this(userId: userId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ShitarabaContentData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ShitarabaContentData(...).copyWith(id: 12, name: "My name")
  /// ````
  ShitarabaContentData call({
    Object? forum = const $CopyWithPlaceholder(),
    Object? index = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? body = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? urlSet = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
    Object? boardId = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
  }) {
    return ShitarabaContentData(
      forum: forum == const $CopyWithPlaceholder() || forum == null
          ? _value.forum
          // ignore: cast_nullable_to_non_nullable
          : forum as Communities,
      index: index == const $CopyWithPlaceholder() || index == null
          ? _value.index
          // ignore: cast_nullable_to_non_nullable
          : index as int,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      body: body == const $CopyWithPlaceholder() || body == null
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      urlSet: urlSet == const $CopyWithPlaceholder()
          ? _value.urlSet
          // ignore: cast_nullable_to_non_nullable
          : urlSet as List<String?>?,
      category: category == const $CopyWithPlaceholder() || category == null
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as String,
      boardId: boardId == const $CopyWithPlaceholder() || boardId == null
          ? _value.boardId
          // ignore: cast_nullable_to_non_nullable
          : boardId as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      date: date == const $CopyWithPlaceholder() || date == null
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as String,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
    );
  }
}

extension $ShitarabaContentDataCopyWith on ShitarabaContentData {
  /// Returns a callable class that can be used as follows: `instanceOfShitarabaContentData.copyWith(...)` or like so:`instanceOfShitarabaContentData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ShitarabaContentDataCWProxy get copyWith =>
      _$ShitarabaContentDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShitarabaCategoryData _$ShitarabaCategoryDataFromJson(
        Map<String, dynamic> json) =>
    ShitarabaCategoryData(
      id: json['id'] as String,
      name: json['name'] as String,
      forum: $enumDecode(_$CommunitiesEnumMap, json['forum']),
    );

Map<String, dynamic> _$ShitarabaCategoryDataToJson(
        ShitarabaCategoryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'forum': _$CommunitiesEnumMap[instance.forum]!,
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
  Communities.chan4: 'chan4',
};

ShitarabaBoardData _$ShitarabaBoardDataFromJson(Map<String, dynamic> json) =>
    ShitarabaBoardData(
      id: json['id'] as String,
      name: json['name'] as String,
      forum: $enumDecode(_$CommunitiesEnumMap, json['forum']),
      category: json['category'] as String,
      sub: json['sub'] as String,
    );

Map<String, dynamic> _$ShitarabaBoardDataToJson(ShitarabaBoardData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'forum': _$CommunitiesEnumMap[instance.forum]!,
      'category': instance.category,
      'sub': instance.sub,
    };

ShitarabaContentData _$ShitarabaContentDataFromJson(
        Map<String, dynamic> json) =>
    ShitarabaContentData(
      forum: $enumDecode(_$CommunitiesEnumMap, json['forum']),
      index: json['index'] as int,
      name: json['name'] as String,
      email: json['email'] as String?,
      body: json['body'] as String,
      title: json['title'] as String?,
      urlSet:
          (json['urlSet'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      category: json['category'] as String,
      boardId: json['boardId'] as String,
      id: json['id'] as String,
      date: json['date'] as String,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$ShitarabaContentDataToJson(
        ShitarabaContentData instance) =>
    <String, dynamic>{
      'forum': _$CommunitiesEnumMap[instance.forum]!,
      'index': instance.index,
      'body': instance.body,
      'urlSet': instance.urlSet,
      'name': instance.name,
      'userId': instance.userId,
      'title': instance.title,
      'email': instance.email,
      'category': instance.category,
      'boardId': instance.boardId,
      'id': instance.id,
      'date': instance.date,
    };
