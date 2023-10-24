// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hatena_b.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HatenaThreadDataCWProxy {
  HatenaThreadData id(String id);

  HatenaThreadData title(String title);

  HatenaThreadData dec(String dec);

  HatenaThreadData resCount(int resCount);

  HatenaThreadData boardId(String boardId);

  HatenaThreadData type(Communities type);

  HatenaThreadData url(String url);

  HatenaThreadData thumbnailFullUrl(String? thumbnailFullUrl);

  HatenaThreadData tags(List<String?> tags);

  HatenaThreadData thumbnailStr(String? thumbnailStr);

  HatenaThreadData dateStr(String? dateStr);

  HatenaThreadData dateUtc(DateTime? dateUtc);

  HatenaThreadData searched(bool searched);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HatenaThreadData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HatenaThreadData(...).copyWith(id: 12, name: "My name")
  /// ````
  HatenaThreadData call({
    String? id,
    String? title,
    String? dec,
    int? resCount,
    String? boardId,
    Communities? type,
    String? url,
    String? thumbnailFullUrl,
    List<String?>? tags,
    String? thumbnailStr,
    String? dateStr,
    DateTime? dateUtc,
    bool? searched,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHatenaThreadData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHatenaThreadData.copyWith.fieldName(...)`
class _$HatenaThreadDataCWProxyImpl implements _$HatenaThreadDataCWProxy {
  const _$HatenaThreadDataCWProxyImpl(this._value);

  final HatenaThreadData _value;

  @override
  HatenaThreadData id(String id) => this(id: id);

  @override
  HatenaThreadData title(String title) => this(title: title);

  @override
  HatenaThreadData dec(String dec) => this(dec: dec);

  @override
  HatenaThreadData resCount(int resCount) => this(resCount: resCount);

  @override
  HatenaThreadData boardId(String boardId) => this(boardId: boardId);

  @override
  HatenaThreadData type(Communities type) => this(type: type);

  @override
  HatenaThreadData url(String url) => this(url: url);

  @override
  HatenaThreadData thumbnailFullUrl(String? thumbnailFullUrl) =>
      this(thumbnailFullUrl: thumbnailFullUrl);

  @override
  HatenaThreadData tags(List<String?> tags) => this(tags: tags);

  @override
  HatenaThreadData thumbnailStr(String? thumbnailStr) =>
      this(thumbnailStr: thumbnailStr);

  @override
  HatenaThreadData dateStr(String? dateStr) => this(dateStr: dateStr);

  @override
  HatenaThreadData dateUtc(DateTime? dateUtc) => this(dateUtc: dateUtc);

  @override
  HatenaThreadData searched(bool searched) => this(searched: searched);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HatenaThreadData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HatenaThreadData(...).copyWith(id: 12, name: "My name")
  /// ````
  HatenaThreadData call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? dec = const $CopyWithPlaceholder(),
    Object? resCount = const $CopyWithPlaceholder(),
    Object? boardId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? thumbnailFullUrl = const $CopyWithPlaceholder(),
    Object? tags = const $CopyWithPlaceholder(),
    Object? thumbnailStr = const $CopyWithPlaceholder(),
    Object? dateStr = const $CopyWithPlaceholder(),
    Object? dateUtc = const $CopyWithPlaceholder(),
    Object? searched = const $CopyWithPlaceholder(),
  }) {
    return HatenaThreadData(
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
      tags: tags == const $CopyWithPlaceholder() || tags == null
          ? _value.tags
          // ignore: cast_nullable_to_non_nullable
          : tags as List<String?>,
      thumbnailStr: thumbnailStr == const $CopyWithPlaceholder()
          ? _value.thumbnailStr
          // ignore: cast_nullable_to_non_nullable
          : thumbnailStr as String?,
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
    );
  }
}

extension $HatenaThreadDataCopyWith on HatenaThreadData {
  /// Returns a callable class that can be used as follows: `instanceOfHatenaThreadData.copyWith(...)` or like so:`instanceOfHatenaThreadData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HatenaThreadDataCWProxy get copyWith => _$HatenaThreadDataCWProxyImpl(this);
}

abstract class _$HatenaEntryDataCWProxy {
  HatenaEntryData title(String title);

  HatenaEntryData count(int count);

  HatenaEntryData url(String url);

  HatenaEntryData entryUrl(String entryUrl);

  HatenaEntryData screenshot(String screenshot);

  HatenaEntryData eid(String eid);

  HatenaEntryData bookmarks(List<HatenaBookmarkData?> bookmarks);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HatenaEntryData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HatenaEntryData(...).copyWith(id: 12, name: "My name")
  /// ````
  HatenaEntryData call({
    String? title,
    int? count,
    String? url,
    String? entryUrl,
    String? screenshot,
    String? eid,
    List<HatenaBookmarkData?>? bookmarks,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHatenaEntryData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHatenaEntryData.copyWith.fieldName(...)`
class _$HatenaEntryDataCWProxyImpl implements _$HatenaEntryDataCWProxy {
  const _$HatenaEntryDataCWProxyImpl(this._value);

  final HatenaEntryData _value;

  @override
  HatenaEntryData title(String title) => this(title: title);

  @override
  HatenaEntryData count(int count) => this(count: count);

  @override
  HatenaEntryData url(String url) => this(url: url);

  @override
  HatenaEntryData entryUrl(String entryUrl) => this(entryUrl: entryUrl);

  @override
  HatenaEntryData screenshot(String screenshot) => this(screenshot: screenshot);

  @override
  HatenaEntryData eid(String eid) => this(eid: eid);

  @override
  HatenaEntryData bookmarks(List<HatenaBookmarkData?> bookmarks) =>
      this(bookmarks: bookmarks);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HatenaEntryData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HatenaEntryData(...).copyWith(id: 12, name: "My name")
  /// ````
  HatenaEntryData call({
    Object? title = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? entryUrl = const $CopyWithPlaceholder(),
    Object? screenshot = const $CopyWithPlaceholder(),
    Object? eid = const $CopyWithPlaceholder(),
    Object? bookmarks = const $CopyWithPlaceholder(),
  }) {
    return HatenaEntryData(
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      count: count == const $CopyWithPlaceholder() || count == null
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int,
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
      entryUrl: entryUrl == const $CopyWithPlaceholder() || entryUrl == null
          ? _value.entryUrl
          // ignore: cast_nullable_to_non_nullable
          : entryUrl as String,
      screenshot:
          screenshot == const $CopyWithPlaceholder() || screenshot == null
              ? _value.screenshot
              // ignore: cast_nullable_to_non_nullable
              : screenshot as String,
      eid: eid == const $CopyWithPlaceholder() || eid == null
          ? _value.eid
          // ignore: cast_nullable_to_non_nullable
          : eid as String,
      bookmarks: bookmarks == const $CopyWithPlaceholder() || bookmarks == null
          ? _value.bookmarks
          // ignore: cast_nullable_to_non_nullable
          : bookmarks as List<HatenaBookmarkData?>,
    );
  }
}

extension $HatenaEntryDataCopyWith on HatenaEntryData {
  /// Returns a callable class that can be used as follows: `instanceOfHatenaEntryData.copyWith(...)` or like so:`instanceOfHatenaEntryData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HatenaEntryDataCWProxy get copyWith => _$HatenaEntryDataCWProxyImpl(this);
}

abstract class _$HatenaBookmarkDataCWProxy {
  HatenaBookmarkData user(String user);

  HatenaBookmarkData tags(List<String?> tags);

  HatenaBookmarkData timestamp(String timestamp);

  HatenaBookmarkData comment(String comment);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HatenaBookmarkData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HatenaBookmarkData(...).copyWith(id: 12, name: "My name")
  /// ````
  HatenaBookmarkData call({
    String? user,
    List<String?>? tags,
    String? timestamp,
    String? comment,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHatenaBookmarkData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHatenaBookmarkData.copyWith.fieldName(...)`
class _$HatenaBookmarkDataCWProxyImpl implements _$HatenaBookmarkDataCWProxy {
  const _$HatenaBookmarkDataCWProxyImpl(this._value);

  final HatenaBookmarkData _value;

  @override
  HatenaBookmarkData user(String user) => this(user: user);

  @override
  HatenaBookmarkData tags(List<String?> tags) => this(tags: tags);

  @override
  HatenaBookmarkData timestamp(String timestamp) => this(timestamp: timestamp);

  @override
  HatenaBookmarkData comment(String comment) => this(comment: comment);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HatenaBookmarkData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HatenaBookmarkData(...).copyWith(id: 12, name: "My name")
  /// ````
  HatenaBookmarkData call({
    Object? user = const $CopyWithPlaceholder(),
    Object? tags = const $CopyWithPlaceholder(),
    Object? timestamp = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
  }) {
    return HatenaBookmarkData(
      user: user == const $CopyWithPlaceholder() || user == null
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as String,
      tags: tags == const $CopyWithPlaceholder() || tags == null
          ? _value.tags
          // ignore: cast_nullable_to_non_nullable
          : tags as List<String?>,
      timestamp: timestamp == const $CopyWithPlaceholder() || timestamp == null
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as String,
      comment: comment == const $CopyWithPlaceholder() || comment == null
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String,
    );
  }
}

extension $HatenaBookmarkDataCopyWith on HatenaBookmarkData {
  /// Returns a callable class that can be used as follows: `instanceOfHatenaBookmarkData.copyWith(...)` or like so:`instanceOfHatenaBookmarkData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HatenaBookmarkDataCWProxy get copyWith =>
      _$HatenaBookmarkDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HatenaEntryData _$HatenaEntryDataFromJson(Map<String, dynamic> json) =>
    HatenaEntryData(
      title: json['title'] as String,
      count: json['count'] as int,
      url: json['url'] as String,
      entryUrl: json['entry_url'] as String,
      screenshot: json['screenshot'] as String,
      eid: json['eid'] as String,
      bookmarks: (json['bookmarks'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : HatenaBookmarkData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

HatenaBookmarkData _$HatenaBookmarkDataFromJson(Map<String, dynamic> json) =>
    HatenaBookmarkData(
      user: json['user'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String?).toList() ??
              const [],
      timestamp: json['timestamp'] as String,
      comment: json['comment'] as String,
    );
