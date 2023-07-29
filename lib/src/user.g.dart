// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserSettingsDataCWProxy {
  UserSettingsData forums(List<ForumSettingsData?> forums);

  UserSettingsData lastOpenedForum(Communities? lastOpenedForum);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserSettingsData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserSettingsData(...).copyWith(id: 12, name: "My name")
  /// ````
  UserSettingsData call({
    List<ForumSettingsData?>? forums,
    Communities? lastOpenedForum,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserSettingsData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserSettingsData.copyWith.fieldName(...)`
class _$UserSettingsDataCWProxyImpl implements _$UserSettingsDataCWProxy {
  const _$UserSettingsDataCWProxyImpl(this._value);

  final UserSettingsData _value;

  @override
  UserSettingsData forums(List<ForumSettingsData?> forums) =>
      this(forums: forums);

  @override
  UserSettingsData lastOpenedForum(Communities? lastOpenedForum) =>
      this(lastOpenedForum: lastOpenedForum);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserSettingsData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserSettingsData(...).copyWith(id: 12, name: "My name")
  /// ````
  UserSettingsData call({
    Object? forums = const $CopyWithPlaceholder(),
    Object? lastOpenedForum = const $CopyWithPlaceholder(),
  }) {
    return UserSettingsData(
      forums: forums == const $CopyWithPlaceholder() || forums == null
          ? _value.forums
          // ignore: cast_nullable_to_non_nullable
          : forums as List<ForumSettingsData?>,
      lastOpenedForum: lastOpenedForum == const $CopyWithPlaceholder()
          ? _value.lastOpenedForum
          // ignore: cast_nullable_to_non_nullable
          : lastOpenedForum as Communities?,
    );
  }
}

extension $UserSettingsDataCopyWith on UserSettingsData {
  /// Returns a callable class that can be used as follows: `instanceOfUserSettingsData.copyWith(...)` or like so:`instanceOfUserSettingsData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserSettingsDataCWProxy get copyWith => _$UserSettingsDataCWProxyImpl(this);
}

abstract class _$ForumSettingsDataCWProxy {
  ForumSettingsData forum(Communities forum);

  ForumSettingsData theme(ThemeList theme);

  ForumSettingsData cacheExpire(CacheExpire cacheExpire);

  ForumSettingsData threadsOrder(ThreadsOrder threadsOrder);

  ForumSettingsData positionToGet(PositionToGet positionToGet);

  ForumSettingsData visibleResCountThreshold(int visibleResCountThreshold);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ForumSettingsData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ForumSettingsData(...).copyWith(id: 12, name: "My name")
  /// ````
  ForumSettingsData call({
    Communities? forum,
    ThemeList? theme,
    CacheExpire? cacheExpire,
    ThreadsOrder? threadsOrder,
    PositionToGet? positionToGet,
    int? visibleResCountThreshold,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfForumSettingsData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfForumSettingsData.copyWith.fieldName(...)`
class _$ForumSettingsDataCWProxyImpl implements _$ForumSettingsDataCWProxy {
  const _$ForumSettingsDataCWProxyImpl(this._value);

  final ForumSettingsData _value;

  @override
  ForumSettingsData forum(Communities forum) => this(forum: forum);

  @override
  ForumSettingsData theme(ThemeList theme) => this(theme: theme);

  @override
  ForumSettingsData cacheExpire(CacheExpire cacheExpire) =>
      this(cacheExpire: cacheExpire);

  @override
  ForumSettingsData threadsOrder(ThreadsOrder threadsOrder) =>
      this(threadsOrder: threadsOrder);

  @override
  ForumSettingsData positionToGet(PositionToGet positionToGet) =>
      this(positionToGet: positionToGet);

  @override
  ForumSettingsData visibleResCountThreshold(int visibleResCountThreshold) =>
      this(visibleResCountThreshold: visibleResCountThreshold);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ForumSettingsData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ForumSettingsData(...).copyWith(id: 12, name: "My name")
  /// ````
  ForumSettingsData call({
    Object? forum = const $CopyWithPlaceholder(),
    Object? theme = const $CopyWithPlaceholder(),
    Object? cacheExpire = const $CopyWithPlaceholder(),
    Object? threadsOrder = const $CopyWithPlaceholder(),
    Object? positionToGet = const $CopyWithPlaceholder(),
    Object? visibleResCountThreshold = const $CopyWithPlaceholder(),
  }) {
    return ForumSettingsData(
      forum: forum == const $CopyWithPlaceholder() || forum == null
          ? _value.forum
          // ignore: cast_nullable_to_non_nullable
          : forum as Communities,
      theme: theme == const $CopyWithPlaceholder() || theme == null
          ? _value.theme
          // ignore: cast_nullable_to_non_nullable
          : theme as ThemeList,
      cacheExpire:
          cacheExpire == const $CopyWithPlaceholder() || cacheExpire == null
              ? _value.cacheExpire
              // ignore: cast_nullable_to_non_nullable
              : cacheExpire as CacheExpire,
      threadsOrder:
          threadsOrder == const $CopyWithPlaceholder() || threadsOrder == null
              ? _value.threadsOrder
              // ignore: cast_nullable_to_non_nullable
              : threadsOrder as ThreadsOrder,
      positionToGet:
          positionToGet == const $CopyWithPlaceholder() || positionToGet == null
              ? _value.positionToGet
              // ignore: cast_nullable_to_non_nullable
              : positionToGet as PositionToGet,
      visibleResCountThreshold:
          visibleResCountThreshold == const $CopyWithPlaceholder() ||
                  visibleResCountThreshold == null
              ? _value.visibleResCountThreshold
              // ignore: cast_nullable_to_non_nullable
              : visibleResCountThreshold as int,
    );
  }
}

extension $ForumSettingsDataCopyWith on ForumSettingsData {
  /// Returns a callable class that can be used as follows: `instanceOfForumSettingsData.copyWith(...)` or like so:`instanceOfForumSettingsData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ForumSettingsDataCWProxy get copyWith =>
      _$ForumSettingsDataCWProxyImpl(this);
}

abstract class _$CommentDataCWProxy {
  CommentData body(String body);

  CommentData name(String name);

  CommentData postAt(String postAt);

  CommentData forum(Communities forum);

  CommentData threadId(String threadId);

  CommentData threadTitle(String threadTitle);

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
    Communities? forum,
    String? threadId,
    String? threadTitle,
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
  CommentData forum(Communities forum) => this(forum: forum);

  @override
  CommentData threadId(String threadId) => this(threadId: threadId);

  @override
  CommentData threadTitle(String threadTitle) => this(threadTitle: threadTitle);

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
    Object? forum = const $CopyWithPlaceholder(),
    Object? threadId = const $CopyWithPlaceholder(),
    Object? threadTitle = const $CopyWithPlaceholder(),
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
      forum: forum == const $CopyWithPlaceholder() || forum == null
          ? _value.forum
          // ignore: cast_nullable_to_non_nullable
          : forum as Communities,
      threadId: threadId == const $CopyWithPlaceholder() || threadId == null
          ? _value.threadId
          // ignore: cast_nullable_to_non_nullable
          : threadId as String,
      threadTitle:
          threadTitle == const $CopyWithPlaceholder() || threadTitle == null
              ? _value.threadTitle
              // ignore: cast_nullable_to_non_nullable
              : threadTitle as String,
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

UserSettingsData _$UserSettingsDataFromJson(Map<String, dynamic> json) =>
    UserSettingsData(
      forums: (json['forums'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : ForumSettingsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastOpenedForum:
          $enumDecodeNullable(_$CommunitiesEnumMap, json['lastOpenedForum']),
    );

Map<String, dynamic> _$UserSettingsDataToJson(UserSettingsData instance) =>
    <String, dynamic>{
      'forums': instance.forums,
      'lastOpenedForum': _$CommunitiesEnumMap[instance.lastOpenedForum],
    };

const _$CommunitiesEnumMap = {
  Communities.fiveCh: 'fiveCh',
  Communities.girlsCh: 'girlsCh',
  Communities.futabaCh: 'futabaCh',
};

ForumSettingsData _$ForumSettingsDataFromJson(Map<String, dynamic> json) =>
    ForumSettingsData(
      forum: $enumDecode(_$CommunitiesEnumMap, json['forum']),
      theme: $enumDecode(_$ThemeListEnumMap, json['theme']),
      cacheExpire: $enumDecode(_$CacheExpireEnumMap, json['cacheExpire']),
      threadsOrder:
          $enumDecodeNullable(_$ThreadsOrderEnumMap, json['threadsOrder']) ??
              ThreadsOrder.ikioi,
      positionToGet:
          $enumDecodeNullable(_$PositionToGetEnumMap, json['positionToGet']) ??
              PositionToGet.first,
      visibleResCountThreshold: json['visibleResCountThreshold'] as int? ?? 5,
    );

Map<String, dynamic> _$ForumSettingsDataToJson(ForumSettingsData instance) =>
    <String, dynamic>{
      'forum': _$CommunitiesEnumMap[instance.forum]!,
      'theme': _$ThemeListEnumMap[instance.theme]!,
      'cacheExpire': _$CacheExpireEnumMap[instance.cacheExpire]!,
      'threadsOrder': _$ThreadsOrderEnumMap[instance.threadsOrder]!,
      'positionToGet': _$PositionToGetEnumMap[instance.positionToGet]!,
      'visibleResCountThreshold': instance.visibleResCountThreshold,
    };

const _$ThemeListEnumMap = {
  ThemeList.m3Purple: 'm3Purple',
  ThemeList.rosewood: 'rosewood',
  ThemeList.sanJuanBlue: 'sanJuanBlue',
  ThemeList.espresso: 'espresso',
};

const _$CacheExpireEnumMap = {
  CacheExpire.oneDay: 'oneDay',
  CacheExpire.oneWeek: 'oneWeek',
  CacheExpire.twoWeeks: 'twoWeeks',
  CacheExpire.oneMonth: 'oneMonth',
  CacheExpire.indefinite: 'indefinite',
};

const _$ThreadsOrderEnumMap = {
  ThreadsOrder.newOrder: 'newOrder',
  ThreadsOrder.oldOrder: 'oldOrder',
  ThreadsOrder.ikioi: 'ikioi',
  ThreadsOrder.biggerResCount: 'biggerResCount',
  ThreadsOrder.catalog: 'catalog',
};

const _$PositionToGetEnumMap = {
  PositionToGet.first: 'first',
  PositionToGet.last: 'last',
};

CommentData _$CommentDataFromJson(Map<String, dynamic> json) => CommentData(
      body: json['body'] as String,
      name: json['name'] as String,
      postAt: json['postAt'] as String,
      forum: $enumDecode(_$CommunitiesEnumMap, json['forum']),
      threadId: json['threadId'] as String,
      threadTitle: json['threadTitle'] as String,
      resnum: json['resnum'] as String?,
    );

Map<String, dynamic> _$CommentDataToJson(CommentData instance) =>
    <String, dynamic>{
      'body': instance.body,
      'name': instance.name,
      'postAt': instance.postAt,
      'forum': _$CommunitiesEnumMap[instance.forum]!,
      'threadId': instance.threadId,
      'threadTitle': instance.threadTitle,
      'resnum': instance.resnum,
    };
