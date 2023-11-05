// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mal.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MalPagingCWProxy {
  MalPaging next(String? next);

  MalPaging previous(String? previous);

  MalPaging last(String? last);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MalPaging(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MalPaging(...).copyWith(id: 12, name: "My name")
  /// ````
  MalPaging call({
    String? next,
    String? previous,
    String? last,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMalPaging.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMalPaging.copyWith.fieldName(...)`
class _$MalPagingCWProxyImpl implements _$MalPagingCWProxy {
  const _$MalPagingCWProxyImpl(this._value);

  final MalPaging _value;

  @override
  MalPaging next(String? next) => this(next: next);

  @override
  MalPaging previous(String? previous) => this(previous: previous);

  @override
  MalPaging last(String? last) => this(last: last);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MalPaging(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MalPaging(...).copyWith(id: 12, name: "My name")
  /// ````
  MalPaging call({
    Object? next = const $CopyWithPlaceholder(),
    Object? previous = const $CopyWithPlaceholder(),
    Object? last = const $CopyWithPlaceholder(),
  }) {
    return MalPaging(
      next: next == const $CopyWithPlaceholder()
          ? _value.next
          // ignore: cast_nullable_to_non_nullable
          : next as String?,
      previous: previous == const $CopyWithPlaceholder()
          ? _value.previous
          // ignore: cast_nullable_to_non_nullable
          : previous as String?,
      last: last == const $CopyWithPlaceholder()
          ? _value.last
          // ignore: cast_nullable_to_non_nullable
          : last as String?,
    );
  }
}

extension $MalPagingCopyWith on MalPaging {
  /// Returns a callable class that can be used as follows: `instanceOfMalPaging.copyWith(...)` or like so:`instanceOfMalPaging.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MalPagingCWProxy get copyWith => _$MalPagingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MalBoardsBaseJson _$MalBoardsBaseJsonFromJson(Map<String, dynamic> json) =>
    MalBoardsBaseJson(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => MalCategoryJson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

MalCategoryJson _$MalCategoryJsonFromJson(Map<String, dynamic> json) =>
    MalCategoryJson(
      title: json['title'] as String,
      boards: (json['boards'] as List<dynamic>)
          .map((e) => MalBoardJson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

MalBoardJson _$MalBoardJsonFromJson(Map<String, dynamic> json) => MalBoardJson(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      subboards: (json['subboards'] as List<dynamic>)
          .map((e) => MalSubBoardJson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

MalSubBoardJson _$MalSubBoardJsonFromJson(Map<String, dynamic> json) =>
    MalSubBoardJson(
      id: json['id'] as int,
      title: json['title'] as String,
    );

MalThreadsBaseJson _$MalThreadsBaseJsonFromJson(Map<String, dynamic> json) =>
    MalThreadsBaseJson(
      data: (json['data'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : MalThreadJson.fromJson(e as Map<String, dynamic>))
          .toList(),
      paging: MalPaging.fromJson(json['paging'] as Map<String, dynamic>),
    );

MalThreadJson _$MalThreadJsonFromJson(Map<String, dynamic> json) =>
    MalThreadJson(
      id: json['id'] as int,
      numberOfPosts: json['number_of_posts'] as int,
      title: json['title'] as String,
      createdAt: json['created_at'] as String,
      lastPostCreatedAt: json['last_post_created_at'] as String,
      isLocked: json['is_locked'] as bool? ?? false,
      createdBy:
          MalUserJson.fromJson(json['created_by'] as Map<String, dynamic>),
    );

MalPaging _$MalPagingFromJson(Map<String, dynamic> json) => MalPaging(
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      last: json['last'] as String?,
    );

MalUserJson _$MalUserJsonFromJson(Map<String, dynamic> json) => MalUserJson(
      id: json['id'] as int,
      name: json['name'] as String,
      modsTitle: json['mods_title'] as String?,
      forumTitle: json['forum_title'] as String?,
      forumAvator: json['forum_avator'] as String?,
    );

MalContentDataJson _$MalContentDataJsonFromJson(Map<String, dynamic> json) =>
    MalContentDataJson(
      data: MalContentBaseJson.fromJson(json['data'] as Map<String, dynamic>),
      paging: MalPaging.fromJson(json['paging'] as Map<String, dynamic>),
    );

MalContentBaseJson _$MalContentBaseJsonFromJson(Map<String, dynamic> json) =>
    MalContentBaseJson(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : MalContentJson.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      poll: json['poll'] == null
          ? null
          : MalPollBaseJson.fromJson(json['poll'] as Map<String, dynamic>),
    );

MalPollBaseJson _$MalPollBaseJsonFromJson(Map<String, dynamic> json) =>
    MalPollBaseJson(
      id: json['id'] as int,
      question: json['question'] as String,
      closed: json['closed'] as bool,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : MalPollItemJson.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

MalPollItemJson _$MalPollItemJsonFromJson(Map<String, dynamic> json) =>
    MalPollItemJson(
      id: json['id'] as int,
      text: json['text'] as String,
      votes: json['votes'] as int,
    );

MalContentJson _$MalContentJsonFromJson(Map<String, dynamic> json) =>
    MalContentJson(
      id: json['id'] as int,
      number: json['number'] as int,
      body: json['body'] as String,
      createdAt: json['created_at'] as String,
      signature: json['signature'] as String,
      createdBy:
          MalUserJson.fromJson(json['created_by'] as Map<String, dynamic>),
    );
