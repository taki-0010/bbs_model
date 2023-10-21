// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machi.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MachiBoardDataCWProxy {
  MachiBoardData id(String id);

  MachiBoardData name(String name);

  MachiBoardData forum(Communities forum);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MachiBoardData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MachiBoardData(...).copyWith(id: 12, name: "My name")
  /// ````
  MachiBoardData call({
    String? id,
    String? name,
    Communities? forum,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMachiBoardData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMachiBoardData.copyWith.fieldName(...)`
class _$MachiBoardDataCWProxyImpl implements _$MachiBoardDataCWProxy {
  const _$MachiBoardDataCWProxyImpl(this._value);

  final MachiBoardData _value;

  @override
  MachiBoardData id(String id) => this(id: id);

  @override
  MachiBoardData name(String name) => this(name: name);

  @override
  MachiBoardData forum(Communities forum) => this(forum: forum);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MachiBoardData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MachiBoardData(...).copyWith(id: 12, name: "My name")
  /// ````
  MachiBoardData call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? forum = const $CopyWithPlaceholder(),
  }) {
    return MachiBoardData(
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
    );
  }
}

extension $MachiBoardDataCopyWith on MachiBoardData {
  /// Returns a callable class that can be used as follows: `instanceOfMachiBoardData.copyWith(...)` or like so:`instanceOfMachiBoardData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MachiBoardDataCWProxy get copyWith => _$MachiBoardDataCWProxyImpl(this);
}

abstract class _$MachiThreadsBaseDataCWProxy {
  MachiThreadsBaseData thread(List<MachiThreadDataFromJson?> thread);

  MachiThreadsBaseData status(String status);

  MachiThreadsBaseData bbs(String bbs);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MachiThreadsBaseData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MachiThreadsBaseData(...).copyWith(id: 12, name: "My name")
  /// ````
  MachiThreadsBaseData call({
    List<MachiThreadDataFromJson?>? thread,
    String? status,
    String? bbs,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMachiThreadsBaseData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMachiThreadsBaseData.copyWith.fieldName(...)`
class _$MachiThreadsBaseDataCWProxyImpl
    implements _$MachiThreadsBaseDataCWProxy {
  const _$MachiThreadsBaseDataCWProxyImpl(this._value);

  final MachiThreadsBaseData _value;

  @override
  MachiThreadsBaseData thread(List<MachiThreadDataFromJson?> thread) =>
      this(thread: thread);

  @override
  MachiThreadsBaseData status(String status) => this(status: status);

  @override
  MachiThreadsBaseData bbs(String bbs) => this(bbs: bbs);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MachiThreadsBaseData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MachiThreadsBaseData(...).copyWith(id: 12, name: "My name")
  /// ````
  MachiThreadsBaseData call({
    Object? thread = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? bbs = const $CopyWithPlaceholder(),
  }) {
    return MachiThreadsBaseData(
      thread: thread == const $CopyWithPlaceholder() || thread == null
          ? _value.thread
          // ignore: cast_nullable_to_non_nullable
          : thread as List<MachiThreadDataFromJson?>,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String,
      bbs: bbs == const $CopyWithPlaceholder() || bbs == null
          ? _value.bbs
          // ignore: cast_nullable_to_non_nullable
          : bbs as String,
    );
  }
}

extension $MachiThreadsBaseDataCopyWith on MachiThreadsBaseData {
  /// Returns a callable class that can be used as follows: `instanceOfMachiThreadsBaseData.copyWith(...)` or like so:`instanceOfMachiThreadsBaseData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MachiThreadsBaseDataCWProxy get copyWith =>
      _$MachiThreadsBaseDataCWProxyImpl(this);
}

abstract class _$MachiThreadDataFromJsonCWProxy {
  MachiThreadDataFromJson subject(String subject);

  MachiThreadDataFromJson no(int no);

  MachiThreadDataFromJson res(String res);

  MachiThreadDataFromJson key(String key);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MachiThreadDataFromJson(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MachiThreadDataFromJson(...).copyWith(id: 12, name: "My name")
  /// ````
  MachiThreadDataFromJson call({
    String? subject,
    int? no,
    String? res,
    String? key,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMachiThreadDataFromJson.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMachiThreadDataFromJson.copyWith.fieldName(...)`
class _$MachiThreadDataFromJsonCWProxyImpl
    implements _$MachiThreadDataFromJsonCWProxy {
  const _$MachiThreadDataFromJsonCWProxyImpl(this._value);

  final MachiThreadDataFromJson _value;

  @override
  MachiThreadDataFromJson subject(String subject) => this(subject: subject);

  @override
  MachiThreadDataFromJson no(int no) => this(no: no);

  @override
  MachiThreadDataFromJson res(String res) => this(res: res);

  @override
  MachiThreadDataFromJson key(String key) => this(key: key);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MachiThreadDataFromJson(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MachiThreadDataFromJson(...).copyWith(id: 12, name: "My name")
  /// ````
  MachiThreadDataFromJson call({
    Object? subject = const $CopyWithPlaceholder(),
    Object? no = const $CopyWithPlaceholder(),
    Object? res = const $CopyWithPlaceholder(),
    Object? key = const $CopyWithPlaceholder(),
  }) {
    return MachiThreadDataFromJson(
      subject: subject == const $CopyWithPlaceholder() || subject == null
          ? _value.subject
          // ignore: cast_nullable_to_non_nullable
          : subject as String,
      no: no == const $CopyWithPlaceholder() || no == null
          ? _value.no
          // ignore: cast_nullable_to_non_nullable
          : no as int,
      res: res == const $CopyWithPlaceholder() || res == null
          ? _value.res
          // ignore: cast_nullable_to_non_nullable
          : res as String,
      key: key == const $CopyWithPlaceholder() || key == null
          ? _value.key
          // ignore: cast_nullable_to_non_nullable
          : key as String,
    );
  }
}

extension $MachiThreadDataFromJsonCopyWith on MachiThreadDataFromJson {
  /// Returns a callable class that can be used as follows: `instanceOfMachiThreadDataFromJson.copyWith(...)` or like so:`instanceOfMachiThreadDataFromJson.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MachiThreadDataFromJsonCWProxy get copyWith =>
      _$MachiThreadDataFromJsonCWProxyImpl(this);
}

abstract class _$MachiThreadDataCWProxy {
  MachiThreadData id(String id);

  MachiThreadData title(String title);

  MachiThreadData resCount(int resCount);

  MachiThreadData boardId(String boardId);

  MachiThreadData type(Communities type);

  MachiThreadData url(String url);

  MachiThreadData boardName(String? boardName);

  MachiThreadData isNewPost(bool isNewPost);

  MachiThreadData updateAtStr(String? updateAtStr);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MachiThreadData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MachiThreadData(...).copyWith(id: 12, name: "My name")
  /// ````
  MachiThreadData call({
    String? id,
    String? title,
    int? resCount,
    String? boardId,
    Communities? type,
    String? url,
    String? boardName,
    bool? isNewPost,
    String? updateAtStr,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMachiThreadData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMachiThreadData.copyWith.fieldName(...)`
class _$MachiThreadDataCWProxyImpl implements _$MachiThreadDataCWProxy {
  const _$MachiThreadDataCWProxyImpl(this._value);

  final MachiThreadData _value;

  @override
  MachiThreadData id(String id) => this(id: id);

  @override
  MachiThreadData title(String title) => this(title: title);

  @override
  MachiThreadData resCount(int resCount) => this(resCount: resCount);

  @override
  MachiThreadData boardId(String boardId) => this(boardId: boardId);

  @override
  MachiThreadData type(Communities type) => this(type: type);

  @override
  MachiThreadData url(String url) => this(url: url);

  @override
  MachiThreadData boardName(String? boardName) => this(boardName: boardName);

  @override
  MachiThreadData isNewPost(bool isNewPost) => this(isNewPost: isNewPost);

  @override
  MachiThreadData updateAtStr(String? updateAtStr) =>
      this(updateAtStr: updateAtStr);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MachiThreadData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MachiThreadData(...).copyWith(id: 12, name: "My name")
  /// ````
  MachiThreadData call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? resCount = const $CopyWithPlaceholder(),
    Object? boardId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? boardName = const $CopyWithPlaceholder(),
    Object? isNewPost = const $CopyWithPlaceholder(),
    Object? updateAtStr = const $CopyWithPlaceholder(),
  }) {
    return MachiThreadData(
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

extension $MachiThreadDataCopyWith on MachiThreadData {
  /// Returns a callable class that can be used as follows: `instanceOfMachiThreadData.copyWith(...)` or like so:`instanceOfMachiThreadData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MachiThreadDataCWProxy get copyWith => _$MachiThreadDataCWProxyImpl(this);
}

abstract class _$MachiContentBaseDataCWProxy {
  MachiContentBaseData log(List<MachiContentDataFromJson?> log);

  MachiContentBaseData status(String status);

  MachiContentBaseData bbs(String bbs);

  MachiContentBaseData subject(String subject);

  MachiContentBaseData key(String key);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MachiContentBaseData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MachiContentBaseData(...).copyWith(id: 12, name: "My name")
  /// ````
  MachiContentBaseData call({
    List<MachiContentDataFromJson?>? log,
    String? status,
    String? bbs,
    String? subject,
    String? key,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMachiContentBaseData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMachiContentBaseData.copyWith.fieldName(...)`
class _$MachiContentBaseDataCWProxyImpl
    implements _$MachiContentBaseDataCWProxy {
  const _$MachiContentBaseDataCWProxyImpl(this._value);

  final MachiContentBaseData _value;

  @override
  MachiContentBaseData log(List<MachiContentDataFromJson?> log) =>
      this(log: log);

  @override
  MachiContentBaseData status(String status) => this(status: status);

  @override
  MachiContentBaseData bbs(String bbs) => this(bbs: bbs);

  @override
  MachiContentBaseData subject(String subject) => this(subject: subject);

  @override
  MachiContentBaseData key(String key) => this(key: key);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MachiContentBaseData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MachiContentBaseData(...).copyWith(id: 12, name: "My name")
  /// ````
  MachiContentBaseData call({
    Object? log = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? bbs = const $CopyWithPlaceholder(),
    Object? subject = const $CopyWithPlaceholder(),
    Object? key = const $CopyWithPlaceholder(),
  }) {
    return MachiContentBaseData(
      log: log == const $CopyWithPlaceholder() || log == null
          ? _value.log
          // ignore: cast_nullable_to_non_nullable
          : log as List<MachiContentDataFromJson?>,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String,
      bbs: bbs == const $CopyWithPlaceholder() || bbs == null
          ? _value.bbs
          // ignore: cast_nullable_to_non_nullable
          : bbs as String,
      subject: subject == const $CopyWithPlaceholder() || subject == null
          ? _value.subject
          // ignore: cast_nullable_to_non_nullable
          : subject as String,
      key: key == const $CopyWithPlaceholder() || key == null
          ? _value.key
          // ignore: cast_nullable_to_non_nullable
          : key as String,
    );
  }
}

extension $MachiContentBaseDataCopyWith on MachiContentBaseData {
  /// Returns a callable class that can be used as follows: `instanceOfMachiContentBaseData.copyWith(...)` or like so:`instanceOfMachiContentBaseData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MachiContentBaseDataCWProxy get copyWith =>
      _$MachiContentBaseDataCWProxyImpl(this);
}

abstract class _$MachiContentDataFromJsonCWProxy {
  MachiContentDataFromJson time(String time);

  MachiContentDataFromJson no(int no);

  MachiContentDataFromJson status(String status);

  MachiContentDataFromJson mail(String mail);

  MachiContentDataFromJson host(String host);

  MachiContentDataFromJson message(String message);

  MachiContentDataFromJson name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MachiContentDataFromJson(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MachiContentDataFromJson(...).copyWith(id: 12, name: "My name")
  /// ````
  MachiContentDataFromJson call({
    String? time,
    int? no,
    String? status,
    String? mail,
    String? host,
    String? message,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMachiContentDataFromJson.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMachiContentDataFromJson.copyWith.fieldName(...)`
class _$MachiContentDataFromJsonCWProxyImpl
    implements _$MachiContentDataFromJsonCWProxy {
  const _$MachiContentDataFromJsonCWProxyImpl(this._value);

  final MachiContentDataFromJson _value;

  @override
  MachiContentDataFromJson time(String time) => this(time: time);

  @override
  MachiContentDataFromJson no(int no) => this(no: no);

  @override
  MachiContentDataFromJson status(String status) => this(status: status);

  @override
  MachiContentDataFromJson mail(String mail) => this(mail: mail);

  @override
  MachiContentDataFromJson host(String host) => this(host: host);

  @override
  MachiContentDataFromJson message(String message) => this(message: message);

  @override
  MachiContentDataFromJson name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MachiContentDataFromJson(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MachiContentDataFromJson(...).copyWith(id: 12, name: "My name")
  /// ````
  MachiContentDataFromJson call({
    Object? time = const $CopyWithPlaceholder(),
    Object? no = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? mail = const $CopyWithPlaceholder(),
    Object? host = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return MachiContentDataFromJson(
      time: time == const $CopyWithPlaceholder() || time == null
          ? _value.time
          // ignore: cast_nullable_to_non_nullable
          : time as String,
      no: no == const $CopyWithPlaceholder() || no == null
          ? _value.no
          // ignore: cast_nullable_to_non_nullable
          : no as int,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String,
      mail: mail == const $CopyWithPlaceholder() || mail == null
          ? _value.mail
          // ignore: cast_nullable_to_non_nullable
          : mail as String,
      host: host == const $CopyWithPlaceholder() || host == null
          ? _value.host
          // ignore: cast_nullable_to_non_nullable
          : host as String,
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $MachiContentDataFromJsonCopyWith on MachiContentDataFromJson {
  /// Returns a callable class that can be used as follows: `instanceOfMachiContentDataFromJson.copyWith(...)` or like so:`instanceOfMachiContentDataFromJson.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MachiContentDataFromJsonCWProxy get copyWith =>
      _$MachiContentDataFromJsonCWProxyImpl(this);
}

abstract class _$MachiContentDataCWProxy {
  MachiContentData forum(Communities forum);

  MachiContentData index(int index);

  MachiContentData name(String name);

  MachiContentData email(String email);

  MachiContentData dateAndId(String dateAndId);

  MachiContentData body(String body);

  MachiContentData title(String? title);

  MachiContentData urlSet(List<String?>? urlSet);

  MachiContentData userId(String? userId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MachiContentData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MachiContentData(...).copyWith(id: 12, name: "My name")
  /// ````
  MachiContentData call({
    Communities? forum,
    int? index,
    String? name,
    String? email,
    String? dateAndId,
    String? body,
    String? title,
    List<String?>? urlSet,
    String? userId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMachiContentData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMachiContentData.copyWith.fieldName(...)`
class _$MachiContentDataCWProxyImpl implements _$MachiContentDataCWProxy {
  const _$MachiContentDataCWProxyImpl(this._value);

  final MachiContentData _value;

  @override
  MachiContentData forum(Communities forum) => this(forum: forum);

  @override
  MachiContentData index(int index) => this(index: index);

  @override
  MachiContentData name(String name) => this(name: name);

  @override
  MachiContentData email(String email) => this(email: email);

  @override
  MachiContentData dateAndId(String dateAndId) => this(dateAndId: dateAndId);

  @override
  MachiContentData body(String body) => this(body: body);

  @override
  MachiContentData title(String? title) => this(title: title);

  @override
  MachiContentData urlSet(List<String?>? urlSet) => this(urlSet: urlSet);

  @override
  MachiContentData userId(String? userId) => this(userId: userId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MachiContentData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MachiContentData(...).copyWith(id: 12, name: "My name")
  /// ````
  MachiContentData call({
    Object? forum = const $CopyWithPlaceholder(),
    Object? index = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? dateAndId = const $CopyWithPlaceholder(),
    Object? body = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? urlSet = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
  }) {
    return MachiContentData(
      forum: forum == const $CopyWithPlaceholder() || forum == null
          ? _value.forum
          // ignore: cast_nullable_to_non_nullable
          : forum as Communities,
      index: index == const $CopyWithPlaceholder() || index == null
          ? _value.index
          // ignore: cast_nullable_to_non_nullable
          : index as int,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
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
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
    );
  }
}

extension $MachiContentDataCopyWith on MachiContentData {
  /// Returns a callable class that can be used as follows: `instanceOfMachiContentData.copyWith(...)` or like so:`instanceOfMachiContentData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MachiContentDataCWProxy get copyWith => _$MachiContentDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MachiThreadsBaseData _$MachiThreadsBaseDataFromJson(
        Map<String, dynamic> json) =>
    MachiThreadsBaseData(
      thread: (json['thread'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : MachiThreadDataFromJson.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status: json['status'] as String,
      bbs: json['bbs'] as String,
    );

Map<String, dynamic> _$MachiThreadsBaseDataToJson(
        MachiThreadsBaseData instance) =>
    <String, dynamic>{
      'thread': instance.thread.map((e) => e?.toJson()).toList(),
      'status': instance.status,
      'bbs': instance.bbs,
    };

MachiThreadDataFromJson _$MachiThreadDataFromJsonFromJson(
        Map<String, dynamic> json) =>
    MachiThreadDataFromJson(
      subject: json['subject'] as String,
      no: json['no'] as int,
      res: json['res'] as String,
      key: json['key'] as String,
    );

Map<String, dynamic> _$MachiThreadDataFromJsonToJson(
        MachiThreadDataFromJson instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'no': instance.no,
      'res': instance.res,
      'key': instance.key,
    };

MachiContentBaseData _$MachiContentBaseDataFromJson(
        Map<String, dynamic> json) =>
    MachiContentBaseData(
      log: (json['log'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : MachiContentDataFromJson.fromJson(
                      e as Map<String, dynamic>))
              .toList() ??
          const [],
      status: json['status'] as String,
      bbs: json['bbs'] as String,
      subject: json['subject'] as String,
      key: json['key'] as String,
    );

Map<String, dynamic> _$MachiContentBaseDataToJson(
        MachiContentBaseData instance) =>
    <String, dynamic>{
      'log': instance.log.map((e) => e?.toJson()).toList(),
      'status': instance.status,
      'bbs': instance.bbs,
      'key': instance.key,
      'subject': instance.subject,
    };

MachiContentDataFromJson _$MachiContentDataFromJsonFromJson(
        Map<String, dynamic> json) =>
    MachiContentDataFromJson(
      time: json['time'] as String,
      no: json['no'] as int,
      status: json['status'] as String,
      mail: json['mail'] as String,
      host: json['host'] as String,
      message: json['message'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MachiContentDataFromJsonToJson(
        MachiContentDataFromJson instance) =>
    <String, dynamic>{
      'no': instance.no,
      'time': instance.time,
      'status': instance.status,
      'name': instance.name,
      'mail': instance.mail,
      'host': instance.host,
      'message': instance.message,
    };

MachiContentData _$MachiContentDataFromJson(Map<String, dynamic> json) =>
    MachiContentData(
      forum: $enumDecode(_$CommunitiesEnumMap, json['forum']),
      index: json['index'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      dateAndId: json['dateAndId'] as String,
      body: json['body'] as String,
      title: json['title'] as String?,
      urlSet:
          (json['urlSet'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$MachiContentDataToJson(MachiContentData instance) =>
    <String, dynamic>{
      'forum': _$CommunitiesEnumMap[instance.forum]!,
      'index': instance.index,
      'body': instance.body,
      'urlSet': instance.urlSet,
      'name': instance.name,
      'userId': instance.userId,
      'title': instance.title,
      'email': instance.email,
      'dateAndId': instance.dateAndId,
    };

const _$CommunitiesEnumMap = {
  Communities.fiveCh: 'fiveCh',
  Communities.girlsCh: 'girlsCh',
  Communities.futabaCh: 'futabaCh',
  Communities.pinkCh: 'pinkCh',
  Communities.shitaraba: 'shitaraba',
  Communities.open2Ch: 'open2Ch',
  Communities.machi: 'machi',
  Communities.hatena: 'hatena',
  Communities.chan4: 'chan4',
};
