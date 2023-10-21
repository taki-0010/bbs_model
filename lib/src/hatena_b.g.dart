// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hatena_b.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HatenaEntryDataCWProxy {
  HatenaEntryData title(String title);

  HatenaEntryData count(String count);

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
    String? count,
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
  HatenaEntryData count(String count) => this(count: count);

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
          : count as String,
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
  HatenaBookmarkData user(String? user);

  HatenaBookmarkData tags(dynamic tags);

  HatenaBookmarkData timestamp(dynamic timestamp);

  HatenaBookmarkData comment(String? comment);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HatenaBookmarkData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HatenaBookmarkData(...).copyWith(id: 12, name: "My name")
  /// ````
  HatenaBookmarkData call({
    String? user,
    dynamic tags,
    dynamic timestamp,
    String? comment,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHatenaBookmarkData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHatenaBookmarkData.copyWith.fieldName(...)`
class _$HatenaBookmarkDataCWProxyImpl implements _$HatenaBookmarkDataCWProxy {
  const _$HatenaBookmarkDataCWProxyImpl(this._value);

  final HatenaBookmarkData _value;

  @override
  HatenaBookmarkData user(String? user) => this(user: user);

  @override
  HatenaBookmarkData tags(dynamic tags) => this(tags: tags);

  @override
  HatenaBookmarkData timestamp(dynamic timestamp) => this(timestamp: timestamp);

  @override
  HatenaBookmarkData comment(String? comment) => this(comment: comment);

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
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as String?,
      tags: tags == const $CopyWithPlaceholder() || tags == null
          ? _value.tags
          // ignore: cast_nullable_to_non_nullable
          : tags as dynamic,
      timestamp: timestamp == const $CopyWithPlaceholder() || timestamp == null
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as dynamic,
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
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
      count: json['count'] as String,
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
      user: json['user'] as String?,
      tags: json['tags'],
      timestamp: json['timestamp'],
      comment: json['comment'] as String?,
    );
