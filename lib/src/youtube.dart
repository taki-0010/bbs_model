import 'importer.dart';
part 'youtube.g.dart';

enum YoutubeIdType {
  channel,
  search,
  playList;
}

enum YtSorts {
  newest(title: 'Newest', sort: VideoSorting.newest),
  popularity(title: 'Popularity', sort: VideoSorting.popularity),
  oldest(title: 'Oldest', sort: VideoSorting.oldest);

  const YtSorts({required this.title, required this.sort});
  final String title;
  final VideoSorting sort;
}

enum YoutubeInitialBoards {
  trends(title: 'Trends'),
  music(title: 'Music'),
  gaming(title: 'Gaming'),
  movies(title: 'Movies');

  const YoutubeInitialBoards({required this.title});
  final String title;
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
  static const reportUrl = 'https://support.google.com/youtube/answer/2802027';

  static const chFilter = 'EgIQAg%253D%253D';
  static const plFilter = 'EgIQAw%253D%253D';
  static const viFilter = 'EgIQAQ%253D%253D';

  // video
  // https://youtube.com/watch?v=Dpp1sIL1m5Q

  // cnannel
  // https://www.youtube.com/@TheTRYChannel
  // https://www.youtube.com/channel/UCabq3No3wXbs6Ut-Pux6SzA

  static String thumbnailUrl(final String id) {
    return 'https://i.ytimg.com/vi/$id/hqdefault.jpg';
  }

  static String getFavStr(final String id, final bool chOrPl) {
    return chOrPl ? '$boardPrefixCh$id' : '$boardPrefixPl$id';
  }

  static String getChIdForFavBoard(final String id) => '$boardPrefixCh$id';

  static bool rawId(final String id) {
    if (id.startsWith(boardPrefixCh)) {
      return false;
    }
    if (id.startsWith(boardPrefixPl)) {
      return false;
    }
    return true;
  }

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

  static YoutubeThreadData getThread(final Video v,
      {final String? boardId, final bool playlist = false}) {
    return YoutubeThreadData(
        id: v.id.value,
        title: v.title,
        dec: v.description,
        resCount: -1,
        boardId: boardId ?? v.channelId.value,
        thumbnailFullUrl: v.thumbnails.highResUrl,
        type: Communities.youtube,
        url: v.url,
        searched: boardId == null,
        boardName: v.author,
        dateUtc: v.publishDate,
        duration: v.duration,
        viewCount: playlist ? -1 : v.engagement.viewCount,
        channelId: v.channelId.value);
  }

  static Future<YoutubeVideoSearchResult> searchFirstThreads(
      final String keyword) async {
    final first = await yt.search.search(keyword, filter: TypeFilters.video);
    final second = await first.nextPage();
    final f = first.map((final v) => getThread(v)).toList();
    final s = second?.map((final v) => getThread(v)).toList();
    final list = [...f, ...?s];

    return YoutubeVideoSearchResult(
        data: second, keyword: keyword, result: list);
  }

