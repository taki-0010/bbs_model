import 'package:youtube_parser/youtube_parser.dart';

import 'importer.dart';
part 'thread.g.dart';

abstract class ThreadBase {
  const ThreadBase(
      {required this.id,
      required this.type,
      required this.title,
      required this.resCount,
      // required this.lastIndex,
      required this.boardId,
      // this.difference,
      required this.url,
      this.boardName,
      required this.positionToGet,
      // this.threadLength,
      // this.thumbnail,
      this.thumbnailStr});
  final String id;
  final Communities type;
  final String title;
  final int resCount;
  // final int lastIndex;
  final String boardId;
  // final SrcData? thumbnail;
  // final int? difference;
  final String? boardName;
  final String url;
  final PositionToGet positionToGet;
  final String? thumbnailStr;
  // final int? threadLength;

  double get ikioi {
    return 0.0;
  }

  int get getResCount => resCount;

  String? get thumbnailUrl => null;

  bool get useWebview =>
      type == Communities.girlsCh || type == Communities.futabaCh;

  String get getFullUrl => 'https://${url.replaceAll('https://', '')}';

  Uri get uri => Uri.parse(getFullUrl);

  String? get fiveChUrlForHtml {
    if (url.contains('5ch.net')) {
      final sub = url.substring(0, url.indexOf('.'));
      final path = '$sub.5ch.net/test/read.cgi/$boardId/$id';
      return 'https://$path';
    }
    return null;
  }

  String? get pinkChUrlForHtml {
    if (url.contains(Communities.pinkCh.host)) {
      final sub = url.substring(0, url.indexOf('.'));
      final path = '$sub.${Communities.pinkCh.host}/test/read.cgi/$boardId/$id';
      return 'https://$path';
    }
    return null;
  }

  String? get machiUrlForHtml {
    if (url.contains(Communities.machi.host)) {
      final path = '${Communities.machi.host}/bbs/read.cgi/$boardId/$id';
      return 'https://$path';
    }
    return null;
  }

  String? get compatibleUrl =>
      fiveChUrlForHtml ?? pinkChUrlForHtml ?? machiUrlForHtml;

  String? get htmlUrl {
    switch (type) {
      case Communities.fiveCh:
        return fiveChUrlForHtml;
      case Communities.pinkCh:
        return pinkChUrlForHtml;
      case Communities.machi:
        return machiUrlForHtml;
      default:
        return getFullUrl;
    }
  }

  String get futabaDirectory {
    final origin = uri.host;
    final index = origin.indexOf('.');
    return origin.substring(0, index);
  }

  String get futabaId {
    final seg = uri.pathSegments;
    final idStr = seg.last;
    final result = idStr.substring(0, idStr.indexOf('.'));
    return result;
  }
}

// @JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class ThreadData extends ThreadBase {
  const ThreadData(
      {required super.id,
      required super.title,
      required super.resCount,
      // required super.lastIndex,
      required super.type,
      // super.thumbnail,
      super.thumbnailStr,
      required super.url,
      // super.threadLength,
      // this.positionToGet = PositionToGet.first,
      // this.img,
      this.updateAtStr,
      // super.difference,
      required super.boardId,
      super.boardName,
      super.positionToGet = PositionToGet.first,
      this.catalog = false,
      // this.content = const [],
      this.isNewPost = false});

  final String? updateAtStr;
  // final int? difference;
  final bool isNewPost;
  final bool catalog;
  // final List<ContentData?> content;
  // final String boardId;

  // double get ikioi {
  //   return 0.0;
  // }

  DateTime? get dateTime => DateTime.now();

  // factory ThreadData.fromJson(Map<String, dynamic> json) =>
  //     _$ThreadDataFromJson(json);
  // Map<String, dynamic> toJson() => _$ThreadDataToJson(this);
  int? get createdAt {
    switch (type) {
      case Communities.fiveCh:
        return int.tryParse(id);
      case Communities.pinkCh:
        return int.tryParse(id);
      case Communities.machi:
        return int.tryParse(id);
      case Communities.futabaCh:
        return int.tryParse(updateAtStr ?? '0');
      default:
    }
    return null;
  }
}

