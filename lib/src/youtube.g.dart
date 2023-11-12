// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$YoutubeBoardDataCWProxy {
  YoutubeBoardData id(String id);

  YoutubeBoardData name(String name);

  YoutubeBoardData forum(Communities forum);

  YoutubeBoardData channelHandle(String? channelHandle);

  YoutubeBoardData logo(String? logo);

  YoutubeBoardData banner(String? banner);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `YoutubeBoardData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// YoutubeBoardData(...).copyWith(id: 12, name: "My name")
  /// ````
  YoutubeBoardData call({
    String? id,
    String? name,
    Communities? forum,
    String? channelHandle,
    String? logo,
    String? banner,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfYoutubeBoardData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfYoutubeBoardData.copyWith.fieldName(...)`
class _$YoutubeBoardDataCWProxyImpl implements _$YoutubeBoardDataCWProxy {
  const _$YoutubeBoardDataCWProxyImpl(this._value);

  final YoutubeBoardData _value;

  @override
  YoutubeBoardData id(String id) => this(id: id);

  @override
  YoutubeBoardData name(String name) => this(name: name);

  @override
  YoutubeBoardData forum(Communities forum) => this(forum: forum);

  @override
  YoutubeBoardData channelHandle(String? channelHandle) =>
      this(channelHandle: channelHandle);

  @override
  YoutubeBoardData logo(String? logo) => this(logo: logo);

  @override
  YoutubeBoardData banner(String? banner) => this(banner: banner);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `YoutubeBoardData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// YoutubeBoardData(...).copyWith(id: 12, name: "My name")
  /// ````
  YoutubeBoardData call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? forum = const $CopyWithPlaceholder(),
    Object? channelHandle = const $CopyWithPlaceholder(),
    Object? logo = const $CopyWithPlaceholder(),
    Object? banner = const $CopyWithPlaceholder(),
  }) {
    return YoutubeBoardData(
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
      channelHandle: channelHandle == const $CopyWithPlaceholder()
          ? _value.channelHandle
          // ignore: cast_nullable_to_non_nullable
          : channelHandle as String?,
      logo: logo == const $CopyWithPlaceholder()
          ? _value.logo
          // ignore: cast_nullable_to_non_nullable
          : logo as String?,
      banner: banner == const $CopyWithPlaceholder()
          ? _value.banner
          // ignore: cast_nullable_to_non_nullable
          : banner as String?,
    );
  }
}

extension $YoutubeBoardDataCopyWith on YoutubeBoardData {
  /// Returns a callable class that can be used as follows: `instanceOfYoutubeBoardData.copyWith(...)` or like so:`instanceOfYoutubeBoardData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$YoutubeBoardDataCWProxy get copyWith => _$YoutubeBoardDataCWProxyImpl(this);
}

abstract class _$YoutubeThreadDataCWProxy {
  YoutubeThreadData id(String id);

  YoutubeThreadData title(String title);

  YoutubeThreadData dec(String dec);

  YoutubeThreadData resCount(int resCount);

  YoutubeThreadData boardId(String boardId);

  YoutubeThreadData type(Communities type);

  YoutubeThreadData url(String url);

  YoutubeThreadData thumbnailFullUrl(String? thumbnailFullUrl);

  YoutubeThreadData boardName(String? boardName);

  YoutubeThreadData dateStr(String? dateStr);

  YoutubeThreadData dateUtc(DateTime? dateUtc);

  YoutubeThreadData searched(bool searched);

