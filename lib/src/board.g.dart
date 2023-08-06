// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BoardDataCWProxy {
  BoardData id(String id);

  BoardData name(String name);

  BoardData forum(Communities forum);

  BoardData fiveChCategory(FiveChCategoryData? fiveChCategory);

  BoardData fiveCh(FiveChBoardData? fiveCh);

  BoardData girlsCh(GirlsChCategory? girlsCh);

  BoardData futabaCh(FutabaChBoard? futabaCh);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BoardData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BoardData(...).copyWith(id: 12, name: "My name")
  /// ````
  BoardData call({
    String? id,
    String? name,
    Communities? forum,
    FiveChCategoryData? fiveChCategory,
    FiveChBoardData? fiveCh,
    GirlsChCategory? girlsCh,
    FutabaChBoard? futabaCh,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBoardData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBoardData.copyWith.fieldName(...)`
class _$BoardDataCWProxyImpl implements _$BoardDataCWProxy {
  const _$BoardDataCWProxyImpl(this._value);

  final BoardData _value;

  @override
  BoardData id(String id) => this(id: id);

  @override
  BoardData name(String name) => this(name: name);

  @override
  BoardData forum(Communities forum) => this(forum: forum);

  @override
  BoardData fiveChCategory(FiveChCategoryData? fiveChCategory) =>
      this(fiveChCategory: fiveChCategory);

  @override
  BoardData fiveCh(FiveChBoardData? fiveCh) => this(fiveCh: fiveCh);

  @override
  BoardData girlsCh(GirlsChCategory? girlsCh) => this(girlsCh: girlsCh);

  @override
  BoardData futabaCh(FutabaChBoard? futabaCh) => this(futabaCh: futabaCh);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BoardData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BoardData(...).copyWith(id: 12, name: "My name")
  /// ````
  BoardData call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? forum = const $CopyWithPlaceholder(),
    Object? fiveChCategory = const $CopyWithPlaceholder(),
    Object? fiveCh = const $CopyWithPlaceholder(),
    Object? girlsCh = const $CopyWithPlaceholder(),
    Object? futabaCh = const $CopyWithPlaceholder(),
  }) {
    return BoardData(
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
      fiveChCategory: fiveChCategory == const $CopyWithPlaceholder()
          ? _value.fiveChCategory
          // ignore: cast_nullable_to_non_nullable
          : fiveChCategory as FiveChCategoryData?,
      fiveCh: fiveCh == const $CopyWithPlaceholder()
          ? _value.fiveCh
          // ignore: cast_nullable_to_non_nullable
          : fiveCh as FiveChBoardData?,
      girlsCh: girlsCh == const $CopyWithPlaceholder()
          ? _value.girlsCh
          // ignore: cast_nullable_to_non_nullable
          : girlsCh as GirlsChCategory?,
      futabaCh: futabaCh == const $CopyWithPlaceholder()
          ? _value.futabaCh
          // ignore: cast_nullable_to_non_nullable
          : futabaCh as FutabaChBoard?,
    );
  }
}

extension $BoardDataCopyWith on BoardData {
  /// Returns a callable class that can be used as follows: `instanceOfBoardData.copyWith(...)` or like so:`instanceOfBoardData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BoardDataCWProxy get copyWith => _$BoardDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardData _$BoardDataFromJson(Map<String, dynamic> json) => BoardData(
      id: json['id'] as String,
      name: json['name'] as String,
      forum: $enumDecode(_$CommunitiesEnumMap, json['forum']),
      fiveChCategory: json['fiveChCategory'] == null
          ? null
          : FiveChCategoryData.fromJson(
              json['fiveChCategory'] as Map<String, dynamic>),
      fiveCh: json['fiveCh'] == null
          ? null
          : FiveChBoardData.fromJson(json['fiveCh'] as Map<String, dynamic>),
      girlsCh: json['girlsCh'] == null
          ? null
          : GirlsChCategory.fromJson(json['girlsCh'] as Map<String, dynamic>),
      futabaCh: json['futabaCh'] == null
          ? null
          : FutabaChBoard.fromJson(json['futabaCh'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BoardDataToJson(BoardData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'forum': _$CommunitiesEnumMap[instance.forum]!,
      'fiveChCategory': instance.fiveChCategory?.toJson(),
      'fiveCh': instance.fiveCh?.toJson(),
      'girlsCh': instance.girlsCh?.toJson(),
      'futabaCh': instance.futabaCh?.toJson(),
    };

const _$CommunitiesEnumMap = {
  Communities.fiveCh: 'fiveCh',
  Communities.girlsCh: 'girlsCh',
  Communities.futabaCh: 'futabaCh',
};
