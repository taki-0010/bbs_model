// import 'package:hashlib/hashlib.dart';
import 'package:model/src/importer.dart';
import 'dart:math';
part 'mal.g.dart';

class MalData {
  late String _clientId;
  String get clientId => _clientId;
  MalData._internal();
  static final MalData instance = MalData._internal();
  factory MalData() => instance;
  void set(final String value) => _clientId = value;
  bool get error => clientId == ConstantsDataBase.notFound;
  static const int contentsLimit = 50;

  static final host = Communities.mal.host;
  static final apiHost = 'api.$host';
  static final urlReg = RegExp(r'\[url=.+?\]');
  static final urlAndTextReg = RegExp(r'\[url=.*\].+?\[/url\]');
  static final malUrlAndTextReg = RegExp(r'\[mal_url=.*\].+?\[/mal_url\]');
  static final spoilerReg = RegExp(r'\[spoiler\].+?\[/spoiler\]');
  static final spReg = RegExp(r'\[sp\].+?\[/sp\]');
  static final imgReg = RegExp(r'\[img.*\].+?\[/[img]+\]');
  static final ytReg = RegExp(r'\[yt\].+?\[/yt\]');
  static final quoteReg = RegExp(r'\[quote\].+?\[/quote\]');
// [\[\]].+?\[/[b5]+\]
// \[b\].+?\[/[b]+\]
// \[.+?\].+?\[/.+?\]
// \[color=.+?\][\s\S]*?\[/color\]
// \[size=\d+?\][\s\S]*?\[/size\]
  // https://myanimelist.net/forum/?topicid=2120426

  static String? getThreadIdFromUri(final Uri uri) {
    final param = uri.queryParameters;
    if (param.containsKey('topicid')) {
      return param['topicid'];
    }
    return null;
  }

  static String getThreadUrl(final String threadId) {
    return '$host/forum/?topicid=$threadId';
  }

  static List<SearchCategoryData> get searchBoardList {
    final main = List.generate(
        20,
        (index) => SearchCategoryData(
            id: index.toString(),
            boardId: index.toString(),
            name: boardNameById(index.toString()) ?? '',
            forum: Communities.mal));
    main.removeWhere((element) => element.id == '18' || element.id == '0');
    return [
      SearchCategoryData(
          id: '-1',
          boardId: '-1',
          name: boardNameById('-1') ?? '',
          forum: Communities.mal),
      ...main
    ];
  }

  static String? boardNameById(final String value) {
    if (value.startsWith('s')) {
      final v = value.replaceAll('s', '');
      switch (v) {
        case '2':
          return 'Anime DB';
        case '3':
          return 'Character & People DB';
        case '5':
          return 'Manga DB';
        case '1':
          return 'Anime Series';
        case '4':
          return 'Manga Series';
        default:
      }
      return null;
    }
    switch (value) {
      case '-1':
        return 'All';
      case '5':
        return 'Updates & Announcements';
      case '14':
        return 'MAL Guidelines & FAQ';
      case '3':
        return 'Support';
      case '4':
        return 'Suggestions';
      case '13':
        return 'MAL Contests';
      case '15':
        return 'News Discussion';
      case '16':
        return 'Anime & Manga Recommendations';
      case '1':
        return 'Anime Discussion';
      case '2':
        return 'Manga Discussion';
      case '8':
        return 'Introductions';
      case '7':
        return 'Games, Computers & Tech Support';
      case '10':
        return 'Music & Entertainment';
      case '11':
        return 'Casual Discussion';
      case '12':
        return 'Creative Corner';
      case '9':
        return 'Forum Games';
      case '6':
        return 'Current Events';
      case '17':
        return 'DB Modofication Requests';
      case '19':
        return 'Series Discussion';
      default:
    }
    return null;
  }
}

@JsonSerializable(createToJson: false, explicitToJson: true)
@immutable
class MalBoardsBaseJson {
  const MalBoardsBaseJson({required this.categories});
  final List<MalCategoryJson> categories;

  factory MalBoardsBaseJson.fromJson(Map<String, dynamic> json) =>
      _$MalBoardsBaseJsonFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
@immutable
class MalCategoryJson {
  const MalCategoryJson({required this.title, required this.boards});
  final String title;
  final List<MalBoardJson> boards;

  factory MalCategoryJson.fromJson(Map<String, dynamic> json) =>
      _$MalCategoryJsonFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
@immutable
class MalBoardJson {
  const MalBoardJson(
      {required this.id,
      required this.title,
      required this.description,
      required this.subboards});
  final int id;
  final String title;
  final String description;
  final List<MalSubBoardJson> subboards;

  factory MalBoardJson.fromJson(Map<String, dynamic> json) =>
      _$MalBoardJsonFromJson(json);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
@immutable
class MalSubBoardJson {
  const MalSubBoardJson({
    required this.id,
    required this.title,
  });
  final int id;
  final String title;

