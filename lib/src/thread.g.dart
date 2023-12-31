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

  ThreadData thumbnailFullUrl(String? thumbnailFullUrl);

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
    String? thumbnailFullUrl,
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
  ThreadData thumbnailFullUrl(String? thumbnailFullUrl) =>
      this(thumbnailFullUrl: thumbnailFullUrl);

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
    Object? thumbnailFullUrl = const $CopyWithPlaceholder(),
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
      thumbnailFullUrl: thumbnailFullUrl == const $CopyWithPlaceholder()
          ? _value.thumbnailFullUrl
          // ignore: cast_nullable_to_non_nullable
          : thumbnailFullUrl as String?,
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

  ThreadContentData range(RangeList? range);

  ThreadContentData girlsPages(GirlsPages? girlsPages);

  ThreadContentData tags(List<String?> tags);

  ThreadContentData malOption(MalOptionData? malOption);

  ThreadContentData ytComments(CommentsList? ytComments);

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
    RangeList? range,
    GirlsPages? girlsPages,
    List<String?>? tags,
    MalOptionData? malOption,
    CommentsList? ytComments,
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
  ThreadContentData range(RangeList? range) => this(range: range);

  @override
  ThreadContentData girlsPages(GirlsPages? girlsPages) =>
      this(girlsPages: girlsPages);

  @override
  ThreadContentData tags(List<String?> tags) => this(tags: tags);

  @override
  ThreadContentData malOption(MalOptionData? malOption) =>
      this(malOption: malOption);

  @override
  ThreadContentData ytComments(CommentsList? ytComments) =>
      this(ytComments: ytComments);

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
    Object? range = const $CopyWithPlaceholder(),
    Object? girlsPages = const $CopyWithPlaceholder(),
    Object? tags = const $CopyWithPlaceholder(),
    Object? malOption = const $CopyWithPlaceholder(),
    Object? ytComments = const $CopyWithPlaceholder(),
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
      malOption: malOption == const $CopyWithPlaceholder()
          ? _value.malOption
          // ignore: cast_nullable_to_non_nullable
          : malOption as MalOptionData?,
      ytComments: ytComments == const $CopyWithPlaceholder()
          ? _value.ytComments
          // ignore: cast_nullable_to_non_nullable
          : ytComments as CommentsList?,
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

  FetchThreadsResultData ytThreadsResult(YoutubeThreadsResult? ytThreadsResult);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FetchThreadsResultData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FetchThreadsResultData(...).copyWith(id: 12, name: "My name")
  /// ````
  FetchThreadsResultData call({
    List<ThreadData?>? threads,
    int? statusCode,
    YoutubeThreadsResult? ytThreadsResult,
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
  FetchThreadsResultData ytThreadsResult(
          YoutubeThreadsResult? ytThreadsResult) =>
      this(ytThreadsResult: ytThreadsResult);

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
    Object? ytThreadsResult = const $CopyWithPlaceholder(),
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
      ytThreadsResult: ytThreadsResult == const $CopyWithPlaceholder()
          ? _value.ytThreadsResult
          // ignore: cast_nullable_to_non_nullable
          : ytThreadsResult as YoutubeThreadsResult?,
    );
  }
}

extension $FetchThreadsResultDataCopyWith on FetchThreadsResultData {
  /// Returns a callable class that can be used as follows: `instanceOfFetchThreadsResultData.copyWith(...)` or like so:`instanceOfFetchThreadsResultData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FetchThreadsResultDataCWProxy get copyWith =>
      _$FetchThreadsResultDataCWProxyImpl(this);
}
