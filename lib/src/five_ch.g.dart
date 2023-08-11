// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'five_ch.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FiveChBoardMetaDataCWProxy {
  FiveChBoardMetaData lastModifyString(String lastModifyString);

  FiveChBoardMetaData description(String description);

  FiveChBoardMetaData lastModify(int lastModify);

  FiveChBoardMetaData menuList(List<FiveChBoardCategoryJsonData> menuList);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiveChBoardMetaData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiveChBoardMetaData(...).copyWith(id: 12, name: "My name")
  /// ````
  FiveChBoardMetaData call({
    String? lastModifyString,
    String? description,
    int? lastModify,
    List<FiveChBoardCategoryJsonData>? menuList,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFiveChBoardMetaData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFiveChBoardMetaData.copyWith.fieldName(...)`
class _$FiveChBoardMetaDataCWProxyImpl implements _$FiveChBoardMetaDataCWProxy {
  const _$FiveChBoardMetaDataCWProxyImpl(this._value);

  final FiveChBoardMetaData _value;

  @override
  FiveChBoardMetaData lastModifyString(String lastModifyString) =>
      this(lastModifyString: lastModifyString);

  @override
  FiveChBoardMetaData description(String description) =>
      this(description: description);

  @override
  FiveChBoardMetaData lastModify(int lastModify) =>
      this(lastModify: lastModify);

  @override
  FiveChBoardMetaData menuList(List<FiveChBoardCategoryJsonData> menuList) =>
      this(menuList: menuList);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiveChBoardMetaData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiveChBoardMetaData(...).copyWith(id: 12, name: "My name")
  /// ````
  FiveChBoardMetaData call({
    Object? lastModifyString = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? lastModify = const $CopyWithPlaceholder(),
    Object? menuList = const $CopyWithPlaceholder(),
  }) {
    return FiveChBoardMetaData(
      lastModifyString: lastModifyString == const $CopyWithPlaceholder() ||
              lastModifyString == null
          ? _value.lastModifyString
          // ignore: cast_nullable_to_non_nullable
          : lastModifyString as String,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      lastModify:
          lastModify == const $CopyWithPlaceholder() || lastModify == null
              ? _value.lastModify
              // ignore: cast_nullable_to_non_nullable
              : lastModify as int,
      menuList: menuList == const $CopyWithPlaceholder() || menuList == null
          ? _value.menuList
          // ignore: cast_nullable_to_non_nullable
          : menuList as List<FiveChBoardCategoryJsonData>,
    );
  }
}

extension $FiveChBoardMetaDataCopyWith on FiveChBoardMetaData {
  /// Returns a callable class that can be used as follows: `instanceOfFiveChBoardMetaData.copyWith(...)` or like so:`instanceOfFiveChBoardMetaData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FiveChBoardMetaDataCWProxy get copyWith =>
      _$FiveChBoardMetaDataCWProxyImpl(this);
}

abstract class _$FiveChBoardCategoryJsonDataCWProxy {
  FiveChBoardCategoryJsonData categoryNumber(String categoryNumber);

  FiveChBoardCategoryJsonData categoryName(String categoryName);

  FiveChBoardCategoryJsonData categoryContent(
      List<FiveChBoardJsonData> categoryContent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiveChBoardCategoryJsonData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiveChBoardCategoryJsonData(...).copyWith(id: 12, name: "My name")
  /// ````
  FiveChBoardCategoryJsonData call({
    String? categoryNumber,
    String? categoryName,
    List<FiveChBoardJsonData>? categoryContent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFiveChBoardCategoryJsonData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFiveChBoardCategoryJsonData.copyWith.fieldName(...)`
class _$FiveChBoardCategoryJsonDataCWProxyImpl
    implements _$FiveChBoardCategoryJsonDataCWProxy {
  const _$FiveChBoardCategoryJsonDataCWProxyImpl(this._value);

  final FiveChBoardCategoryJsonData _value;

  @override
  FiveChBoardCategoryJsonData categoryNumber(String categoryNumber) =>
      this(categoryNumber: categoryNumber);

  @override
  FiveChBoardCategoryJsonData categoryName(String categoryName) =>
      this(categoryName: categoryName);

  @override
  FiveChBoardCategoryJsonData categoryContent(
          List<FiveChBoardJsonData> categoryContent) =>
      this(categoryContent: categoryContent);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiveChBoardCategoryJsonData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiveChBoardCategoryJsonData(...).copyWith(id: 12, name: "My name")
  /// ````
  FiveChBoardCategoryJsonData call({
    Object? categoryNumber = const $CopyWithPlaceholder(),
    Object? categoryName = const $CopyWithPlaceholder(),
    Object? categoryContent = const $CopyWithPlaceholder(),
  }) {
    return FiveChBoardCategoryJsonData(
      categoryNumber: categoryNumber == const $CopyWithPlaceholder() ||
              categoryNumber == null
          ? _value.categoryNumber
          // ignore: cast_nullable_to_non_nullable
          : categoryNumber as String,
      categoryName:
          categoryName == const $CopyWithPlaceholder() || categoryName == null
              ? _value.categoryName
              // ignore: cast_nullable_to_non_nullable
              : categoryName as String,
      categoryContent: categoryContent == const $CopyWithPlaceholder() ||
              categoryContent == null
          ? _value.categoryContent
          // ignore: cast_nullable_to_non_nullable
          : categoryContent as List<FiveChBoardJsonData>,
    );
  }
}

extension $FiveChBoardCategoryJsonDataCopyWith on FiveChBoardCategoryJsonData {
  /// Returns a callable class that can be used as follows: `instanceOfFiveChBoardCategoryJsonData.copyWith(...)` or like so:`instanceOfFiveChBoardCategoryJsonData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FiveChBoardCategoryJsonDataCWProxy get copyWith =>
      _$FiveChBoardCategoryJsonDataCWProxyImpl(this);
}

abstract class _$FiveChBoardJsonDataCWProxy {
  FiveChBoardJsonData categoryOrder(int categoryOrder);

  FiveChBoardJsonData directoryName(String directoryName);

  FiveChBoardJsonData url(String url);

  FiveChBoardJsonData category(int category);

  FiveChBoardJsonData categoryName(String categoryName);

  FiveChBoardJsonData boardName(String boardName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiveChBoardJsonData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiveChBoardJsonData(...).copyWith(id: 12, name: "My name")
  /// ````
  FiveChBoardJsonData call({
    int? categoryOrder,
    String? directoryName,
    String? url,
    int? category,
    String? categoryName,
    String? boardName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFiveChBoardJsonData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFiveChBoardJsonData.copyWith.fieldName(...)`
class _$FiveChBoardJsonDataCWProxyImpl implements _$FiveChBoardJsonDataCWProxy {
  const _$FiveChBoardJsonDataCWProxyImpl(this._value);

  final FiveChBoardJsonData _value;

  @override
  FiveChBoardJsonData categoryOrder(int categoryOrder) =>
      this(categoryOrder: categoryOrder);

  @override
  FiveChBoardJsonData directoryName(String directoryName) =>
      this(directoryName: directoryName);

  @override
  FiveChBoardJsonData url(String url) => this(url: url);

  @override
  FiveChBoardJsonData category(int category) => this(category: category);

  @override
  FiveChBoardJsonData categoryName(String categoryName) =>
      this(categoryName: categoryName);

  @override
  FiveChBoardJsonData boardName(String boardName) => this(boardName: boardName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiveChBoardJsonData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiveChBoardJsonData(...).copyWith(id: 12, name: "My name")
  /// ````
  FiveChBoardJsonData call({
    Object? categoryOrder = const $CopyWithPlaceholder(),
    Object? directoryName = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
    Object? categoryName = const $CopyWithPlaceholder(),
    Object? boardName = const $CopyWithPlaceholder(),
  }) {
    return FiveChBoardJsonData(
      categoryOrder:
          categoryOrder == const $CopyWithPlaceholder() || categoryOrder == null
              ? _value.categoryOrder
              // ignore: cast_nullable_to_non_nullable
              : categoryOrder as int,
      directoryName:
          directoryName == const $CopyWithPlaceholder() || directoryName == null
              ? _value.directoryName
              // ignore: cast_nullable_to_non_nullable
              : directoryName as String,
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
      category: category == const $CopyWithPlaceholder() || category == null
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as int,
      categoryName:
          categoryName == const $CopyWithPlaceholder() || categoryName == null
              ? _value.categoryName
              // ignore: cast_nullable_to_non_nullable
              : categoryName as String,
      boardName: boardName == const $CopyWithPlaceholder() || boardName == null
          ? _value.boardName
          // ignore: cast_nullable_to_non_nullable
          : boardName as String,
    );
  }
}

extension $FiveChBoardJsonDataCopyWith on FiveChBoardJsonData {
  /// Returns a callable class that can be used as follows: `instanceOfFiveChBoardJsonData.copyWith(...)` or like so:`instanceOfFiveChBoardJsonData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FiveChBoardJsonDataCWProxy get copyWith =>
      _$FiveChBoardJsonDataCWProxyImpl(this);
}

abstract class _$FiveChCategoryDataCWProxy {
  FiveChCategoryData categoryNumber(String categoryNumber);

  FiveChCategoryData categoryContent(List<BoardData> categoryContent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiveChCategoryData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiveChCategoryData(...).copyWith(id: 12, name: "My name")
  /// ````
  FiveChCategoryData call({
    String? categoryNumber,
    List<BoardData>? categoryContent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFiveChCategoryData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFiveChCategoryData.copyWith.fieldName(...)`
class _$FiveChCategoryDataCWProxyImpl implements _$FiveChCategoryDataCWProxy {
  const _$FiveChCategoryDataCWProxyImpl(this._value);

  final FiveChCategoryData _value;

  @override
  FiveChCategoryData categoryNumber(String categoryNumber) =>
      this(categoryNumber: categoryNumber);

  @override
  FiveChCategoryData categoryContent(List<BoardData> categoryContent) =>
      this(categoryContent: categoryContent);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiveChCategoryData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiveChCategoryData(...).copyWith(id: 12, name: "My name")
  /// ````
  FiveChCategoryData call({
    Object? categoryNumber = const $CopyWithPlaceholder(),
    Object? categoryContent = const $CopyWithPlaceholder(),
  }) {
    return FiveChCategoryData(
      categoryNumber: categoryNumber == const $CopyWithPlaceholder() ||
              categoryNumber == null
          ? _value.categoryNumber
          // ignore: cast_nullable_to_non_nullable
          : categoryNumber as String,
      categoryContent: categoryContent == const $CopyWithPlaceholder() ||
              categoryContent == null
          ? _value.categoryContent
          // ignore: cast_nullable_to_non_nullable
          : categoryContent as List<BoardData>,
    );
  }
}

extension $FiveChCategoryDataCopyWith on FiveChCategoryData {
  /// Returns a callable class that can be used as follows: `instanceOfFiveChCategoryData.copyWith(...)` or like so:`instanceOfFiveChCategoryData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FiveChCategoryDataCWProxy get copyWith =>
      _$FiveChCategoryDataCWProxyImpl(this);
}

abstract class _$FiveChBoardDataCWProxy {
  FiveChBoardData url(String url);

  FiveChBoardData category(int category);

  FiveChBoardData categoryOrder(int categoryOrder);

  FiveChBoardData categoryName(String categoryName);

  FiveChBoardData directoryName(String directoryName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiveChBoardData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiveChBoardData(...).copyWith(id: 12, name: "My name")
  /// ````
  FiveChBoardData call({
    String? url,
    int? category,
    int? categoryOrder,
    String? categoryName,
    String? directoryName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFiveChBoardData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFiveChBoardData.copyWith.fieldName(...)`
class _$FiveChBoardDataCWProxyImpl implements _$FiveChBoardDataCWProxy {
  const _$FiveChBoardDataCWProxyImpl(this._value);

  final FiveChBoardData _value;

  @override
  FiveChBoardData url(String url) => this(url: url);

  @override
  FiveChBoardData category(int category) => this(category: category);

  @override
  FiveChBoardData categoryOrder(int categoryOrder) =>
      this(categoryOrder: categoryOrder);

  @override
  FiveChBoardData categoryName(String categoryName) =>
      this(categoryName: categoryName);

  @override
  FiveChBoardData directoryName(String directoryName) =>
      this(directoryName: directoryName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiveChBoardData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiveChBoardData(...).copyWith(id: 12, name: "My name")
  /// ````
  FiveChBoardData call({
    Object? url = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
    Object? categoryOrder = const $CopyWithPlaceholder(),
    Object? categoryName = const $CopyWithPlaceholder(),
    Object? directoryName = const $CopyWithPlaceholder(),
  }) {
    return FiveChBoardData(
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
      category: category == const $CopyWithPlaceholder() || category == null
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as int,
      categoryOrder:
          categoryOrder == const $CopyWithPlaceholder() || categoryOrder == null
              ? _value.categoryOrder
              // ignore: cast_nullable_to_non_nullable
              : categoryOrder as int,
      categoryName:
          categoryName == const $CopyWithPlaceholder() || categoryName == null
              ? _value.categoryName
              // ignore: cast_nullable_to_non_nullable
              : categoryName as String,
      directoryName:
          directoryName == const $CopyWithPlaceholder() || directoryName == null
              ? _value.directoryName
              // ignore: cast_nullable_to_non_nullable
              : directoryName as String,
    );
  }
}

extension $FiveChBoardDataCopyWith on FiveChBoardData {
  /// Returns a callable class that can be used as follows: `instanceOfFiveChBoardData.copyWith(...)` or like so:`instanceOfFiveChBoardData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FiveChBoardDataCWProxy get copyWith => _$FiveChBoardDataCWProxyImpl(this);
}

abstract class _$FiveChThreadTitleDataCWProxy {
  FiveChThreadTitleData id(String id);

  FiveChThreadTitleData title(String title);

  FiveChThreadTitleData resCount(int resCount);

  FiveChThreadTitleData filesize(int filesize);

  FiveChThreadTitleData permission(String permission);

  FiveChThreadTitleData lastmodifyNum(int lastmodifyNum);

  FiveChThreadTitleData domain(String domain);

  FiveChThreadTitleData boardId(String boardId);

  FiveChThreadTitleData difference(int? difference);

  FiveChThreadTitleData boardName(String? boardName);

  FiveChThreadTitleData isNewPost(bool isNewPost);

  FiveChThreadTitleData updateAtStr(String? updateAtStr);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiveChThreadTitleData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiveChThreadTitleData(...).copyWith(id: 12, name: "My name")
  /// ````
  FiveChThreadTitleData call({
    String? id,
    String? title,
    int? resCount,
    int? filesize,
    String? permission,
    int? lastmodifyNum,
    String? domain,
    String? boardId,
    int? difference,
    String? boardName,
    bool? isNewPost,
    String? updateAtStr,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFiveChThreadTitleData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFiveChThreadTitleData.copyWith.fieldName(...)`
class _$FiveChThreadTitleDataCWProxyImpl
    implements _$FiveChThreadTitleDataCWProxy {
  const _$FiveChThreadTitleDataCWProxyImpl(this._value);

  final FiveChThreadTitleData _value;

  @override
  FiveChThreadTitleData id(String id) => this(id: id);

  @override
  FiveChThreadTitleData title(String title) => this(title: title);

  @override
  FiveChThreadTitleData resCount(int resCount) => this(resCount: resCount);

  @override
  FiveChThreadTitleData filesize(int filesize) => this(filesize: filesize);

  @override
  FiveChThreadTitleData permission(String permission) =>
      this(permission: permission);

  @override
  FiveChThreadTitleData lastmodifyNum(int lastmodifyNum) =>
      this(lastmodifyNum: lastmodifyNum);

  @override
  FiveChThreadTitleData domain(String domain) => this(domain: domain);

  @override
  FiveChThreadTitleData boardId(String boardId) => this(boardId: boardId);

  @override
  FiveChThreadTitleData difference(int? difference) =>
      this(difference: difference);

  @override
  FiveChThreadTitleData boardName(String? boardName) =>
      this(boardName: boardName);

  @override
  FiveChThreadTitleData isNewPost(bool isNewPost) => this(isNewPost: isNewPost);

  @override
  FiveChThreadTitleData updateAtStr(String? updateAtStr) =>
      this(updateAtStr: updateAtStr);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiveChThreadTitleData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiveChThreadTitleData(...).copyWith(id: 12, name: "My name")
  /// ````
  FiveChThreadTitleData call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? resCount = const $CopyWithPlaceholder(),
    Object? filesize = const $CopyWithPlaceholder(),
    Object? permission = const $CopyWithPlaceholder(),
    Object? lastmodifyNum = const $CopyWithPlaceholder(),
    Object? domain = const $CopyWithPlaceholder(),
    Object? boardId = const $CopyWithPlaceholder(),
    Object? difference = const $CopyWithPlaceholder(),
    Object? boardName = const $CopyWithPlaceholder(),
    Object? isNewPost = const $CopyWithPlaceholder(),
    Object? updateAtStr = const $CopyWithPlaceholder(),
  }) {
    return FiveChThreadTitleData(
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
      filesize: filesize == const $CopyWithPlaceholder() || filesize == null
          ? _value.filesize
          // ignore: cast_nullable_to_non_nullable
          : filesize as int,
      permission:
          permission == const $CopyWithPlaceholder() || permission == null
              ? _value.permission
              // ignore: cast_nullable_to_non_nullable
              : permission as String,
      lastmodifyNum:
          lastmodifyNum == const $CopyWithPlaceholder() || lastmodifyNum == null
              ? _value.lastmodifyNum
              // ignore: cast_nullable_to_non_nullable
              : lastmodifyNum as int,
      domain: domain == const $CopyWithPlaceholder() || domain == null
          ? _value.domain
          // ignore: cast_nullable_to_non_nullable
          : domain as String,
      boardId: boardId == const $CopyWithPlaceholder() || boardId == null
          ? _value.boardId
          // ignore: cast_nullable_to_non_nullable
          : boardId as String,
      difference: difference == const $CopyWithPlaceholder()
          ? _value.difference
          // ignore: cast_nullable_to_non_nullable
          : difference as int?,
      boardName: boardName == const $CopyWithPlaceholder()
          ? _value.boardName
          // ignore: cast_nullable_to_non_nullable
          : boardName as String?,
      isNewPost: isNewPost == const $CopyWithPlaceholder() || isNewPost == null
          ? _value.isNewPost
          // ignore: cast_nullable_to_non_nullable
          : isNewPost as bool,
      updateAtStr: updateAtStr == const $CopyWithPlaceholder()
          ? _value.updateAtStr
          // ignore: cast_nullable_to_non_nullable
          : updateAtStr as String?,
    );
  }
}

extension $FiveChThreadTitleDataCopyWith on FiveChThreadTitleData {
  /// Returns a callable class that can be used as follows: `instanceOfFiveChThreadTitleData.copyWith(...)` or like so:`instanceOfFiveChThreadTitleData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FiveChThreadTitleDataCWProxy get copyWith =>
      _$FiveChThreadTitleDataCWProxyImpl(this);
}

abstract class _$FiveChThreadContentDataCWProxy {
  FiveChThreadContentData index(int index);

  FiveChThreadContentData name(String name);

  FiveChThreadContentData email(String? email);

  FiveChThreadContentData dateAndId(String dateAndId);

  FiveChThreadContentData body(String body);

  FiveChThreadContentData title(String? title);

  FiveChThreadContentData urlSet(List<String?>? urlSet);

  FiveChThreadContentData domain(String domain);

  FiveChThreadContentData directoryName(String directoryName);

  FiveChThreadContentData userId(String? userId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiveChThreadContentData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiveChThreadContentData(...).copyWith(id: 12, name: "My name")
  /// ````
  FiveChThreadContentData call({
    int? index,
    String? name,
    String? email,
    String? dateAndId,
    String? body,
    String? title,
    List<String?>? urlSet,
    String? domain,
    String? directoryName,
    String? userId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFiveChThreadContentData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFiveChThreadContentData.copyWith.fieldName(...)`
class _$FiveChThreadContentDataCWProxyImpl
    implements _$FiveChThreadContentDataCWProxy {
  const _$FiveChThreadContentDataCWProxyImpl(this._value);

  final FiveChThreadContentData _value;

  @override
  FiveChThreadContentData index(int index) => this(index: index);

  @override
  FiveChThreadContentData name(String name) => this(name: name);

  @override
  FiveChThreadContentData email(String? email) => this(email: email);

  @override
  FiveChThreadContentData dateAndId(String dateAndId) =>
      this(dateAndId: dateAndId);

  @override
  FiveChThreadContentData body(String body) => this(body: body);

  @override
  FiveChThreadContentData title(String? title) => this(title: title);

  @override
  FiveChThreadContentData urlSet(List<String?>? urlSet) => this(urlSet: urlSet);

  @override
  FiveChThreadContentData domain(String domain) => this(domain: domain);

  @override
  FiveChThreadContentData directoryName(String directoryName) =>
      this(directoryName: directoryName);

  @override
  FiveChThreadContentData userId(String? userId) => this(userId: userId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FiveChThreadContentData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FiveChThreadContentData(...).copyWith(id: 12, name: "My name")
  /// ````
  FiveChThreadContentData call({
    Object? index = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? dateAndId = const $CopyWithPlaceholder(),
    Object? body = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? urlSet = const $CopyWithPlaceholder(),
    Object? domain = const $CopyWithPlaceholder(),
    Object? directoryName = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
  }) {
    return FiveChThreadContentData(
      index: index == const $CopyWithPlaceholder() || index == null
          ? _value.index
          // ignore: cast_nullable_to_non_nullable
          : index as int,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      dateAndId: dateAndId == const $CopyWithPlaceholder() || dateAndId == null
          ? _value.dateAndId
          // ignore: cast_nullable_to_non_nullable
          : dateAndId as String,
      body: body == const $CopyWithPlaceholder() || body == null
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      urlSet: urlSet == const $CopyWithPlaceholder()
          ? _value.urlSet
          // ignore: cast_nullable_to_non_nullable
          : urlSet as List<String?>?,
      domain: domain == const $CopyWithPlaceholder() || domain == null
          ? _value.domain
          // ignore: cast_nullable_to_non_nullable
          : domain as String,
      directoryName:
          directoryName == const $CopyWithPlaceholder() || directoryName == null
              ? _value.directoryName
              // ignore: cast_nullable_to_non_nullable
              : directoryName as String,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
    );
  }
}

extension $FiveChThreadContentDataCopyWith on FiveChThreadContentData {
  /// Returns a callable class that can be used as follows: `instanceOfFiveChThreadContentData.copyWith(...)` or like so:`instanceOfFiveChThreadContentData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FiveChThreadContentDataCWProxy get copyWith =>
      _$FiveChThreadContentDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiveChBoardMetaData _$FiveChBoardMetaDataFromJson(Map<String, dynamic> json) =>
    FiveChBoardMetaData(
      lastModifyString: json['last_modify_string'] as String,
      description: json['description'] as String,
      lastModify: json['last_modify'] as int,
      menuList: (json['menu_list'] as List<dynamic>)
          .map((e) =>
              FiveChBoardCategoryJsonData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

FiveChBoardCategoryJsonData _$FiveChBoardCategoryJsonDataFromJson(
        Map<String, dynamic> json) =>
    FiveChBoardCategoryJsonData(
      categoryNumber: json['category_number'] as String,
      categoryName: json['category_name'] as String,
      categoryContent: (json['category_content'] as List<dynamic>)
          .map((e) => FiveChBoardJsonData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

FiveChBoardJsonData _$FiveChBoardJsonDataFromJson(Map<String, dynamic> json) =>
    FiveChBoardJsonData(
      categoryOrder: json['category_order'] as int,
      directoryName: json['directory_name'] as String,
      url: json['url'] as String,
      category: json['category'] as int,
      categoryName: json['category_name'] as String,
      boardName: json['board_name'] as String,
    );

FiveChCategoryData _$FiveChCategoryDataFromJson(Map<String, dynamic> json) =>
    FiveChCategoryData(
      categoryNumber: json['categoryNumber'] as String,
      categoryContent: (json['categoryContent'] as List<dynamic>)
          .map((e) => BoardData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FiveChCategoryDataToJson(FiveChCategoryData instance) =>
    <String, dynamic>{
      'categoryNumber': instance.categoryNumber,
      'categoryContent':
          instance.categoryContent.map((e) => e.toJson()).toList(),
    };

FiveChBoardData _$FiveChBoardDataFromJson(Map<String, dynamic> json) =>
    FiveChBoardData(
      url: json['url'] as String,
      category: json['category'] as int,
      categoryOrder: json['categoryOrder'] as int,
      categoryName: json['categoryName'] as String,
      directoryName: json['directoryName'] as String,
    );

Map<String, dynamic> _$FiveChBoardDataToJson(FiveChBoardData instance) =>
    <String, dynamic>{
      'categoryOrder': instance.categoryOrder,
      'directoryName': instance.directoryName,
      'url': instance.url,
      'category': instance.category,
      'categoryName': instance.categoryName,
    };

FiveChThreadContentData _$FiveChThreadContentDataFromJson(
        Map<String, dynamic> json) =>
    FiveChThreadContentData(
      index: json['index'] as int,
      name: json['name'] as String,
      email: json['email'] as String?,
      dateAndId: json['dateAndId'] as String,
      body: json['body'] as String,
      title: json['title'] as String?,
      urlSet:
          (json['urlSet'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      domain: json['domain'] as String,
      directoryName: json['directoryName'] as String,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$FiveChThreadContentDataToJson(
        FiveChThreadContentData instance) =>
    <String, dynamic>{
      'index': instance.index,
      'body': instance.body,
      'urlSet': instance.urlSet,
      'name': instance.name,
      'email': instance.email,
      'dateAndId': instance.dateAndId,
      'title': instance.title,
      'domain': instance.domain,
      'directoryName': instance.directoryName,
      'userId': instance.userId,
    };
