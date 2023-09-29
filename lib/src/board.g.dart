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

  BoardData machi(MachiBoardData? machi);

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
    MachiBoardData? machi,
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
  BoardData machi(MachiBoardData? machi) => this(machi: machi);

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
    Object? machi = const $CopyWithPlaceholder(),
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
      machi: machi == const $CopyWithPlaceholder()
          ? _value.machi
          // ignore: cast_nullable_to_non_nullable
          : machi as MachiBoardData?,
    );
  }
}

extension $BoardDataCopyWith on BoardData {
  /// Returns a callable class that can be used as follows: `instanceOfBoardData.copyWith(...)` or like so:`instanceOfBoardData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BoardDataCWProxy get copyWith => _$BoardDataCWProxyImpl(this);
}

abstract class _$PostDraftDataCWProxy {
  PostDraftData documentId(String documentId);

  PostDraftData forum(Communities forum);

  PostDraftData target(PostDraftTarget target);

  PostDraftData targetId(String targetId);

  PostDraftData body(String body);

  PostDraftData title(String title);

  PostDraftData name(String name);

  PostDraftData retentionPeriodSeconds(int? retentionPeriodSeconds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostDraftData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostDraftData(...).copyWith(id: 12, name: "My name")
  /// ````
  PostDraftData call({
    String? documentId,
    Communities? forum,
    PostDraftTarget? target,
    String? targetId,
    String? body,
    String? title,
    String? name,
    int? retentionPeriodSeconds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPostDraftData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPostDraftData.copyWith.fieldName(...)`
class _$PostDraftDataCWProxyImpl implements _$PostDraftDataCWProxy {
  const _$PostDraftDataCWProxyImpl(this._value);

  final PostDraftData _value;

  @override
  PostDraftData documentId(String documentId) => this(documentId: documentId);

  @override
  PostDraftData forum(Communities forum) => this(forum: forum);

  @override
  PostDraftData target(PostDraftTarget target) => this(target: target);

  @override
  PostDraftData targetId(String targetId) => this(targetId: targetId);

  @override
  PostDraftData body(String body) => this(body: body);

  @override
  PostDraftData title(String title) => this(title: title);

  @override
  PostDraftData name(String name) => this(name: name);

  @override
  PostDraftData retentionPeriodSeconds(int? retentionPeriodSeconds) =>
      this(retentionPeriodSeconds: retentionPeriodSeconds);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostDraftData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostDraftData(...).copyWith(id: 12, name: "My name")
  /// ````
  PostDraftData call({
    Object? documentId = const $CopyWithPlaceholder(),
    Object? forum = const $CopyWithPlaceholder(),
    Object? target = const $CopyWithPlaceholder(),
    Object? targetId = const $CopyWithPlaceholder(),
    Object? body = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? retentionPeriodSeconds = const $CopyWithPlaceholder(),
  }) {
    return PostDraftData(
      documentId:
          documentId == const $CopyWithPlaceholder() || documentId == null
              ? _value.documentId
              // ignore: cast_nullable_to_non_nullable
              : documentId as String,
      forum: forum == const $CopyWithPlaceholder() || forum == null
          ? _value.forum
          // ignore: cast_nullable_to_non_nullable
          : forum as Communities,
      target: target == const $CopyWithPlaceholder() || target == null
          ? _value.target
          // ignore: cast_nullable_to_non_nullable
          : target as PostDraftTarget,
      targetId: targetId == const $CopyWithPlaceholder() || targetId == null
          ? _value.targetId
          // ignore: cast_nullable_to_non_nullable
          : targetId as String,
      body: body == const $CopyWithPlaceholder() || body == null
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      retentionPeriodSeconds:
          retentionPeriodSeconds == const $CopyWithPlaceholder()
              ? _value.retentionPeriodSeconds
              // ignore: cast_nullable_to_non_nullable
              : retentionPeriodSeconds as int?,
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
      machi: json['machi'] == null
          ? null
          : MachiBoardData.fromJson(json['machi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BoardDataToJson(BoardData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'forum': _$CommunitiesEnumMap[instance.forum]!,
      'fiveChCategory': instance.fiveChCategory?.toJson(),
      'fiveCh': instance.fiveCh?.toJson(),
      'girlsCh': instance.girlsCh?.toJson(),
      'futabaCh': instance.futabaCh?.toJson(),
      'machi': instance.machi?.toJson(),
    };

const _$CommunitiesEnumMap = {
  Communities.fiveCh: 'fiveCh',
  Communities.girlsCh: 'girlsCh',
  Communities.futabaCh: 'futabaCh',
  Communities.pinkCh: 'pinkCh',
  Communities.machi: 'machi',
};

PostDraftData _$PostDraftDataFromJson(Map<String, dynamic> json) =>
    PostDraftData(
      documentId: json['documentId'] as String,
      forum: $enumDecode(_$CommunitiesEnumMap, json['forum']),
      target: $enumDecode(_$PostDraftTargetEnumMap, json['target']),
      targetId: json['targetId'] as String,
      body: json['body'] as String,
      title: json['title'] as String,
      name: json['name'] as String,
      retentionPeriodSeconds: json['retentionPeriodSeconds'] as int?,
    );

Map<String, dynamic> _$PostDraftDataToJson(PostDraftData instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'forum': _$CommunitiesEnumMap[instance.forum]!,
      'target': _$PostDraftTargetEnumMap[instance.target]!,
      'targetId': instance.targetId,
      'body': instance.body,
      'title': instance.title,
      'name': instance.name,
      'retentionPeriodSeconds': instance.retentionPeriodSeconds,
    };

const _$PostDraftTargetEnumMap = {
  PostDraftTarget.thread: 'thread',
  PostDraftTarget.comment: 'comment',
};
