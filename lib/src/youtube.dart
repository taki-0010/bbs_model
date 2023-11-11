import 'importer.dart';

enum YoutubeIdType {
  channel,
  search,
  playList;
}

class YoutubeData {
  static final host = Communities.youtube.host;
  static const sHost = 'youtu.be';
  static const ch = 'channel';
  static const watch = 'watch';
  static const boardPrefixCh = 'ch/';
  static const boardPrefixPl = 'pl/';
  static const boardPrefixSe = 'se/';
  static final yt = YoutubeExplode();

  // video
  // https://youtube.com/watch?v=Dpp1sIL1m5Q

  // cnannel
  // https://www.youtube.com/@TheTRYChannel
  // https://www.youtube.com/channel/UCabq3No3wXbs6Ut-Pux6SzA

  static YoutubeIdType? boardIdType(final String value) {
    if (value.startsWith(boardPrefixCh)) {
      return YoutubeIdType.channel;
    }
    if (value.startsWith(boardPrefixPl)) {
      return YoutubeIdType.playList;
    }
    if (value.startsWith(boardPrefixSe)) {
      return YoutubeIdType.search;
    }
    return null;
  }

  static String? parseBoardId(final String value) {
    final type = boardIdType(value);
    if (type != null) {
      return value.substring(3);
    }
    // if (value.startsWith(boardPrefixCh)) {
    //   return value.substring(
    //     value.indexOf(boardPrefixCh) + 3,
    //   );
    // }
    // if (value.startsWith(boardPrefixPl)) {
    //   return value.substring(value.indexOf(boardPrefixPl) + 3);
    // }
    // if (value.startsWith(boardPrefixSe)) {
    //   return value.substring(value.indexOf(boardPrefixSe) + 3);
    // }
    return null;
  }

  static bool? uriIsThreadOrBoard(final Uri uri) {
    final h = uri.host;
    if (!h.contains(host) && sHost != h) {
      return null;
    }
    final seg = uri.pathSegments;
    logger.d('yt: $seg');
    if (seg.isEmpty) {
      return null;
    }
    final first = seg.first;
    if (first == ch) {
      return false;
    }
    if (first.startsWith('@')) {
      return false;
    }
    if (first == watch) {
      return true;
    }
    return null;
  }

  static String? getBoardIdFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null || tob) {
      return null;
    }
    final seg = uri.pathSegments;
    final first = seg.first;
    if (first == ch && seg[1].isNotEmpty) {
      return seg[1];
    }
    if (first.startsWith('@')) {
      return first;
    }
    return null;
  }

  static String? getThreadIdFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null || !tob) {
      return null;
    }
    final param = uri.queryParameters;
    if (param.containsKey('v')) {
      return param['v'];
    }
    return null;
  }

  static List<YoutubeContent?> getComList(final CommentsList value) {
    List<YoutubeContent?> list = [];
    for (final i in value) {
      final com = YoutubeContent(
          forum: Communities.youtube,
          index: 1,
          body: i.text,
          name: i.author,
          channelId: i.channelId.value,
          likeCount: i.likeCount,
          replyCount: i.replyCount,
          com: i,
          // channelLogo: user.logoUrl,
          commentId: '');
      list.add(com);
    }
    return list;
  }
}

@CopyWith()
@immutable
class YoutubeBoardData extends BoardData {
  const YoutubeBoardData(
      {required super.id,
      required super.name,
      required super.forum,
      this.channelHandle,
      this.logo,
      this.banner});
  final String? channelHandle;
  final String? logo;
  final String? banner;

  String? get parsedId {
    return YoutubeData.parseBoardId(id);
  }

  YoutubeIdType? get idType => YoutubeData.boardIdType(id);
}

@CopyWith()
@immutable
class YoutubeThreadData extends ThreadData {
  const YoutubeThreadData(
      {required super.id,
      required super.title,
      required this.dec,
      required super.resCount,
      required super.boardId,
      required super.type,
      required super.url,
      super.thumbnailFullUrl,
      // this.tags = const [],
      // super.thumbnailStr,
      this.dateStr,
      this.dateUtc,
      this.searched = false
      // required this.originalUrl
      });
  final String dec;
  // final String url;
  // final List<String?> tags;
  final String? dateStr;
  final DateTime? dateUtc;
  final bool searched;
  // final String originalUrl;

  @override
  String get countStr {
    return StringMethodData.formatedNum(resCount);
  }

  // @override
  // int? get createdAt {
  //   if (dateTime == null) {
  //     return null;
  //   }
  //   return dateTime!.millisecondsSinceEpoch;
  // }

  // @override
  // DateTime? get dateTime {
  //   if (dateUtc != null) {
  //     return dateUtc;
  //   }
  //   if (dateStr == null) {
  //     return null;
  //   }
  //   final f = DateFormat('yyyy/MM/dd');
  //   return f.parse(dateStr!);
  // }

  // SrcData? get thumbnail => thumbnailStr != null
  //     ? SrcData.fromJson(stringToJson(thumbnailStr!))
  //     : null;

  // String get url => '$directory.2chan.net/$boardId/res/$id.htm';
  @override
  String? get thumbnailUrl => thumbnailFullUrl;
}


// @CopyWith()
@immutable
class YoutubeContent extends ContentData {
  const YoutubeContent(
      {required super.forum,
      required super.index,
      required super.body,
      required super.name,
      super.urlSet,
      super.title,
      super.thumbUrl,
      this.likeCount = 0,
      this.replyCount = 0,
      required this.commentId,
      required this.channelId,
      this.com,
      this.channelLogo,
      this.desc});

  final int likeCount;
  final int replyCount;
  final String commentId;
  final String channelId;
  final Comment? com;
  final String? channelLogo;
  final String? desc;

  String comUrl(final String value) {
    return '$value&ic=$commentId';
  }

  @override
  String? get srcThumbnail => thumbUrl;

  @override
  String? get srcContent => thumbUrl;

  @override
  String? get getUserName => name;

  @override
  Uri? get avatarUri {
    if (channelLogo == null) {
      return null;
    }
    return Uri.tryParse(channelLogo!);
  }

  List<int?> get replies {
    if (com == null) {
      return [];
    }
    final result = List.generate(com!.replyCount, (index) => index);
    return result;
  }
}

class YoutubeCommentsListData{
  const YoutubeCommentsListData({required this.data});
  final CommentsList data;
}