  static Future<YoutubeVideoSearchResult> searchNextThreads(
      final YoutubeVideoSearchResult value) async {
    final first = await value.data?.nextPage();
    final second = await first?.nextPage();
    final f = first?.map((final v) => getThread(v)).toList();
    final s = second?.map((final v) => getThread(v)).toList();
    final list = [...?f, ...?s];

    return value.copyWith(data: second, result: list);
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
          pubTimeStr: i.publishedTime,
          com: i,
          // channelLogo: user.logoUrl,
          commentId: '');
      list.add(com);
    }
    return list;
  }

  static YtSorts selectedSort(final YoutubeSortData value) {
    switch (value.data) {
      case VideoSorting.newest:
        return YtSorts.newest;
      case VideoSorting.oldest:
        return YtSorts.oldest;
      case VideoSorting.popularity:
        return YtSorts.popularity;
      default:
        return YtSorts.newest;
    }
  }

  static Stream<void> getThreads(
    final String id,
  ) async* {
    final data = yt.channels.getUploads(id);
    data.listen((event) {
      logger.d('yt: ${event.title}');
    });
  }

  static YoutubeBoardData? getSearchedBoard(final BaseSearchContent value) {
    if (value is SearchPlaylist) {
      return YoutubeBoardData(
          id: value.playlistId.value,
          name: value.playlistTitle,
          forum: Communities.youtube,
          countNum: value.playlistVideoCount);
    }
    if (value is SearchChannel) {
      // logger.d('yt: ch: ${i.id}, ${i.name}, ${i.description}, ${i.videoCount}');
      return YoutubeBoardData(
          id: value.id.value,
          name: value.name,
          forum: Communities.youtube,
          desc: value.description);
    }
    return null;
  }

  static Future<YoutubeSearchResult> searchPlaylist(
      final String keyword) async {
    final data =
        await yt.search.searchContent(keyword, filter: SearchFilter(plFilter));
    List<BoardData?> result = [];
    logger.d('yt:  ${data.length}');
    if (data.isNotEmpty) {
      for (final i in data) {
        final c = getSearchedBoard(i);
        if (c != null) {
          result.add(c);
        }
      }
    }
    final d = YoutubeSearchResult(data: data, list: result);
    return d;
  }

  static Future<YoutubeSearchResult> searchChannel(final String keyword) async {
    // final data = await yt.search.
    // final ch = await yt.search.search(searchQuery)
    final data =
        await yt.search.searchContent(keyword, filter: SearchFilter(chFilter));
    List<BoardData?> result = [];
    logger.d('yt:  ${data.length}');
    if (data.isNotEmpty) {
      for (final i in data) {
        final c = getSearchedBoard(i);
        if (c != null) {
          result.add(c);
        }
      }
    }
    final d = YoutubeSearchResult(data: data, list: result);
    return d;
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
      this.banner,
      super.leading,
      super.desc,
      this.initial,
      this.countNum});
  final String? channelHandle;
  final String? logo;
  final String? banner;
  final YoutubeInitialBoards? initial;
  final int? countNum;

  @override
  int? get count => countNum;

  @override
  String? get leadingIconSrc => logo;

  String? get parsedId {
    return YoutubeData.parseBoardId(id);
  }

  YoutubeIdType? get idType => YoutubeData.boardIdType(id);

  Uri get boardUri => Uri.https(YoutubeData.host, 'channel/$parsedId');
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
      super.boardName,
      // this.tags = const [],
      // super.thumbnailStr,
      this.dateStr,
      this.dateUtc,
      this.searched = false,
      required this.channelId,
      required this.viewCount,
      this.viewCountStr,
      required this.duration,
      this.durationStr
      // required this.originalUrl
      });
  final String dec;
  // final String url;
  // final List<String?> tags;
  final String? dateStr;
  final DateTime? dateUtc;
  final bool searched;
  final String channelId;
  final int viewCount;
  final String? viewCountStr;
  final Duration? duration;
  final String? durationStr;
  // final String originalUrl;

  @override
  String get countStr {
    if (viewCountStr != null) {
      return viewCountStr!;
    }
    return StringMethodData.formatedNum(viewCount);
  }

  @override
  String? get getDurationStr {
    if (durationStr != null) {
      return durationStr;
    }
    if (duration != null) {
      return StringMethodData.durationStr(duration!);
    }
    return null;
  }

  @override
  String? get getUserId => channelId;

  @override
  int? get createdAt {
    if (dateTime == null) {
      return null;
    }
    return dateTime!.millisecondsSinceEpoch;
  }

  @override
  DateTime? get dateTime {
    return dateUtc;
  }

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
      this.desc,
      this.pubTimeStr,
      this.pubDatetime,
      this.viewCount});

  final int likeCount;
  final int replyCount;
  final String commentId;
  final String channelId;
  final Comment? com;
  final String? channelLogo;
  final String? desc;
  final String? pubTimeStr;
  final DateTime? pubDatetime;
  final int? viewCount;

  String comUrl(final String value) {
    return '$value&ic=$commentId';
  }

  @override
  DateTime? get createdAt {
    return pubDatetime;
  }

  @override
  String? get createdAtStr {
    return pubTimeStr;
  }

  @override
  String? get srcThumbnail => thumbUrl;

  @override
  String? get srcContent => thumbUrl;

  @override
  String? get getUserName => name;

  @override
  String? get getUserId => channelId;

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

class YoutubeCommentsListData {
  const YoutubeCommentsListData({required this.data});
  final CommentsList? data;
}

@CopyWith()
@immutable
class YoutubeVideoSearchResult {
  const YoutubeVideoSearchResult(
      {this.data, required this.keyword, this.result = const []});
  final VideoSearchList? data;
  final String keyword;
  final List<YoutubeThreadData?> result;
}

class YoutubeThreadsResult {
  const YoutubeThreadsResult({
    this.data,
  });
  final ChannelUploadsList? data;
}

class YoutubeSortData {
  const YoutubeSortData({this.data = VideoSorting.newest});
  final VideoSorting data;
}

@immutable
class YoutubeSearchResult {
  const YoutubeSearchResult({this.list = const [], required this.data});
  final List<BoardData?> list;
  final SearchList<BaseSearchContent> data;
}
