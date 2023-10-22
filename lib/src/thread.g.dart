// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ThreadDataCWProxy {
  ThreadData id(String id);

  ThreadData title(String title);

  ThreadData resCount(int resCount);

  ThreadData type(Communities type);

  ThreadData thumbnailStr(String? thumbnailStr);

  ThreadData url(String url);

  ThreadData updateAtStr(String? updateAtStr);

  ThreadData boardId(String boardId);

  ThreadData boardName(String? boardName);

  ThreadData catalog(bool catalog);

  ThreadData isNewPost(bool isNewPost);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThreadData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThreadData(...).copyWith(id: 12, name: "My name")
  /// ````
  ThreadData call({
    String? id,
    String? title,
    int? resCount,
    Communities? type,
    String? thumbnailStr,
    String? url,
    String? updateAtStr,
    String? boardId,
    String? boardName,
    bool? catalog,
    bool? isNewPost,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfThreadData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfThreadData.copyWith.fieldName(...)`
class _$ThreadDataCWProxyImpl implements _$ThreadDataCWProxy {
  const _$ThreadDataCWProxyImpl(this._value);

  final ThreadData _value;

  @override
  ThreadData id(String id) => this(id: id);

  @override
  ThreadData title(String title) => this(title: title);

  @override
  ThreadData resCount(int resCount) => this(resCount: resCount);

  @override
  ThreadData type(Communities type) => this(type: type);

  @override
  ThreadData thumbnailStr(String? thumbnailStr) =>
      this(thumbnailStr: thumbnailStr);

  @override
  ThreadData url(String url) => this(url: url);

  @override
  ThreadData updateAtStr(String? updateAtStr) => this(updateAtStr: updateAtStr);

  @override
  ThreadData boardId(String boardId) => this(boardId: boardId);

  @override
  ThreadData boardName(String? boardName) => this(boardName: boardName);

  @override
  ThreadData catalog(bool catalog) => this(catalog: catalog);

  @override
  ThreadData isNewPost(bool isNewPost) => this(isNewPost: isNewPost);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThreadData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThreadData(...).copyWith(id: 12, name: "My name")
  /// ````
  ThreadData call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? resCount = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? thumbnailStr = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? updateAtStr = const $CopyWithPlaceholder(),
    Object? boardId = const $CopyWithPlaceholder(),
    Object? boardName = const $CopyWithPlaceholder(),
    Object? catalog = const $CopyWithPlaceholder(),
    Object? isNewPost = const $CopyWithPlaceholder(),
  }) {
    return ThreadData(
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
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as Communities,
      thumbnailStr: thumbnailStr == const $CopyWithPlaceholder()
          ? _value.thumbnailStr
          // ignore: cast_nullable_to_non_nullable
          : thumbnailStr as String?,
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
      updateAtStr: updateAtStr == const $CopyWithPlaceholder()
          ? _value.updateAtStr
          // ignore: cast_nullable_to_non_nullable
          : updateAtStr as String?,
      boardId: boardId == const $CopyWithPlaceholder() || boardId == null
          ? _value.boardId
          // ignore: cast_nullable_to_non_nullable
          : boardId as String,
      boardName: boardName == const $CopyWithPlaceholder()
          ? _value.boardName
          // ignore: cast_nullable_to_non_nullable
          : boardName as String?,
      catalog: catalog == const $CopyWithPlaceholder() || catalog == null
          ? _value.catalog
          // ignore: cast_nullable_to_non_nullable
          : catalog as bool,
      isNewPost: isNewPost == const $CopyWithPlaceholder() || isNewPost == null
          ? _value.isNewPost
          // ignore: cast_nullable_to_non_nullable
          : isNewPost as bool,
    );
  }
}

extension $ThreadDataCopyWith on ThreadData {
  /// Returns a callable class that can be used as follows: `instanceOfThreadData.copyWith(...)` or like so:`instanceOfThreadData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ThreadDataCWProxy get copyWith => _$ThreadDataCWProxyImpl(this);
}

abstract class _$ThreadContentDataCWProxy {
  ThreadContentData id(String id);

  ThreadContentData boardId(String boardId);

  ThreadContentData type(Communities type);

  ThreadContentData threadLength(int threadLength);

  ThreadContentData content(List<ContentData?> content);

  ThreadContentData hot(double hot);

  ThreadContentData range(RangeList? range);

  ThreadContentData girlsPages(GirlsPages? girlsPages);

  ThreadContentData tags(List<String?> tags);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThreadContentData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThreadContentData(...).copyWith(id: 12, name: "My name")
  /// ````
  ThreadContentData call({
    String? id,
    String? boardId,
    Communities? type,
    int? threadLength,
    List<ContentData?>? content,
    double? hot,
    RangeList? range,
    GirlsPages? girlsPages,
    List<String?>? tags,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfThreadContentData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfThreadContentData.copyWith.fieldName(...)`
class _$ThreadContentDataCWProxyImpl implements _$ThreadContentDataCWProxy {
  const _$ThreadContentDataCWProxyImpl(this._value);

  final ThreadContentData _value;

  @override
  ThreadContentData id(String id) => this(id: id);

  @override
  ThreadContentData boardId(String boardId) => this(boardId: boardId);

  @override
  ThreadContentData type(Communities type) => this(type: type);

  @override
  ThreadContentData threadLength(int threadLength) =>
      this(threadLength: threadLength);

  @override
  ThreadContentData content(List<ContentData?> content) =>
      this(content: content);

  @override
  ThreadContentData hot(double hot) => this(hot: hot);

  @override
  ThreadContentData range(RangeList? range) => this(range: range);

  @override
  ThreadContentData girlsPages(GirlsPages? girlsPages) =>
      this(girlsPages: girlsPages);

  @override
  ThreadContentData tags(List<String?> tags) => this(tags: tags);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThreadContentData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThreadContentData(...).copyWith(id: 12, name: "My name")
  /// ````
  ThreadContentData call({
    Object? id = const $CopyWithPlaceholder(),
    Object? boardId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? threadLength = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
    Object? hot = const $CopyWithPlaceholder(),
    Object? range = const $CopyWithPlaceholder(),
    Object? girlsPages = const $CopyWithPlaceholder(),
    Object? tags = const $CopyWithPlaceholder(),
  }) {
    return ThreadContentData(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      boardId: boardId == const $CopyWithPlaceholder() || boardId == null
          ? _value.boardId
          // ignore: cast_nullable_to_non_nullable
          : boardId as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as Communities,
      threadLength:
          threadLength == const $CopyWithPlaceholder() || threadLength == null
              ? _value.threadLength
              // ignore: cast_nullable_to_non_nullable
              : threadLength as int,
      content: content == const $CopyWithPlaceholder() || content == null
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as List<ContentData?>,
      hot: hot == const $CopyWithPlaceholder() || hot == null
          ? _value.hot
          // ignore: cast_nullable_to_non_nullable
          : hot as double,
      range: range == const $CopyWithPlaceholder()
          ? _value.range
          // ignore: cast_nullable_to_non_nullable
          : range as RangeList?,
      girlsPages: girlsPages == const $CopyWithPlaceholder()
          ? _value.girlsPages
          // ignore: cast_nullable_to_non_nullable
          : girlsPages as GirlsPages?,
      tags: tags == const $CopyWithPlaceholder() || tags == null
          ? _value.tags
          // ignore: cast_nullable_to_non_nullable
          : tags as List<String?>,
    );
  }
}

extension $ThreadContentDataCopyWith on ThreadContentData {
  /// Returns a callable class that can be used as follows: `instanceOfThreadContentData.copyWith(...)` or like so:`instanceOfThreadContentData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ThreadContentDataCWProxy get copyWith =>
      _$ThreadContentDataCWProxyImpl(this);
}

abstract class _$FetchThreadsResultDataCWProxy {
  FetchThreadsResultData threads(List<ThreadData?>? threads);

  FetchThreadsResultData statusCode(int? statusCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FetchThreadsResultData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FetchThreadsResultData(...).copyWith(id: 12, name: "My name")
  /// ````
  FetchThreadsResultData call({
    List<ThreadData?>? threads,
    int? statusCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFetchThreadsResultData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFetchThreadsResultData.copyWith.fieldName(...)`
class _$FetchThreadsResultDataCWProxyImpl
    implements _$FetchThreadsResultDataCWProxy {
  const _$FetchThreadsResultDataCWProxyImpl(this._value);

  final FetchThreadsResultData _value;

  @override
  FetchThreadsResultData threads(List<ThreadData?>? threads) =>
      this(threads: threads);

  @override
  FetchThreadsResultData statusCode(int? statusCode) =>
      this(statusCode: statusCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FetchThreadsResultData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FetchThreadsResultData(...).copyWith(id: 12, name: "My name")
  /// ````
  FetchThreadsResultData call({
    Object? threads = const $CopyWithPlaceholder(),
    Object? statusCode = const $CopyWithPlaceholder(),
  }) {
    return FetchThreadsResultData(
      threads: threads == const $CopyWithPlaceholder()
          ? _value.threads
          // ignore: cast_nullable_to_non_nullable
          : threads as List<ThreadData?>?,
      statusCode: statusCode == const $CopyWithPlaceholder()
          ? _value.statusCode
          // ignore: cast_nullable_to_non_nullable
          : statusCode as int?,
    );
  }
}

extension $FetchThreadsResultDataCopyWith on FetchThreadsResultData {
  /// Returns a callable class that can be used as follows: `instanceOfFetchThreadsResultData.copyWith(...)` or like so:`instanceOfFetchThreadsResultData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FetchThreadsResultDataCWProxy get copyWith =>
      _$FetchThreadsResultDataCWProxyImpl(this);
}

abstract class _$PostDraftDataCWProxy {
  PostDraftData body(String? body);

  PostDraftData userId(String userId);

  PostDraftData forum(Communities forum);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostDraftData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostDraftData(...).copyWith(id: 12, name: "My name")
  /// ````
  PostDraftData call({
    String? body,
    String? userId,
    Communities? forum,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPostDraftData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPostDraftData.copyWith.fieldName(...)`
class _$PostDraftDataCWProxyImpl implements _$PostDraftDataCWProxy {
  const _$PostDraftDataCWProxyImpl(this._value);

  final PostDraftData _value;

  @override
  PostDraftData body(String? body) => this(body: body);

  @override
  PostDraftData userId(String userId) => this(userId: userId);

  @override
  PostDraftData forum(Communities forum) => this(forum: forum);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostDraftData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostDraftData(...).copyWith(id: 12, name: "My name")
  /// ````
  PostDraftData call({
    Object? body = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? forum = const $CopyWithPlaceholder(),
  }) {
    return PostDraftData(
      body: body == const $CopyWithPlaceholder()
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String?,
      userId: userId == const $CopyWithPlaceholder() || userId == null
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      forum: forum == const $CopyWithPlaceholder() || forum == null
          ? _value.forum
          // ignore: cast_nullable_to_non_nullable
          : forum as Communities,
    );
  }
}

extension $PostDraftDataCopyWith on PostDraftData {
  /// Returns a callable class that can be used as follows: `instanceOfPostDraftData.copyWith(...)` or like so:`instanceOfPostDraftData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PostDraftDataCWProxy get copyWith => _$PostDraftDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDraftData _$PostDraftDataFromJson(Map<String, dynamic> json) =>
    PostDraftData(
      body: json['body'] as String?,
      userId: json['userId'] as String,
      forum: $enumDecode(_$CommunitiesEnumMap, json['forum']),
    );

Map<String, dynamic> _$PostDraftDataToJson(PostDraftData instance) =>
    <String, dynamic>{
      'body': instance.body,
      'userId': instance.userId,
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
