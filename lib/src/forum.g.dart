// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SrcDataCWProxy {
  SrcData thumbnailUri(String? thumbnailUri);

  SrcData srcUri(String? srcUri);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SrcData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SrcData(...).copyWith(id: 12, name: "My name")
  /// ````
  SrcData call({
    String? thumbnailUri,
    String? srcUri,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSrcData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSrcData.copyWith.fieldName(...)`
class _$SrcDataCWProxyImpl implements _$SrcDataCWProxy {
  const _$SrcDataCWProxyImpl(this._value);

  final SrcData _value;

  @override
  SrcData thumbnailUri(String? thumbnailUri) =>
      this(thumbnailUri: thumbnailUri);

  @override
  SrcData srcUri(String? srcUri) => this(srcUri: srcUri);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SrcData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SrcData(...).copyWith(id: 12, name: "My name")
  /// ````
  SrcData call({
    Object? thumbnailUri = const $CopyWithPlaceholder(),
    Object? srcUri = const $CopyWithPlaceholder(),
  }) {
    return SrcData(
      thumbnailUri: thumbnailUri == const $CopyWithPlaceholder()
          ? _value.thumbnailUri
          // ignore: cast_nullable_to_non_nullable
          : thumbnailUri as String?,
      srcUri: srcUri == const $CopyWithPlaceholder()
          ? _value.srcUri
          // ignore: cast_nullable_to_non_nullable
          : srcUri as String?,
    );
  }
}

extension $SrcDataCopyWith on SrcData {
  /// Returns a callable class that can be used as follows: `instanceOfSrcData.copyWith(...)` or like so:`instanceOfSrcData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SrcDataCWProxy get copyWith => _$SrcDataCWProxyImpl(this);
}

abstract class _$SrcDataForStorageCWProxy {
  SrcDataForStorage data(List<int>? data);

  SrcDataForStorage id(String id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SrcDataForStorage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SrcDataForStorage(...).copyWith(id: 12, name: "My name")
  /// ````
  SrcDataForStorage call({
    List<int>? data,
    String? id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSrcDataForStorage.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSrcDataForStorage.copyWith.fieldName(...)`
class _$SrcDataForStorageCWProxyImpl implements _$SrcDataForStorageCWProxy {
  const _$SrcDataForStorageCWProxyImpl(this._value);

  final SrcDataForStorage _value;

  @override
  SrcDataForStorage data(List<int>? data) => this(data: data);

  @override
  SrcDataForStorage id(String id) => this(id: id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SrcDataForStorage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SrcDataForStorage(...).copyWith(id: 12, name: "My name")
  /// ````
  SrcDataForStorage call({
    Object? data = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return SrcDataForStorage(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<int>?,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
    );
  }
}

extension $SrcDataForStorageCopyWith on SrcDataForStorage {
  /// Returns a callable class that can be used as follows: `instanceOfSrcDataForStorage.copyWith(...)` or like so:`instanceOfSrcDataForStorage.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SrcDataForStorageCWProxy get copyWith =>
      _$SrcDataForStorageCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SrcData _$SrcDataFromJson(Map<String, dynamic> json) => SrcData(
      thumbnailUri: json['thumbnailUri'] as String?,
      srcUri: json['srcUri'] as String?,
    );

Map<String, dynamic> _$SrcDataToJson(SrcData instance) => <String, dynamic>{
      'thumbnailUri': instance.thumbnailUri,
      'srcUri': instance.srcUri,
    };

SrcDataForStorage _$SrcDataForStorageFromJson(Map<String, dynamic> json) =>
    SrcDataForStorage(
      data: (json['data'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'] as String,
    );

Map<String, dynamic> _$SrcDataForStorageToJson(SrcDataForStorage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
    };