  YoutubeThreadData channelId(String channelId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `YoutubeThreadData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// YoutubeThreadData(...).copyWith(id: 12, name: "My name")
  /// ````
  YoutubeThreadData call({
    String? id,
    String? title,
    String? dec,
    int? resCount,
    String? boardId,
    Communities? type,
    String? url,
    String? thumbnailFullUrl,
    String? boardName,
    String? dateStr,
    DateTime? dateUtc,
    bool? searched,
    String? channelId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfYoutubeThreadData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfYoutubeThreadData.copyWith.fieldName(...)`
class _$YoutubeThreadDataCWProxyImpl implements _$YoutubeThreadDataCWProxy {
  const _$YoutubeThreadDataCWProxyImpl(this._value);

  final YoutubeThreadData _value;

  @override
  YoutubeThreadData id(String id) => this(id: id);

  @override
  YoutubeThreadData title(String title) => this(title: title);

  @override
  YoutubeThreadData dec(String dec) => this(dec: dec);

  @override
  YoutubeThreadData resCount(int resCount) => this(resCount: resCount);

  @override
  YoutubeThreadData boardId(String boardId) => this(boardId: boardId);

  @override
  YoutubeThreadData type(Communities type) => this(type: type);

  @override
  YoutubeThreadData url(String url) => this(url: url);

  @override
  YoutubeThreadData thumbnailFullUrl(String? thumbnailFullUrl) =>
      this(thumbnailFullUrl: thumbnailFullUrl);

  @override
  YoutubeThreadData boardName(String? boardName) => this(boardName: boardName);

  @override
  YoutubeThreadData dateStr(String? dateStr) => this(dateStr: dateStr);

  @override
  YoutubeThreadData dateUtc(DateTime? dateUtc) => this(dateUtc: dateUtc);

  @override
  YoutubeThreadData searched(bool searched) => this(searched: searched);

  @override
  YoutubeThreadData channelId(String channelId) => this(channelId: channelId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `YoutubeThreadData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// YoutubeThreadData(...).copyWith(id: 12, name: "My name")
  /// ````
  YoutubeThreadData call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? dec = const $CopyWithPlaceholder(),
    Object? resCount = const $CopyWithPlaceholder(),
    Object? boardId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? thumbnailFullUrl = const $CopyWithPlaceholder(),
    Object? boardName = const $CopyWithPlaceholder(),
    Object? dateStr = const $CopyWithPlaceholder(),
    Object? dateUtc = const $CopyWithPlaceholder(),
    Object? searched = const $CopyWithPlaceholder(),
    Object? channelId = const $CopyWithPlaceholder(),
  }) {
    return YoutubeThreadData(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      dec: dec == const $CopyWithPlaceholder() || dec == null
          ? _value.dec
          // ignore: cast_nullable_to_non_nullable
          : dec as String,
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
      thumbnailFullUrl: thumbnailFullUrl == const $CopyWithPlaceholder()
          ? _value.thumbnailFullUrl
          // ignore: cast_nullable_to_non_nullable
          : thumbnailFullUrl as String?,
      boardName: boardName == const $CopyWithPlaceholder()
          ? _value.boardName
          // ignore: cast_nullable_to_non_nullable
          : boardName as String?,
      dateStr: dateStr == const $CopyWithPlaceholder()
          ? _value.dateStr
          // ignore: cast_nullable_to_non_nullable
          : dateStr as String?,
      dateUtc: dateUtc == const $CopyWithPlaceholder()
          ? _value.dateUtc
          // ignore: cast_nullable_to_non_nullable
          : dateUtc as DateTime?,
      searched: searched == const $CopyWithPlaceholder() || searched == null
          ? _value.searched
          // ignore: cast_nullable_to_non_nullable
          : searched as bool,
      channelId: channelId == const $CopyWithPlaceholder() || channelId == null
          ? _value.channelId
          // ignore: cast_nullable_to_non_nullable
          : channelId as String,
    );
  }
}

extension $YoutubeThreadDataCopyWith on YoutubeThreadData {
  /// Returns a callable class that can be used as follows: `instanceOfYoutubeThreadData.copyWith(...)` or like so:`instanceOfYoutubeThreadData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$YoutubeThreadDataCWProxy get copyWith =>
      _$YoutubeThreadDataCWProxyImpl(this);
}

abstract class _$YoutubeVideoSearchResultCWProxy {
  YoutubeVideoSearchResult data(VideoSearchList? data);

  YoutubeVideoSearchResult keyword(String keyword);

  YoutubeVideoSearchResult result(List<YoutubeThreadData?> result);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `YoutubeVideoSearchResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// YoutubeVideoSearchResult(...).copyWith(id: 12, name: "My name")
  /// ````
  YoutubeVideoSearchResult call({
    VideoSearchList? data,
    String? keyword,
    List<YoutubeThreadData?>? result,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfYoutubeVideoSearchResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfYoutubeVideoSearchResult.copyWith.fieldName(...)`
class _$YoutubeVideoSearchResultCWProxyImpl
    implements _$YoutubeVideoSearchResultCWProxy {
  const _$YoutubeVideoSearchResultCWProxyImpl(this._value);

  final YoutubeVideoSearchResult _value;

  @override
  YoutubeVideoSearchResult data(VideoSearchList? data) => this(data: data);

  @override
  YoutubeVideoSearchResult keyword(String keyword) => this(keyword: keyword);

  @override
  YoutubeVideoSearchResult result(List<YoutubeThreadData?> result) =>
      this(result: result);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `YoutubeVideoSearchResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// YoutubeVideoSearchResult(...).copyWith(id: 12, name: "My name")
  /// ````
  YoutubeVideoSearchResult call({
    Object? data = const $CopyWithPlaceholder(),
    Object? keyword = const $CopyWithPlaceholder(),
    Object? result = const $CopyWithPlaceholder(),
  }) {
    return YoutubeVideoSearchResult(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as VideoSearchList?,
      keyword: keyword == const $CopyWithPlaceholder() || keyword == null
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String,
      result: result == const $CopyWithPlaceholder() || result == null
          ? _value.result
          // ignore: cast_nullable_to_non_nullable
          : result as List<YoutubeThreadData?>,
    );
  }
}

extension $YoutubeVideoSearchResultCopyWith on YoutubeVideoSearchResult {
  /// Returns a callable class that can be used as follows: `instanceOfYoutubeVideoSearchResult.copyWith(...)` or like so:`instanceOfYoutubeVideoSearchResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$YoutubeVideoSearchResultCWProxy get copyWith =>
      _$YoutubeVideoSearchResultCWProxyImpl(this);
}