  factory MalSubBoardJson.fromJson(Map<String, dynamic> json) =>
      _$MalSubBoardJsonFromJson(json);
}

@immutable
class MalBoardData extends BoardData {
  const MalBoardData(
      {required super.id,
      required super.name,
      required super.forum,
      this.subboard = false});
  final bool subboard;

  Uri get boardUri {
    // https://myanimelist.net/forum/?board=1
    // https: //myanimelist.net/forum/?subboard=1
    final boardId = subboard ? id.replaceAll('s', '') : id;
    final q = subboard ? 'subboard' : 'board';
    return Uri.https(MalData.host, 'forum', {q: boardId});
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@immutable
class MalThreadsBaseJson {
  const MalThreadsBaseJson({
    required this.data,
    required this.paging,
  });
  final List<MalThreadJson?> data;
  final MalPaging paging;

  factory MalThreadsBaseJson.fromJson(Map<String, dynamic> json) =>
      _$MalThreadsBaseJsonFromJson(json);
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@immutable
class MalThreadJson {
  const MalThreadJson({
    required this.id,
    required this.numberOfPosts,
    required this.title,
    required this.createdAt,
    required this.lastPostCreatedAt,
    this.isLocked = false,
    required this.createdBy,
  });
  final int id;
  final int numberOfPosts;
  // final int limit;
  // final int offset;
  final String title;
  final String createdAt;
  final String lastPostCreatedAt;
  final bool isLocked;
  final MalUserJson createdBy;

  factory MalThreadJson.fromJson(Map<String, dynamic> json) =>
      _$MalThreadJsonFromJson(json);
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@CopyWith()
@immutable
class MalPaging {
  const MalPaging({this.next, this.previous, this.last});
  final String? next;
  final String? previous;
  final String? last;

  bool get hasLinks => next != null || previous != null || last != null;

  int? get limitNum {
    final url = next ?? previous;
    if (url == null) {
      return null;
    }
    final uri = Uri.tryParse(url);
    if (uri == null) {
      return null;
    }
    final param = uri.queryParameters;
    if (param.containsKey('limit')) {
      final str = param['limit'];
      if (str != null) {
        return int.tryParse(str);
      }
    }
    return null;
  }

  int? get prevOffsetNum {
    final url = previous;
    if (url == null) {
      return null;
    }
    return _offsetNum(url);
  }

  int? get nextOffsetNum {
    final url = next;
    if (url == null) {
      return null;
    }
    return _offsetNum(url);
  }

  int? get lastOffsetNum {
    final url = last;
    if (url == null) {
      return null;
    }
    return _offsetNum(url);
  }

  int? _offsetNum(final String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      return null;
    }
    final param = uri.queryParameters;
    if (param.containsKey('offset')) {
      final str = param['offset'];
      if (str != null) {
        return int.tryParse(str);
      }
    }
    return null;
  }

  factory MalPaging.fromJson(Map<String, dynamic> json) =>
      _$MalPagingFromJson(json);
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@immutable
class MalUserJson {
  const MalUserJson(
      {required this.id,
      required this.name,
      this.modsTitle,
      this.forumTitle,
      this.forumAvator});
  final int id;
  final String name;
  final String? modsTitle;
  final String? forumTitle;
  final String? forumAvator;
  factory MalUserJson.fromJson(Map<String, dynamic> json) =>
      _$MalUserJsonFromJson(json);
}

@immutable
class MalThreadData extends ThreadData with WithDateTime {
  const MalThreadData(
      {required super.id,
      required super.title,
      required super.resCount,
      required super.boardId,
      required super.type,
      required super.url,
      super.updateAtStr,
      required this.createdAtStr,
      this.isSubboard = false,
      this.createdAtFromSearch,
      this.isLocked = false});
  final String createdAtStr;
  final String? createdAtFromSearch;

  final bool isSubboard;
  final bool isLocked;

  @override
  bool get locked => isLocked;

  @override
  DateTime? get dateTime {
    if (createdAtFromSearch != null) {
      final splited = createdAtFromSearch?.split(' ');
      if (splited == null || splited.isEmpty) {
        return null;
      }
      final y = splited.length >= 3
          ? splited[2]
          : splited.length <= 2
              ? DateTime.now().year.toString()
              : null;
      final m = splited.first;
      final d = splited[1];
      final p = DateFormat('yyyy MMM d').parse('$y $m $d');
      return p;
    }
    return DateTime.tryParse(createdAtStr);
  }

  @override
  int? get createdAt {
    final datetime = DateTime.tryParse(createdAtStr);
    if (datetime != null) {
      return (datetime.millisecondsSinceEpoch * 0.001).toInt();
    }
    return null;
  }

  @override
  double? get updateAt {
    if (updateAtStr != null) {
      final datetime = DateTime.tryParse(updateAtStr!);
      if (datetime != null) {
        return datetime.millisecondsSinceEpoch * 0.001;
      }
    }
    return null;
  }

  Uri get reportUri {
    // https://myanimelist.net/modules.php?go=report&type=forummessage&id=1&id2=2127504
    return Uri.https(MalData.host, 'modules.php',
        {'go': 'report', 'type': 'forummessage', 'id': '1', 'id2': id});
  }
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@immutable
class MalContentDataJson {
  const MalContentDataJson({
    required this.data,
    required this.paging,
  });
  final MalContentBaseJson data;
  final MalPaging paging;

  factory MalContentDataJson.fromJson(Map<String, dynamic> json) =>
      _$MalContentDataJsonFromJson(json);
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@immutable
class MalContentBaseJson {
  const MalContentBaseJson(
      {required this.posts, required this.title, this.poll});
  final List<MalContentJson?> posts;
  final String title;
  final MalPollBaseJson? poll;

  factory MalContentBaseJson.fromJson(Map<String, dynamic> json) =>
      _$MalContentBaseJsonFromJson(json);
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@immutable
class MalPollBaseJson {
  const MalPollBaseJson(
      {required this.id,
      required this.question,
      required this.closed,
      this.options = const []});
  final int id;
  final String question;
  final bool closed;
  final List<MalPollItemJson?> options;

  Map<int, double>? get pollRatio {
    // final options = value.options;
    if (options.isEmpty) {
      return null;
    }
    final counter = <int, double>{};
    final nums = options.map((e) => e?.votes).whereType<int>();

    final maxNum = nums.reduce(max);
    // String? result;
    for (final i in options) {
      if (i != null) {
        if (i.votes == maxNum) {
          counter[i.id] = 100.0;
        } else {
          final ratio = (maxNum * i.votes);
          final result = ratio > 0 ? ratio / 100 : 0.0;
          counter[i.id] = result;
        }
      }
    }
    return counter;
  }

  factory MalPollBaseJson.fromJson(Map<String, dynamic> json) =>
      _$MalPollBaseJsonFromJson(json);
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@immutable
class MalPollItemJson {
  const MalPollItemJson(
      {required this.id, required this.text, required this.votes});
  final int id;
  final String text;
  final int votes;

  factory MalPollItemJson.fromJson(Map<String, dynamic> json) =>
      _$MalPollItemJsonFromJson(json);
}

@immutable
class MalOptionData {
  const MalOptionData({this.paging, this.poll});
  final MalPaging? paging;
  final MalPollBaseJson? poll;
}

@JsonSerializable(
    fieldRename: FieldRename.snake, createToJson: false, explicitToJson: true)
@immutable
class MalContentJson {
  const MalContentJson({
    required this.id,
    required this.number,
    required this.body,
    required this.createdAt,
    required this.signature,
    // this.isLocked = false,
    required this.createdBy,
  });
  final int id;
  final int number;
  // final int limit;
  // final int offset;
  final String body;
  final String createdAt;
  final String signature;
  // final bool isLocked;
  final MalUserJson createdBy;

  factory MalContentJson.fromJson(Map<String, dynamic> json) =>
      _$MalContentJsonFromJson(json);
}

@immutable
class MalContentData extends ContentData {
  const MalContentData(
      {required super.forum,
      required super.index,
      required super.body,
      required super.name,
      super.title,
      super.urlSet,
      required this.createdAtStr,
      required this.signature,
      required this.user,
      required this.postId});
  final String createdAtStr;
  final String signature;
  final MalUserJson user;
  final int postId;

  @override
  String? get getUserId => user.id.toString();

  @override
  String? get getUserName => user.name;

  @override
  DateTime? get createdAt {
    final p = DateTime.tryParse(createdAtStr);
    return p;
  }

  String resUrlStr(final String threadId) {
// https: //myanimelist.net/forum/?goto=post&topicid=1527253&id=46729858
    return 'https://${MalData.host}/forum/?goto=post&topicid=$threadId&id=$postId';
  }

  Uri reportUri(final String threadId) {
    // https://myanimelist.net/modules.php?go=report&type=forummessagenew&id=46729858&id2=1527253
    return Uri.https(MalData.host, 'modules.php', {
      'go': 'report',
      'type': 'forummessagene',
      'id': postId,
      'id2': threadId
    });
  }

  @override
  Uri? get avatarUri {
    if (user.forumAvator == null) {
      return null;
    }
    final data = Uri.tryParse(user.forumAvator!);
    if (data == null) {
      return null;
    }
    if (UrlParser.getType(user.forumAvator) == MediaTypeList.image) {
      return data;
    }
    return null;
  }
}

class SearchCategoryData extends BoardData {
  const SearchCategoryData(
      {required super.id,
      required this.boardId,
      required super.name,
      required super.forum});
  final String boardId;
}