// @JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class ThreadContentData {
  const ThreadContentData(
      {required this.id,
      required this.boardId,
      required this.type,
      // this.archived = false,
      this.threadLength = 1,
      this.content = const []});
  final String id;
  final String boardId;
  final Communities type;
  // final bool archived;
  final int threadLength;
  // final String title;
  final List<ContentData?> content;

  int? get lastIndex => content.isNotEmpty ? content.last?.index : null;

  // factory ThreadContentData.fromJson(Map<String, dynamic> json) =>
  //     _$ThreadContentDataFromJson(json);
  // Map<String, dynamic> toJson() => _$ThreadContentDataToJson(this);
}

@CopyWith()
@immutable
class FetchThreadsResultData {
  const FetchThreadsResultData({
    this.threads,
    this.statusCode,
  });
  final List<ThreadData?>? threads;
  final int? statusCode;

  FetchResult get result {
    if (threads != null && threads!.isNotEmpty) {
      return FetchResult.success;
    }
    if (statusCode != null && statusCode! >= 400) {
      return FetchResult.networkError;
    }

    return FetchResult.error;
  }
}

@immutable
class LinkData {
  const LinkData({required this.url, required this.type, this.embed});
  final String url;
  final OpenLinkList type;
  final EmbedSite? embed;

  final youtubeCss = '''
style= "position: relative;
  width: 100%;
  padding-top: 56.25%;
  overflow:auto; 
  -webkit-overflow-scrolling:touch;"
''';

  final youtubeEmbeStr = '''
<iframe style="position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    border:none;
    display:block;" src="https://www.youtube.com/embed/{{str}}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
''';
  String youtubeEmbed() {
    final id = getIdFromUrl(url);
    if (id != null) {
      return youtubeEmbeStr.replaceAll('{{str}}', id);
    }
    return '';
  }

  final xEmbeStr = '''
<blockquote class="twitter-tweet"><p lang="ja" dir="ltr"><a href="https://twitter.com/{{name}}/status/{{str}}?ref_src=twsrc%5Etfw"></a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
''';

  String? xComEmbed() {
    return UrlParser.xComEmbed(url);
    // if (!url.contains('status/')) {
    //   return null;
    // }
    // final index = url.indexOf('.com/') + 5;
    // final subed = url.substring(index);
    // final slash = subed.indexOf('/');
    // final userName = subed.substring(0, slash);
    // final statusIndex = url.indexOf('status/') + 7;
    // final idData = url.substring(statusIndex);

    // final id = RegExp(r'\d+').firstMatch(idData);
    // // final data = id.isNotEmpty ? id.first : null;
    // final idStr = id?.group(0);
    // if (idStr == null) {
    //   return null;
    // }
    // // logger.d('x.com: user: $userName, id: $idStr');
    // final replacedName = xEmbeStr.replaceAll('{{name}}', userName);
    // return replacedName.replaceAll('{{str}}', idStr);
  }

  String embedHtml() {
    String body = '';
    switch (embed) {
      case EmbedSite.youtube:
        body = youtubeEmbed();
        break;
      case EmbedSite.xCom:
        body = xComEmbed() ?? '';
        break;
      default:
    }
    final html = '''
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div ${embed == EmbedSite.youtube ? youtubeCss : ''}>$body</div>
</body>

''';
    return html;
  }
}

// @immutable
// class FetchThreadResultData {
//   const FetchThreadResultData({
//     this.statusCode = 200,
//     this.deleted,
//     this.archived,
//   });
//   final int statusCode;
//   final bool? deleted;
//   final bool? archived;
// }

@immutable
class FetchContentResultData {
  const FetchContentResultData(
      {this.contentList,
      this.statusCode,
      this.deleted,
      this.archived,
      this.threadLength});
  final List<ContentData?>? contentList;
  final int? statusCode;
  final bool? deleted;
  final bool? archived;
  final int? threadLength;

  FetchResult get result {
    if (contentList != null && contentList!.isNotEmpty) {
      return FetchResult.success;
    }
    if (statusCode != null && statusCode! >= 400) {
      return FetchResult.networkError;
    }
    if (deleted != null && deleted!) {
      return FetchResult.deleted;
    }
    return FetchResult.error;
  }
}
