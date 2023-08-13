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

  ThreadData thumbnail(SrcData? thumbnail);

  ThreadData url(String url);

  ThreadData updateAtStr(String? updateAtStr);

  ThreadData boardId(String boardId);

  ThreadData boardName(String? boardName);

  ThreadData positionToGet(PositionToGet positionToGet);

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
    SrcData? thumbnail,
    String? url,
    String? updateAtStr,
    String? boardId,
    String? boardName,
    PositionToGet? positionToGet,
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
  ThreadData thumbnail(SrcData? thumbnail) => this(thumbnail: thumbnail);

  @override
  ThreadData url(String url) => this(url: url);

  @override
  ThreadData updateAtStr(String? updateAtStr) => this(updateAtStr: updateAtStr);

  @override
  ThreadData boardId(String boardId) => this(boardId: boardId);

  @override
  ThreadData boardName(String? boardName) => this(boardName: boardName);

  @override
  ThreadData positionToGet(PositionToGet positionToGet) =>
      this(positionToGet: positionToGet);

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
    Object? thumbnail = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? updateAtStr = const $CopyWithPlaceholder(),
    Object? boardId = const $CopyWithPlaceholder(),
    Object? boardName = const $CopyWithPlaceholder(),
    Object? positionToGet = const $CopyWithPlaceholder(),
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
      thumbnail: thumbnail == const $CopyWithPlaceholder()
          ? _value.thumbnail
          // ignore: cast_nullable_to_non_nullable
          : thumbnail as SrcData?,
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
      positionToGet:
          positionToGet == const $CopyWithPlaceholder() || positionToGet == null
              ? _value.positionToGet
              // ignore: cast_nullable_to_non_nullable
              : positionToGet as PositionToGet,
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
