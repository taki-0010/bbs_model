import 'importer.dart';

part 'five_ch.g.dart';

class FiveChData {
  static final host = Communities.fiveCh.host;
  static const permissionOfficial = '0644';
  static const subdomainForMobile = 'itest';
  static const pathForMobile = 'subback';
  static const threadPath = 'test/read.cgi';
  static const wiki = 'index.php';
  static const titileField = 'BBS_TITLE_ORIG';
  static const defaultNameField = 'BBS_NONAME_NAME';
  static final idReg = RegExp(r'[0-9]{5,}');
  static const reportUrl =
      'https://info.5ch.net/index.php/%E8%8D%92%E3%82%89%E3%81%97%E5%A0%B1%E5%91%8A';
  static const pinkReportUrl =
      'https://deleter.bbspink.com/wiki/wiki.cgi?page=GUIDELINE';
  // thread pc
  // https://egg.5ch.net/test/read.cgi/software/1690261572/l50
  // https://egg.5ch.net/software/dat/1690261572.dat
  // thread mb
  // https://itest.5ch.net/asahi/test/read.cgi/newsplus/1697080449

  // board
  // mb https://itest.5ch.net/subback/covid19
  // pc https://krsw.5ch.net/covid19

  static Uri get getReportUri {
    return Uri.https('info.$host',
        'index.php/%E8%8D%92%E3%82%89%E3%81%97%E5%A0%B1%E5%91%8A');
  }

  static Uri get getReportUriPink {
    return Uri.https(
        'deleter.bbspink.com', 'wiki/wiki.cgi', {'page': 'GUIDELINE'});
  }

  static String? subdomainFromUrl(final String url) {
    final uri = Uri.tryParse(url);
    if (uri != null) {
      final splited = uri.host.split('.');
      if (splited.length >= 3) {
        return splited.first;
      }
    }
    return null;
  }

  static String? defaultName(final String value) {
    final list = value.split('\n');
    for (final i in list) {
      if (i.startsWith(defaultNameField)) {
        return i.replaceAll('$defaultNameField=', '').trim();
      }
    }
    return null;
  }

  static String? boardNameById(final String value) {
    final list = value.split('\n');
    for (final i in list) {
      if (i.startsWith(titileField)) {
        return i.replaceAll('$titileField=', '').trim();
      }
    }
    return null;
  }

  static Uri? htmlToDatUri(final Uri uri, final Communities forum) {
    final threadId = getThreadIdFromUri(uri, forum);
    final directory = getDirectoryFromUri(uri, forum);
    final boardId = getBoardIdFromUri(uri, forum);
    if (threadId != null && directory != null && boardId != null) {
      return Uri.https(
          '$directory.${forum.host}', '$boardId/dat/$threadId.dat');
    }
    return null;
  }

  static bool? uriIsThreadOrBoard(final Uri uri, final Communities forum) {
    if (!uri.host.contains(forum.host)) {
      return null;
    }
    if (uri.path.contains(wiki)) {
      return null;
    }
    if (uri.host.contains('menu.')) {
      return null;
    }
    if (uri.host.contains('www2.')) {
      return null;
    }
    if (uri.path.contains(threadPath)) {
      return true;
    }
    if (uri.path.endsWith('.dat')) {
      return true;
    }

    if (uri.pathSegments.isNotEmpty) {
      String? seg;
      if (uri.host.contains(subdomainForMobile) &&
          uri.path.contains(pathForMobile) &&
          uri.pathSegments.length >= 2) {
        seg = uri.pathSegments[1];
      } else {
        seg = uri.pathSegments.first;
      }
      final name = FiveChBoardNames.getById(seg);
      if (name != null) {
        return false;
      }
    }
    return null;
  }

  static String? getThreadIdFromUri(final Uri uri, final Communities forum) {
    final tob = uriIsThreadOrBoard(uri, forum);
    // logger.d('getThreadIdFromUri: tob: $tob, uri: $uri');
    if (tob == null || !tob) {
      return null;
    }
    final path = uri.path;
    final mached = idReg.firstMatch(path);
    // logger.d('getThreadIdFromUri: path: $path, ${mached?.group(0)}');
    if (mached != null) {
      return mached.group(0);
    }
    return null;
  }

  static String? getDirectoryFromUri(final Uri uri, final Communities forum) {
    final tob = uriIsThreadOrBoard(uri, forum);
    if (tob == null) {
      return null;
    }
    final seg = uri.pathSegments;
    if (uri.host.contains(subdomainForMobile)) {
      if (!tob) {
        return null;
      }
      if (seg.length >= 2) {
        return seg.first;
      }
    } else {
      final host = uri.host;
      final splited = host.split('.');
      if (splited.length >= 3) {
        return splited.first;
      }
    }
    return null;
  }

  //   static String _boardId(final List<String> seg) {
  //   return seg.firstWhere(
  //     (element) => FiveChBoardNames.getById(element) != null,
  //     orElse: () => '',
  //   );
  // }

  static String? getBoardIdFromUri(final Uri uri, final Communities forum) {
    final tob = uriIsThreadOrBoard(uri, forum);
    if (tob == null) {
      return null;
    }
    final seg = uri.pathSegments;
    // logger.d('getBoardIdFromUri: tob: $tob, seg: $seg');
    if (tob) {
      if (uri.host.contains(subdomainForMobile) && seg.length >= 4) {
        final reversed = seg.reversed.toList();
        if (reversed.first.isEmpty) {
          reversed.removeAt(0);
        }
        if (reversed.first.startsWith('l')) {
          reversed.removeAt(0);
        }
        final id = int.tryParse(reversed.first);
        if (id != null) {
          reversed.removeAt(0);
          // return reversed[1];
        }
        final id2 = int.tryParse(reversed.first);
        if (id2 != null) {
          reversed.removeAt(0);
          // return reversed[1];
        }
        final id3 = int.tryParse(reversed.first);
        if (id3 == null) {
          return reversed.first;
        }
        // return seg[3];
      }
      if (uri.path.contains('.dat') && seg.isNotEmpty) {
        return seg[0];
      }
      if (seg.length >= 3) {
        return seg[2];
      }
    }
    if (uri.host.contains(subdomainForMobile) && seg.length >= 2) {
      return seg[1];
    }
    if (seg.isNotEmpty) {
      return seg[0];
    }
    return null;
  }

  static int? getResNumFromUri(final Uri uri, final Communities forum) {
    final tob = uriIsThreadOrBoard(uri, forum);
    if (tob == null || !tob) {
      return null;
    }
    final seg = uri.pathSegments.reversed.toList();
    if (seg.first.isEmpty) {
      seg.removeAt(0);
    }
    final first = int.tryParse(seg.first);
    // final second = seg.length >= 2 ? int.tryParse(seg[1]) : null;
    if (first != null && first <= 1020) {
      return first;
    }
    return null;
  }

  static String? toMobileBoardUrl(
      {required final String host,
      required final String boardId,
      required final Communities type}) {
    if (host.contains('$subdomainForMobile.${type.host}')) {
      return 'https://$subdomainForMobile.${type.host}/$pathForMobile/$boardId';
    }
    return null;
  }

  static String? getTrip(final String name) {
    final splited = name.split(' ');
    if (splited.length >= 2) {
      final result = splited.firstWhere(
          (element) => element.contains('◆') || element.contains('★'),
          orElse: () => '');
      if (result.isNotEmpty) {
        return result;
      }
    }
    // if (name.contains('◆') && name.contains('<b>')) {
    //   return name.substring(name.indexOf('◆'), name.lastIndexOf('<b>'));
    // }
    return null;
  }

  static String getUserName(final String value) {
    final splited = value.split(' ');
    if (splited.length >= 2) {
      final name = splited.first.trim();
      return name.trim();
    }
    return value.trim();
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
@CopyWith()
@immutable
class FiveChBoardMetaData {
  const FiveChBoardMetaData(
      {required this.lastModifyString,
      required this.description,
      required this.lastModify,
      required this.menuList});
  final String lastModifyString;
  final String description;
  final int lastModify;
  final List<FiveChBoardCategoryJsonData> menuList;

  factory FiveChBoardMetaData.fromJson(Map<String, dynamic> json) =>
      _$FiveChBoardMetaDataFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
@CopyWith()
@immutable
class FiveChBoardCategoryJsonData {
  const FiveChBoardCategoryJsonData(
      {required this.categoryNumber,
      required this.categoryName,
      required this.categoryContent});
  final String categoryNumber;
  final String categoryName;
  final List<FiveChBoardJsonData> categoryContent;

  factory FiveChBoardCategoryJsonData.fromJson(Map<String, dynamic> json) =>
      _$FiveChBoardCategoryJsonDataFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
@CopyWith()
@immutable
class FiveChBoardJsonData {
  const FiveChBoardJsonData(
      {required this.categoryOrder,
      required this.directoryName,
      required this.url,
      required this.category,
      required this.categoryName,
      required this.boardName});
  final int categoryOrder;
  final String directoryName;
  final String url;
  final int category;
  final String categoryName;
  final String boardName;

  factory FiveChBoardJsonData.fromJson(Map<String, dynamic> json) =>
      _$FiveChBoardJsonDataFromJson(json);
}

// @JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class FiveChCategoryData extends BoardData {
  const FiveChCategoryData(
      {required super.id,
      required super.name,
      required super.forum,
      required this.categoryNumber,
      required this.categoryContent});
  final String categoryNumber;
  final List<BoardData> categoryContent;

  @override
  bool get isCategory => true;

  @override
  List<BoardData> get childrenBoards => categoryContent;

  // factory FiveChCategoryData.fromJson(Map<String, dynamic> json) =>
  //     _$FiveChCategoryDataFromJson(json);

  // Map<String, dynamic> toJson() => _$FiveChCategoryDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class FiveChBoardData extends BoardData {
  const FiveChBoardData({
    required super.id,
    required super.name,
    required super.forum,
    required this.url,
    required this.category,
    required this.categoryOrder,
    required this.categoryNameStr,
    required this.directoryName,
  });
  final int categoryOrder;
  final String directoryName;
  final String url;
  final int category;
  final String categoryNameStr;

  @override
  String get categoryName => categoryNameStr;

  String? get domain {
    // return Uri.parse(url).host;
    final replaced = url.replaceFirst('https://', '');
    final domain = replaced.substring(0, replaced.indexOf('/'));
    return domain;
  }

  String? get subdomain {
    return FiveChData.subdomainFromUrl(url);
  }

  factory FiveChBoardData.fromJson(Map<String, dynamic> json) =>
      _$FiveChBoardDataFromJson(json);

  Map<String, dynamic> toJson() => _$FiveChBoardDataToJson(this);
}

@CopyWith()
@immutable
class FiveChThreadTitleData extends ThreadData with WithDateTime {
  const FiveChThreadTitleData(
      {required super.id,
      required super.title,
      required super.resCount,
      // required super.lastIndex,
      required this.filesize,
      required this.permission,
      required this.lastmodifyNum,
      required this.domain,
      required super.boardId,
      required super.type,
      required super.url,
      // super.difference,
      super.boardName,
      super.isNewPost,
      required super.updateAtStr});
  final int filesize;
  final String permission;
  final int lastmodifyNum;
  final String domain;
  // final String boardId;

  // String get datId {
  //   return '$id.dat';
  // }

  @override
  int? get createdAt => int.tryParse(id);

  @override
  String? get thumbnailUrl => null;

  @override
  DateTime? get dateTime {
    final datetime = int.tryParse(id) ?? 0;
    // logger.d('datetime: machi: $datetime, id: $id');
    return DateTime.fromMillisecondsSinceEpoch(datetime * 1000);
  }
  // @override
  // DateTime? get dateTime =>
  //     DateTime.fromMillisecondsSinceEpoch(int.tryParse(id) ?? 0);

  @override
  double get ikioi {
    // final current = DateTime.now().millisecondsSinceEpoch * 0.001;
    // // final createdNum = datId.substring(0, datId.length - 4);
    // final created = int.tryParse(id) ?? 0;
    // final diviDay = ((current - created) / 86400);
    // final result = resCount / diviDay;
    // // logger.d(
    // //     'ikioi: $result, resCount:$resCount, current:$current, datId:$datId, created:$createdNum, diviDay:$diviDay');
    // return double.tryParse(result.toStringAsFixed(2)) ?? 0;
    return getIkioi(int.tryParse(id) ?? 0, resCount);
  }
}

@JsonSerializable()
@CopyWith()
@immutable
class FiveChThreadContentData extends ContentData with WithDateTime {
  const FiveChThreadContentData(
      {required super.forum,
      required super.index,
      required super.name,
      this.email,
      required this.dateAndId,
      required super.body,
      super.title,
      super.urlSet,
      required this.domain,
      required this.directoryName,
      super.userId});
  // final String name;
  final String? email;
  final String dateAndId;
  // final String? title;
  final String domain;
  final String directoryName;
  // final String? userId;
  // final List<String?>? urlSet;

  @override
  DateTime? get createdAt {
    try {
      final splited = dateAndId.split(' ');
      if (splited.length >= 2) {
        return getDateTime(splited[0], splited[1]);
      }
    } catch (e) {
      logger.e('5ch: createdAt: $e');
    }
    return null;
  }

  @override
  String? get getPostId {
    final splited = dateAndId.split(' ');
    if (splited.length > 2) {
      final id = splited[2];
      final subtring = id.length > 3 ? id.substring(3) : '';
      // if(subtring.endsWith('●'))
      // logger.d('getId: splited: $splited, id:$id, sub:$subtring');
      if (subtring == '???' || subtring.isEmpty) {
        return null;
      }

      return subtring;
    }
    return null;
  }

  String? get getUserTrip => FiveChData.getTrip(name);

  @override
  String? get getUserName => FiveChData.getUserName(name);

  @override
  String? get getUserId {
    final index = name.indexOf('(ﾜｯﾁｮｲ');
    // final endIndex = name.lastIndexOf(')');
    if (index != -1) {
      return name.substring(index);
    }
    // if (splited.length >= 2) {
    //   final result = splited.firstWhere((element) => element.contains('ﾜｯﾁｮｲ'),
    //       orElse: () => '');
    //   if (result.isNotEmpty) {
    //     return result;
    //   }
    // }
    return null;
  }

  @override
  Set<String?> get anchorList {
    final list = RegExp(r'>>[0-9]+').allMatches(body).toSet();
    // logger.d('anchor: ${list}');
    return list.map((e) => e.group(0)).toSet();
  }

  @override
  Uri? get avatarUri {
    if (email == null) {
      return null;
    }
    final data = Uri.tryParse(email!);
    if (data == null) {
      return null;
    }
    if (UrlParser.getType(email) == MediaTypeList.image) {
      return data;
    }
    return null;
  }

  factory FiveChThreadContentData.fromJson(Map<String, dynamic> json) =>
      _$FiveChThreadContentDataFromJson(json);
  Map<String, dynamic> toJson() => _$FiveChThreadContentDataToJson(this);
}

class FiveChBoardNames {
  static String? getById(final String? id) {
    switch (id) {
      case 'bbynamazu':
        return '地震headline';
      case 'namazuplus':
        return '地震速報';
      case 'eq':
        return '臨時地震';
      case 'eqplus':
        return '臨時地震+';
      case 'lifeline':
        return '緊急自然災害';
      case 'mlb':
        return '野球総合';
      case 'base':
        return 'プロ野球';
      case 'livebase':
        return '野球ch';
      case 'soccer':
        return '国内サッカー';
      case 'football':
        return '海外サッカー';
      case 'sumo':
        return '相撲';
      case 'newsplus':
        return 'ニュース速報+';
      case 'mnewsplus':
        return '芸スポ速報+';
      case 'livegalileo':
        return 'なんでも実況G';
      case 'livejupiter':
        return 'なんでも実況J';
      case 'news4vip':
        return 'ニュー速VIP';
      case 'poverty':
        return 'ニュー速(嫌儲)';
      case 'news':
        return 'ニュース速報';
// case 'lifeline': return '緊急自然災害';
// case 'eq': return '臨時地震';
      case 'telework':
        return 'テレワーク';
// case 'lifeline': return '緊急自然災害';
// case  'eq': return '臨時地震';
      case 'be':
        return '面白ネタnews';
      case 'nandemo':
        return 'なんでも質問';
      case 'argue':
        return '朝生';
      case 'bbynews':
        return '速報headline';
      case 'NONE':
        return '2NN+';
// case 'news': return 'ニュース速報';
      case 'nagaraplus':
        return 'ニュース速報+(動画)';
// case 'newsplus': return 'ニュース速報+';
      case 'fakenews':
        return 'ニュース速報(嘘)';
      case 'fakenewsplus':
        return 'ニュース速報(嘘)+';
      case 'chinasmog':
        return '中国スモッグ(PM2.5)';
      case 'news2':
        return 'ニュース議論';
      case 'liveplus':
        return 'ニュース実況+';
// case 'mnewsplus': return '芸スポ速報+';
      case 'musicnews':
        return '芸能音楽速報';
      case 'idolplus':
        return 'アイドルニュース+';
      case 'seijinewsplus':
        return '政治ニュース+';
      case 'news4plus':
        return '東アジアnews+';
      case 'news4plusd':
        return 'アジア速報+';
      case 'asia':
        return 'ニュース極東';
      case 'bizplus':
        return 'ビジネスnews+';
      case 'ticketplus':
        return 'イベントnews+';
      case 'scienceplus':
        return '科学ニュース+';
      case 'snsplus':
        return 'SNSニュース+';
      case 'wildplus':
        return '元気ニュース+';
      case 'femnewsplus':
        return 'ローカルnews+';
      case 'dqnplus':
        return '痛いニュース+';
      case 'moeplus':
        return '萌えニュース+';
      case 'comicnews':
        return 'アニメ漫画速報';
      case 'gamenews':
        return 'ゲーム速報';
      case 'pcnews':
        return 'PCニュース';
      case 'owabiplus':
        return 'お詫び+';
      case 'trafficinfo':
        return '交通情報';
// case 'lifeline': return '緊急自然災害';
      case 'news7':
        return '私のニュース';
      case 'archives':
        return '懐かしニュース';
      case 'bakanews':
        return 'バカニュース';
      case 'editorial':
        return '社説';
      case 'editorialplus':
        return '社説+';
      case 'wikileaks':
        return 'WikiLeaks';
      case 'kokusai':
        return '国際情勢';
      case 'war':
        return '戦争・国防';
// case 'news4plus': return '東アジアnews+';
// case 'asia': return 'ニュース極東';
// case 'news4plusd': return 'アジア速報+';
      case 'news5':
        return 'イスラム情勢';
      case 'iraq':
        return 'イラク情勢';
      case 'africa':
        return 'アフリカ情勢';
      case 'europa':
        return '欧州・CIS情勢';
      case 'news5plus':
        return 'ニュース国際+';
      case 'dejima':
        return 'dejima';
      case 'entrance':
        return 'ラウンジ';
      case 'entrance2':
        return 'ﾗｳﾝｼﾞｸﾗｼｯｸ';
      case 'qa':
        return '初心者の質問';
      case 'pcqa':
        return 'PC初心者';
      case 'wiki':
        return '5chプロジェクト';
      case 'susucoin':
        return 'すすコイン';
      case 'goods':
        return 'グッズリスト';
      case 'gline':
        return 'ガイドライン';
      case 'event':
        return 'イベント企画';
      case 'operate':
        return '運用情報';
      case 'operatex':
        return '運用情報臨時';
      case 'sec2ch':
        return '規制情報';
      case 'sec2chd':
        return '規制議論';
      case 'saku2ch':
        return '削除要請';
      case 'saku':
        return '削除整理';
      case 'sakud':
        return '削除議論';
      case 'sakkb':
        return '削除知恵袋';
      // case 'entrance':
      //   return 'ラウンジ';
      // case 'entrance2':
      //   return 'ﾗｳﾝｼﾞｸﾗｼｯｸ';
      // case 'qa':
      //   return '初心者の質問';
      // case 'pcqa':
      //   return 'PC初心者';
      // case 'wiki':
      //   return '5chプロジェクト';
      // case 'susucoin':
      //   return 'すすコイン';
      // case 'goods':
      //   return 'グッズリスト';
      // case 'event':
      //   return 'イベント企画';
      case '2chse':
        return '証券取引所';
      case 'rank':
        return 'いろいろランク';
      case 'dataroom':
        return '資料室';
      case 'vote':
        return '投票所';
      case 'intro':
        return '自己紹介';
      case 'honobono':
        return 'ほのぼの';
      case 'yume':
        return '夢・独り言';
      case 'offmatrix':
        return '大規模OFF';
      case 'offreg':
        return '定期OFF';
      case 'offevent':
        return '突発OFF';
      case 'aasaloon':
        return 'AAサロン';
      case 'mona':
        return 'モナー';
      case 'nida':
        return 'ニダー';
      case 'aastory':
        return 'AA長編';
      case 'kao':
        return '顔文字';
      case 'covid19':
        return 'COVID-19';
      case 'mass':
        return 'マスコミ';
      case 'youth':
        return '少年犯罪';
      case 'disaster':
        return '自然災害';
      case '119':
        return '消防救急防災';
      case 'gender':
        return '男性論女性論';
      case 'giin':
        return '議員・選挙';
      case 'manifesto':
        return '政治家語録';
      case 'police':
        return '警察';
      case 'court':
        return '裁判・司法';
      case 'saibanin':
        return '裁判員制度';
      case 'soc':
        return '社会・世評';
      case 'atom':
        return '環境・電力';
      case 'energy':
        return 'エネルギー';
      case 'river':
        return '河川・ダム等';
      case 'traf':
        return '運輸・交通';
      case 'way':
        return '道路・高速道路';
      case 'forex':
        return '外為';
      case 'venture':
        return 'ベンチャー';
      case 'manage':
        return '経営学';
      case 'management':
        return '店舗運営';
      case 'estate':
        return '賃貸不動産';
      case 'koumu':
        return '公務員';
      case 'shikaku':
        return '法律勉強相談';
      case 'lic':
        return '資格全般';
      case 'haken':
        return '派遣業界';
      case 'hoken':
        return '保険業界';
      case 'tax':
        return '税金経理会計';
      case 'exam':
        return '会計全般試験';
      case 'hosp':
        return '病院・医者';
      case 'bio':
        return '医療業界';
      case 'hikari':
        return '光通信';
      case 'dtp':
        return 'DTP・印刷';
      case 'part':
        return 'アルバイト';
      case 'koukoku':
        return '広告業界';
      case 'agri':
        return '農林水産業';
      case 'build':
        return '建設住宅業界';
      case 'industry':
        return '製造業界';
      case 'peko':
        return '食品業界・問題';
      case 'company':
        return 'ちくり裏事情';
      case 'bouhan':
        return '防犯・詐欺対策';
      case 'antispam':
        return '架空請求・spam';
      case 'ihan':
        return '違反の潰し方';
      case 'hokkaido':
        return '北海道';
      case 'tohoku':
        return '東北';
      case 'kousinetu':
        return '北陸・甲信越';
      case 'kanto':
        return '関東';
      case 'tokyo':
        return '東京';
      case 'tama':
        return '多摩';
      case 'kana':
        return '神奈川';
      case 'tokai':
        return '東海';
      case 'kinki':
        return '近畿';
      case 'osaka':
        return '大阪';
      case 'chugoku':
        return '中国';
      case 'sikoku':
        return '四国';
      case 'kyusyu':
        return '九州';
      case 'okinawa':
        return '沖縄';
      case 'expo':
        return '万博・地方博';
      case 'subcal':
        return 'サブカル';
      case 'bun':
        return '創作文芸';
      case 'mitemite':
        return '創作発表';
      case 'poem':
        return '詩・ポエム';
      case 'rongo':
        return '名言・格言';
      case 'movie':
        return '映画一般・8mm';
      case 'cinema':
        return '映画作品・人';
      case 'endroll':
        return '映画人';
      case 'rmovie':
        return '懐かし邦画';
      case 'kinema':
        return '懐かし洋画';
      case 'netflix':
        return 'Netflix';
      case 'hulu':
        return 'フールー';
      case 'occult':
        return 'オカルト';
      case 'kaidan':
        return '創作怪談';
      case 'esp':
        return '超能力';
      case 'sfx':
        return '特撮！';
      case 'rsfx':
        return '昭和特撮';
      case 'drama':
        return '演劇・舞台役者';
      case 'siki':
        return '宝塚・四季';
      case 'fortune':
        return '占い';
      case 'uranai':
        return '占術理論実践';
      case 'kyoto':
        return '神社・仏閣';
      case 'gallery':
        return '美術鑑賞';
      case 'rakugo':
        return '伝統芸能';
      case 'ruins':
        return '世界遺産';
      case 'cyberpunk':
        return 'サイバーパンク';
      case 'emperor':
        return '皇室・王侯貴族';
      case 'spiritual':
        return 'スピリチュアル';
      case 'rikei':
        return '理系全般';
      case 'sci':
        return '物理';
      case 'life':
        return '生物';
      case 'bake':
        return '化学';
      case 'kikai':
        return '機械・工学';
      case 'denki':
        return '電気・電子';
      case 'robot':
        return 'ロボット技術';
      case 'infosys':
        return '情報システム';
      case 'informatics':
        return '情報学';
      case 'sim':
        return 'シミュレート';
      case 'nougaku':
        return '農学';
      case 'sky':
        return '天文・気象';
      case 'galileo':
        return '宇宙';
      case 'doctor':
        return '医歯薬看護';
      case 'kampo':
        return '東洋医学';
      case 'math':
        return '数学';
      case 'doboku':
        return '土木・建築';
      case 'material':
        return '材料物性';
      case 'space':
        return '航空・船舶';
      case 'future':
        return '未来技術';
      case 'wild':
        return '野生動物';
      case 'plants':
        return '植物';
      case 'goldenfish':
        return '日本の淡水魚・金魚';
      case 'insect':
        return '昆虫・節足動物';
      case 'earth':
        return '地球科学';
      case 'psycho':
        return '心理学';
      case 'gengo':
        return '言語学';
      case 'dialect':
        return '方言';
      case 'pedagogy':
        return '教育学';
      case 'sociology':
        return '社会学';
      case 'economics':
        return '経済学';
      case 'book':
        return '文学';
      case 'poetics':
        return '詩文学';
      case 'history':
        return '日本史';
      case 'history2':
        return '日本近代史';
      case 'whis':
        return '世界史';
      case 'archeology':
        return '考古学';
      case 'min':
        return '民俗・神話学';
      case 'kobun':
        return '古文・漢文';
      case 'english':
        return 'ENGLISH';
      case 'usa':
        return 'アメリカ';
      case 'korea':
        return 'ハングル';
      case 'china':
        return '中国';
      case 'taiwan':
        return '台湾';
      case 'myanmar':
        return 'ミャンマー';
      case 'yangon':
        return 'ヤンゴン';
      case 'geo':
        return '地理・人類学';
      case 'chiri':
        return '地理お国自慢';
      case 'gogaku':
        return '外国語';
      case 'art':
        return '芸術デザイン';
      case 'philo':
        return '哲学';
      case 'jurisp':
        return '法学';
      case 'shihou':
        return '司法試験';
      case 'kaden':
        return '家電製品';
      case 'wm':
        return 'ポータブルAV';
      case 'vcamera':
        return 'ビデオカメラ';
      case 'bakery':
        return '調理家電';
      case 'toilet':
        return 'シャワートイレ';
      case 'sony':
        return 'ソニー';
      case 'apple2':
        return 'Apple';
      case 'phs':
        return '携帯・ＰＨＳ';
      case 'keitai':
        return '携帯機種';
      case 'spsaloon':
        return 'スマホサロン';
      case 'smartphone':
        return 'スマートフォン';
      case 'ios':
        return 'iOS';
      case 'iPhone':
        return 'iOSゲーム';
      case 'android':
        return 'Android';
      case 'chakumelo':
        return '携帯コンテンツ';
      case 'appli':
        return '携帯電話ゲー';
      case 'applism':
        return 'スマホアプリ';
      case 'dgoods':
        return 'デジタルモノ';
      case 'camera':
        return 'カメラ';
      case 'dcamera':
        return 'デジカメ';
      case 'av':
        return 'AV機器';
      case 'pav':
        return 'ピュアAU';
      case 'battery':
        return '電池等';
      case 'seiji':
        return '政治';
      case 'diplomacy':
        return '外交政策';
      case 'trafficpolicy':
        return '交通政策';
      case 'eco':
        return '経済';
      case 'stock':
        return '株式';
      case 'stockb':
        return '株個別銘柄';
      case 'market':
        return '投資一般';
      case 'livemarket1':
        return '市況1';
      case 'livemarket2':
        return '市況2';
      case 'deal':
        return '先物';
      case 'koumei':
        return '創価・公明';
      case 'kyousan':
        return '共産党';
      case 'sisou':
        return '政治思想';
      case 'kova':
        return 'ゴーマニズム';
      case 'money':
        return '金融';
      case 'food':
        return '食べ物';
      case 'candy':
        return 'お菓子';
      case 'juice':
        return 'ソフトドリンク';
      case 'pot':
        return 'お茶・珈琲';
      case 'cook':
        return '料理';
      case 'okome':
        return '米・米加工品';
      case 'yasai':
        return '野菜・果物';
      case 'kinoko':
        return 'きのこ';
      case 'takenoko':
        return 'たけのこ';
      case 'salt':
        return '調味料';
      case 'ramen':
        return 'ラーメン';
      case 'nissin':
        return 'インスタント麺';
      case 'jnoodle':
        return 'そば・うどん';
      case 'sushi':
        return 'おすし';
      case 'don':
        return '丼';
      case 'curry':
        return 'カレー';
      case 'bread':
        return 'パン';
      case 'pasta':
        return 'パスタ・ピザ';
      case 'kbbq':
        return '焼肉';
      case 'konamono':
        return 'たこ焼き等';
      case 'toba':
        return '珍味';
      case 'gurume':
        return 'グルメ外食';
      case 'famires':
        return 'ファミレス';
      case 'jfoods':
        return 'Ｂ級グルメ';
      case 'bento':
        return '弁当・駅弁';
      case 'sake':
        return 'お酒・Bar';
      case 'wine':
        return 'ワイン';
      case 'beer':
        return 'ビール';
      case 'drunk':
        return '居酒屋';
      case 'recipe':
        return 'レシピ';
      case 'patissier':
        return '製菓・製パン';
      case 'supplement':
        return '健康食・サプリ';
      case 'vegetarian':
        return 'ベジタリアン';
      case 'lifesaloon':
        return '生活サロン';
      case 'kankon':
        return '生活全般';
      case 'okiraku':
        return 'その日暮らし';
      case 'homealone':
        return '一人暮らし';
      case 'countrylife':
        return '田舎暮らし';
      case 'debt':
        return '借金生活';
      case 'inpatient':
        return '入院生活';
      // case 'telework':
      //   return 'テレワーク';
      case 'sportsclub':
        return 'スポーツクラブ';
      case 'bath':
        return 'お風呂・銭湯';
      case 'era':
        return '元号';
      case 'anniversary':
        return '記念日';
      case 'sousai':
        return '冠婚葬祭';
      case 'baby':
        return '育児';
      case 'kagu':
        return '家具';
      case 'diy':
        return 'DIY';
      case 'diary':
        return '日記';
      case 'shop':
        return '通販・買い物';
      case 'hcenter':
        return '家電等量販店';
      case 'used':
        return '中古リサイクル';
      case 'rental':
        return 'レンタル';
      case 'trend':
        return '流行';
      // case 'ticketplus':
      //   return 'Walker+';
      case 'model':
        return 'モデル';
      case 'fashion':
        return 'ファッション';
      case 'underwear':
        return '下着';
      case 'shoes':
        return '靴';
      case 'female':
        return '化粧';
      case 'diet':
        return '美容';
      case 'mensbeauty':
        return '男の美容・化粧';
      case 'aroma':
        return '香水芳香消臭';
      case 'seikei':
        return '美容整形';
      case 'shapeup':
        return 'ダイエット';
      case 'world':
        return '一般海外生活';
      case 'northa':
        return '北米海外生活';
      case 'credit':
        return 'クレジット';
      case 'point':
        return 'ポイント・マイル';
      case 'cafe30':
        return '３０代';
      case 'cafe40':
        return '４０代';
      case 'cafe50':
        return '５０代以上';
      case 'cafe60':
        return '６０歳以上';
      case 'live':
        return '家庭';
      case 'souji':
        return '掃除全般';
      case 'goki':
        return '害虫害獣対策';
      case 'radiation':
        return '放射能';
      case 'kechi2':
        return 'ドケチ';
      case 'chance':
        return '懸賞';
      case 'cigaret':
        return 'たばこ';
      case 'megane':
        return 'めがね';
      case 'yuusen':
        return 'マイライン';
      case 'conv':
        return 'コンビニ';
      case 'sale':
        return 'バーゲン';
      case 'stationery':
        return '文房具';
      case 'class':
        return '習い事';
      case 'shar':
        return '新シャア専用';
      case 'x3':
        return '旧シャア専用';
      case 'denpa':
        return '電波・お花畑';
      case 'owarai':
        return 'お笑い小咄';
      case '2chbook':
        return '同人ノウハウ';
      case 'uwasa':
        return '噂話';
      case 'charaneta':
        return 'キャラネタ';
      case 'charaneta2':
        return 'なりきりネタ';
      case 'mascot':
        return 'マスコットキャラ';
      case 'senji':
        return '戦時';
      case 'lovesaloon':
        return '恋愛サロン';
      case 'ex':
        return 'カップル';
      case 'x1':
        return '×１';
      case 'gaysaloon':
        return '同性愛サロン';
      case 'nohodame':
        return 'のほほんダメ';
      case 'dame':
        return '無職・だめ';
      case 'loser':
        return '負け組';
      case 'hikky':
        return 'ヒッキー';
      case 'mental':
        return 'メンヘルサロン';
      case 'single':
        return '独身貴族';
      case 'wom':
        return '女性';
      case 'sfe':
        return '独身女性限定';
      case 'wmotenai':
        return 'もてない女';
      case 'ms':
        return '既婚女性';
      case 'male':
        return '独身男性';
      case 'motetai':
        return 'もてたい男';
      case 'motenai':
        return 'モテない男性';
      case 'alone':
        return '孤独な男性';
      case 'tomorrow':
        return '既婚男性';
      case 'employee':
        return 'リーマン';
      case 'campus':
        return '大学生活';
      case 'student':
        return '大学学部・研究';
      case 'otaku':
        return 'おたく';
      case 'nendai':
        return '年代別';
      case 'sepia':
        return 'セピア';
      case 'gag':
        return '駄洒落';
      case '575':
        return 'しりとり';
      case 'tanka':
        return '五七五・短歌';
      case '4649':
        return 'アウトロー';
      case 'hidari':
        return '左利き';
      case 'bbylive':
        return '実況headline';
      case 'bbylivej':
        return 'なんJヘッドライン';
      // case 'livegalileo':
      //   return 'なんでも実況G';
      case 'livemars':
        return 'なんでも実況M';
      case 'livesaturn':
        return 'なんでも実況S';
      case 'livevenus':
        return 'なんでも実況V';
      // case 'livejupiter':
      //   return 'なんでも実況J';
      case 'liveuranus':
        return 'なんでも実況U';
      case 'endless':
        return '実況ch';
      case 'weekly':
        return '番組ch';
      case 'livewar':
        return '戦場実況';
      case 'livefield':
        return '現場実況';
      case 'liveelection':
        return '選挙実況';
      case 'livewkwest':
        return '番組ch(西日本)';
      case 'livenhk':
        return '番組ch(NHK)';
      case 'liveetv':
        return '番組ch(教育)';
      case 'liventv':
        return '番組ch(NTV)';
      case 'livetbs':
        return '番組ch(TBS)';
      case 'livecx':
        return '番組ch(フジ)';
      case 'liveanb':
        return '番組ch(朝日)';
      case 'livetx':
        return '番組ch(TX)';
      case 'livemx':
        return '番組ch(MX)';
      case 'liveabema':
        return '番組ch(アベマ)';
      case 'livebs':
        return 'BS実況(NHK)';
      case 'livebs2':
        return 'BS実況(無料)';
      case 'livewowow':
        return 'BS実況(有料)';
      case 'liveskyp':
        return 'スカパー実況';
      case 'liveradio':
        return 'ラジオ実況';
      case 'liveanime':
        return 'アニメ特撮実況';
      case 'kokkai':
        return '議会選挙実況';
      case 'dome':
        return 'スポーツch';
      // case 'livebase':
      //   return '野球ch';
      case 'livefoot':
        return 'サッカーch';
      case 'oonna':
        return '五輪実況(女)';
      case 'ootoko':
        return '五輪実況(男)';
      case 'dancesite':
        return '芸能ch';
      case 'festival':
        return 'お祭りch';
      case 'jasmine':
        return 'streaming実況';
      case 'liveanarchy':
        return 'Anarchy実況';
      case 'livesangyou':
        return '三行実況';
      case 'liveyonmoji':
        return '四字実況';
      // case 'livemarket1':
      //   return '市況1';
      // case 'livemarket2':
      //   return '市況2';
      case 'livecoin':
        return '仮想通貨実況';
      case 'edu':
        return '教育・先生';
      case 'jsaloon':
        return '大学受験サロン';
      case 'kouri':
        return '大学受験';
      case 'juku':
        return '学習塾・予備校';
      case 'ojyuken':
        return 'お受験';
      case 'senmon':
        return '専門学校';
      case 'design':
        return '美術系学校';
      case 'musicology':
        return '音楽系学校';
      case 'govexam':
        return '公務員試験';
      case 'hobby':
        return '趣味一般';
      case 'magic':
        return '手品・曲芸';
      case 'puzzle':
        return 'パズル';
      case 'craft':
        return 'ハンドクラフト';
      case 'toy':
        return 'おもちゃ';
      case 'zoid':
        return 'ゾイド';
      case 'watch':
        return '時計・小物';
      case 'smoking':
        return '煙草銘柄・器具';
      case 'knife':
        return '刃物';
      case 'doll':
        return 'お人形';
      case 'engei':
        return '園芸';
      case 'dog':
        return '犬猫大好き';
      case 'pet':
        return 'ペット大好き';
      case 'aquarium':
        return 'アクアリウム';
      case 'army':
        return '軍事';
      case 'radio':
        return '無線';
      case 'mokei':
        return '模型・プラモ';
      case 'radiocontrol':
        return 'RC（ラジコン)';
      case 'gun':
        return 'サバゲー';
      case 'fireworks':
        return '花火';
      case 'warhis':
        return '三国志・戦国';
      case 'chinahero':
        return '中国英雄';
      case 'sengoku':
        return '戦国時代';
      case 'nanminhis':
        return '歴史難民';
      case 'dance':
        return 'ダンス';
      case 'yoga':
        return 'ヨガ';
      case 'bird':
        return '野鳥観察';
      case 'collect':
        return 'コレクション';
      case 'photo':
        return '写真撮影';
      case 'oekaki':
        return 'お絵描き';
      case 'bike':
        return 'バイク';
      case 'motorbike':
        return 'バイク車種ﾒｰｶｰ';
      case 'car':
        return '車';
      case 'kcar':
        return '軽自動車';
      case 'auto':
        return '車種・車メーカー';
      case 'usedcar':
        return '中古車';
      case 'truck':
        return '大型・特殊車両';
      case 'train':
        return '鉄道総合';
      case 'rail':
        return '鉄道路線・車両';
      case 'jnr':
        return '鉄道懐かし';
      case 'ice':
        return '鉄道(海外)';
      case 'gage':
        return '鉄道模型';
      case 'bus':
        return 'バス・バス路線';
      case 'airline':
        return 'エアライン';
      case 'sposaloon':
        return 'スポーツサロン';
      case 'sports':
        return 'スポーツ';
      case 'rsports':
        return '懐かしスポーツ';
      case 'stadium':
        return 'スポーツ施設';
      case 'athletics':
        return '陸上競技';
      case 'gymnastics':
        return '体操・新体操';
      case 'muscle':
        return 'ウエイトトレ';
      case 'noroma':
        return '運動音痴';
      case 'wsports':
        return '冬スポーツ';
      case 'ski':
        return 'スキースノボ';
      case 'skate':
        return 'スケート';
      case 'swim':
        return '水泳';
      case 'msports':
        return 'マリンスポーツ';
      case 'boat':
        return '船スポーツ';
      case 'birdman':
        return '空スポーツ';
      case 'fish':
        return '釣り';
      case 'bass':
        return 'バス釣り';
      case 'bicycle':
        return '自転車';
      case 'equestrian':
        return '乗馬・馬術';
      case 'f1':
        return 'ﾓｰﾀｰｽﾎﾟｰﾂ';
      case 'olympic':
        return 'オリンピック';
      case 'bullseye':
        return '的スポーツ';
      case 'parksports':
        return '公園スポーツ';
      case 'amespo':
        return 'アメスポ';
      case 'cheerleading':
        return 'チア';
      case 'xsports':
        return 'xsports';
      case 'esports':
        return 'eスポーツ';
      // case 'base':
      //   return 'プロ野球';
      case 'npb':
        return '球界改革議論';
      case 'meikyu':
        return '野球殿堂';
      // case 'mlb':
      //   return '野球総合';
      case 'hsb':
        return '高校野球';
      case 'kyozin':
        return 'アンチ球団';
      // case 'soccer':
      //   return '国内サッカー';
      case 'eleven':
        return '日本代表蹴球';
      case 'wc':
        return 'ワールドカップ';
      // case 'football':
      //   return '海外サッカー';
      case 'basket':
        return 'バスケット';
      case 'tennis':
        return 'テニス';
      case 'volley':
        return 'バレーボール';
      case 'ovalball':
        return 'ラグビー';
      case 'pingpong':
        return '卓球';
      case 'gutter':
        return 'ボウリング';
      case 'golf':
        return 'ゴルフ';
      case 'billiards':
        return 'ビリヤード';
      case 'ballgame':
        return 'その他球技';
      case 'k1':
        return '格闘技';
      case 'wres':
        return 'プロレス';
      case 'budou':
        return '武道・武芸';
      case 'boxing':
        return 'ボクシング';
      case 'sumou':
        return '相撲';
      case 'jyudo':
        return '伝統武術';
      case 'mma':
        return 'MMA';
      case 'oversea':
        return '海外旅行';
      case 'travel':
        return '国内旅行';
      case 'hotel':
        return 'ホテル･旅館';
      case 'localfoods':
        return '土産物・特産物';
      case 'tropical':
        return 'トロピカル';
      case 'onsen':
        return '温泉';
      case 'park':
        return '遊園地';
      case 'zoo':
        return '動物園・水族館';
      case 'museum':
        return '博物館・美術館';
      case 'out':
        return '登山キャンプ';
      case 'hawaii':
        return 'ハワイ州';
      case 'sapa':
        return '道の駅';
      case 'tvsaloon':
        return 'テレビサロン';
      case 'kouhaku':
        return '年末年始番組';
      case 'tv':
        return 'テレビ番組';
      case 'natsutv':
        return '懐かしテレビ';
      case 'tvd':
        return 'テレビドラマ';
      case 'nhkdrama':
        return '大河ドラマ';
      case 'natsudora':
        return '懐かしドラマ';
      case 'kin':
        return '時代劇';
      case 'radiosaloon':
        return 'ラジオサロン';
      case 'am':
        return 'ラジオ番組';
      case 'rradio':
        return '懐かしラジオ';
      case 'tv2':
        return '海外テレビ';
      case 'hanryu':
        return '韓流';
      case 'cs':
        return 'ケーブル放送';
      case 'skyp':
        return 'スカパー';
      case 'bs':
        return 'デジタル放送';
      case 'nhk':
        return 'NHK';
      // case 'netflix':
      //   return 'Netflix';
      // case 'hulu':
      //   return 'フールー';
      case 'cm':
        return '広告・ＣＭ';
      case 'geino':
        return '芸能';
      case 'celebrity':
        return '海外芸能人';
      case '4sama':
        return 'アジアエンタメ';
      case 'kyon2':
        return '懐かし芸能人';
      case 'actor':
        return '男性俳優';
      case 'actress':
        return '女優';
      case 'geinin':
        return 'お笑い芸人';
      case 'ana':
        return 'アナウンサー';
      case 'ami':
        return 'あみ＆あゆ';
      case 'apple':
        return '椎名林檎';
      // case 'idolplus':
      //   return 'アイドルニュース+';
      case 'mendol':
        return '男性アイドル';
      case 'idol':
        return '女性アイドル';
      case 'ainotane':
        return 'モ娘（羊）';
      case 'zurui':
        return 'モ娘（鳩）';
      case 'morningcoffee':
        return 'モ娘（狼）';
      case 'momoclo':
        return 'ももクロ';
      case 'babymetal':
        return 'BABYMETAL';
      case 'exile':
        return 'EXILE';
      case 'smap':
        return 'スマップ';
      case 'jan':
        return 'ジャニーズ';
      case 'jr':
        return 'ジャニーズ２';
      case 'jr2':
        return 'ジャニーズJr';
      case 'akb48':
        return 'AKB48';
      case 'akbsaloon':
        return 'AKBサロン(表)';
      case 'uraidol':
        return 'AKBサロン(裏)';
      case 'world48':
        return '海外AKB48G';
      case 'nogizaka':
        return '乃木坂46';
      case 'keyakizaka46':
        return '欅坂46';
      case 'sakurazaka46':
        return '櫻坂46';
      case 'hinatazaka46':
        return '日向坂46';
      case 'ske':
        return 'SKE48';
      case 'sdn':
        return 'SDN48';
      case 'nmb':
        return 'NMB48';
      case 'hkt':
        return 'HKT48';
      case 'ngt':
        return 'NGT48';
      case 'stu':
        return 'STU48';
      case 'teamcrerekko':
        return 'くれれっ娘';
      case 'netidol':
        return 'ネットアイドル';
      case 'indieidol':
        return 'インディーアイドル';
      case 'ugidol':
        return '地下アイドル';
      case 'mj':
        return '麻雀・他';
      case 'pachi':
        return 'パチンコサロン';
      case 'pachij':
        return 'パチンコ店情報';
      case 'pachik':
        return 'パチンコ機種等';
      case 'slot':
        return 'スロットサロン';
      case 'slotj':
        return 'スロット店情報';
      case 'slotk':
        return 'スロット機種';
      case 'keiba':
        return '競馬';
      case 'uma':
        return '競馬２';
      case 'keirin':
        return '競輪';
      case 'kyotei':
        return '競艇';
      case 'autorace':
        return 'オートレース';
      case 'gamble':
        return 'ギャンブル';
      case 'loto':
        return '宝くじ';
      case 'bbygame1':
        return 'ゲームヘッドライン';
      case 'bbygame2':
        return 'ゲーム個別ヘッドライン';
      case 'bbygame3':
        return 'ゲーム総合ヘッドライン';
      case 'gsaloon':
        return 'ゲームサロン';
      // case 'gamenews':
      //   return 'ゲーム速報';
      case 'gameover':
        return '家ゲー攻略';
      case 'goveract':
        return '家ゲACT攻略';
      case 'goverrpg':
        return '家ゲRPG攻略';
      case 'gamesm':
        return 'スマホゲーム';
      case 'gamerpg':
        return '家ゲーRPG';
      case 'ff':
        return 'FF・ドラクエ';
      case 'gamesrpg':
        return '家ゲーSRPG';
      case 'gamerobo':
        return 'ロボットゲー';
      case 'gal':
        return 'ギャルゲー';
      case 'ggirl':
        return '女向ゲー一般';
      case 'gamespo':
        return 'スポーツ・RACE';
      case 'gamehis':
        return '歴史ゲーム';
      case 'otoge':
        return '音ゲー';
      case 'gamefight':
        return '格闘ゲーム';
      case 'gamestg':
        return 'シューティング';
      case 'gamef':
        return 'PCアクション';
      case 'touhou':
        return '東方project';
      case 'fly':
        return 'フライトシム';
      case 'famicom':
        return '家庭用ゲーム';
      case 'zgame':
        return '家ゲーZ区分';
      case 'retro':
        return 'レトロゲーム';
      case 'retro2':
        return '家ゲーレトロ';
      case 'game90':
        return 'レトロ32bit以上';
      case 'arc':
        return 'アーケード';
      case 'rarc':
        return 'アケゲーレトロ';
      case 'amusement':
        return 'メダル・プライズ';
      case 'gecen':
        return 'ゲーセン';
      case 'game':
        return 'PCゲーム';
      case 'gameama':
        return '同人ゲーム';
      case 'gameswf':
        return 'ブラウザゲーム';
      case 'cgame':
        return '卓上ゲーム';
      case 'tcg':
        return 'TCG';
      case 'bgame':
        return '将棋・チェス';
      case 'gamestones':
        return '囲碁・オセロ';
      case 'quiz':
        return 'クイズ雑学';
      case 'ghard':
        return 'ハード・業界';
      case 'hunter':
        return 'モンハン';
      case 'gameurawaza':
        return '裏技・改造';
      case 'gamechara':
        return 'ゲームキャラ';
      case 'gamemusic':
        return 'ゲーム音楽';
      case 'minecraft':
        return 'Minecraft';
      case 'aimasu':
        return 'アイドルマスター';
      case 'yugioh':
        return '遊戯王';
      case 'pokego':
        return 'ポケモンGO';
      case 'steam':
        return 'Steam';
      case 'card':
        return 'カードゲーム';
      case 'dccg':
        return 'デジタルカードゲーム';
      // case 'esports':
      //   return 'eスポーツ';
      case 'handygame':
        return '携帯ゲーソフト';
      case 'handygover':
        return '携帯ゲー攻略';
      case 'handygrpg':
        return '携帯ゲーRPG';
      case 'poke':
        return 'ポケモン';
      case 'wifi':
        return 'Wi-Fi';
      case 'rhandyg':
        return '携帯ゲーレトロ';
      case 'pokechara':
        return '携帯ゲーキャラ';
      case 'mmonews':
        return 'ネトゲ速報';
      case 'mmoqa':
        return 'ネトゲ質問';
      case 'ogame':
        return 'ネトゲ実況';
      case 'ogame2':
        return 'ネトゲ実況2';
      case 'ogame3':
        return 'ネトゲ実況3';
      case 'mmosaloon':
        return 'ネトゲサロン';
      case 'netgame':
        return 'ネットゲーム';
      case 'mmo':
        return '大規模MMO';
      case 'mmominor':
        return '小規模MMO';
      case 'pso':
        return 'PSO';
      case 'dqo':
        return 'DQO';
      case 'ffo':
        return 'FFO';
      // case 'comicnews':
      //   return 'アニメ漫画速報';
      case 'asaloon':
        return 'アニメサロン';
      case 'anime4vip':
        return 'アニメサロンex';
      case 'anime':
        return 'アニメ';
      case 'anime2':
        return 'アニメ２';
      case 'anime3':
        return 'アニメ新作情報';
      case 'antianime':
        return 'アニメアンチ';
      case 'ranime':
        return '懐アニ昭和';
      case 'ranimeh':
        return '懐アニ平成';
      case 'animovie':
        return 'アニメ映画';
      case 'anichara':
        return 'アニキャラ総合';
      case 'anichara2':
        return 'アニキャラ個別';
      case 'cosp':
        return 'コスプレ';
      case 'cosplayer':
        return 'コスプレイヤー';
      case 'voice':
        return '声優総合';
      case 'voiceactor':
        return '声優個人';
      case 'doujin':
        return '同人';
      case 'comiket':
        return '同人イベント';
      case 'csaloon':
        return '漫画サロン';
      case 'comic':
        return '漫画';
      case 'rcomic':
        return '懐かし漫画';
      case 'ymag':
        return '少年漫画';
      case 'wcomic':
        return '週刊少年漫画';
      case 'gcomic':
        return '少女漫画';
      case '4koma':
        return '４コマ漫画';
      case 'cchara':
        return '漫画キャラ';
      case 'sakura':
        return 'CCさくら';
      case 'eva':
        return 'エヴァ';
      case 'cartoon':
        return '海外アニメ漫画';
      case 'iga':
        return 'アニメ漫画業界';
      case 'bookall':
        return '文芸書籍サロン';
      case 'magazin':
        return 'ライトノベル';
      case 'mystery':
        return 'ミステリー';
      case 'sf':
        return 'SF・ﾌｧﾝﾀｼﾞｰ・ﾎﾗｰ';
      case 'litechara':
        return '小説・ラノベキャラ';
      case 'zassi':
        return '雑誌';
      case 'books':
        return '一般書籍';
      case 'ebooks':
        return '電子書籍';
      case 'ehon':
        return '絵本';
      case 'juvenile':
        return '児童書';
      case 'illustrator':
        return 'イラストレーター';
      case 'lovelive':
        return 'ラブライブ！';
      case 'idolmaster':
        return 'アイドルマスタ';
      // case 'yugioh':
      //   return '遊戯王';
      case 'magicalgirls':
        return '魔法少女';
      case 'chiikawa':
        return 'ちいかわ';
      // case 'musicnews':
      //   return '芸能音楽速報';
      case 'msaloon':
        return '音楽サロン';
      case 'mjsaloon':
        return '邦楽サロン';
      case 'musicj':
        return '邦楽';
      case 'musicjm':
        return '邦楽男性ソロ';
      case 'musicjf':
        return '邦楽女性ソロ';
      case 'musicjg':
        return '邦楽グループ';
      case 'natsumeloj':
        return '懐メロ邦楽';
      case 'enka':
        return '演歌';
      case 'mesaloon':
        return '洋楽サロン';
      case 'musice':
        return '洋楽';
      case 'natsumeloe':
        return '懐メロ洋楽';
      case 'music':
        return '音楽一般';
      case 'beatles':
        return 'ビートルズ';
      case 'visual':
        return 'ヴィジュサロン';
      case 'visualb':
        return 'ヴィジュバンド';
      case 'dj':
        return 'ＤＪ・クラブ';
      case 'disco':
        return 'ディスコ';
      case 'randb':
        return 'R&B・SOUL';
      case 'punk':
        return 'パンク';
      case 'hrhm':
        return 'HR・HM';
      case 'hiphop':
        return 'HIPHOP';
      case 'techno':
        return 'TECHNO';
      case 'progre':
        return 'プログレ';
      case 'healmusic':
        return 'ヒーリング音楽';
      case 'wmusic':
        return 'ワールド音楽';
      case 'reggae':
        return 'レゲエ';
      case 'classic':
        return 'ジャズ';
      case 'fusion':
        return 'フュージョン';
      case 'classical':
        return 'クラシック';
      case 'contemporary':
        return '現代音楽';
      case 'nika':
        return 'エレクトロニカ';
      case 'suisou':
        return '吹奏楽';
      case 'chorus':
        return '合唱';
      case 'doyo':
        return '童謡・唱歌';
      case 'asong':
        return 'アニソン等';
      case 'soundtrack':
        return 'サントラ';
      case 'karaok':
        return 'カラオケ';
      case 'legend':
        return '伝説の';
      case 'minor':
        return 'インディーズ';
      case 'band':
        return 'バンド';
      case 'compose':
        return '楽器・作曲';
      case 'piano':
        return '鍵盤楽器';
      case 'hogaku':
        return '純邦楽';
      case 'jinsei':
        return '人生相談';
      case 'psy':
        return '心と宗教';
      case 'body':
        return '身体・健康';
      case 'keihatsu':
        return '自己啓発';
      case 'stretch':
        return 'マッサージ等';
      case 'handicap':
        return 'ハンディキャップ';
      case 'cancer':
        return '癌・腫瘍';
      case 'nanbyou':
        return '難病';
      // case 'covid19':
      //   return 'COVID-19';
      case 'infection':
        return '新型感染症';
      case 'hiv':
        return 'HIVサロン';
      case 'atopi':
        return 'アトピー';
      case 'allergy':
        return 'アレルギー';
      case 'hage':
        return 'ハゲ・ズラ';
      case 'pure':
        return '純情恋愛';
      case 'furin':
        return '不倫・浮気';
      case 'gay':
        return '同性愛';
      case 'utu':
        return 'メンタルヘルス';
      case 'break':
        return '失恋';
      case 'bbymobile':
        return 'スマホヘッドライン';
      case 'pc2nanmin':
        return 'PCサロン';
      // case 'pcnews':
      //   return 'PCニュース';
      case 'win':
        return 'Windows';
      case 'jobs':
        return '旧・mac';
      case 'mac':
        return '新・mac';
      case 'os':
        return 'OS';
      case 'desktop':
        return 'デスクトップ';
      case 'pc':
        return 'パソコン一般';
      case 'notepc':
        return 'ノートPC';
      case 'jisaku':
        return '自作PC';
      case 'printer':
        return 'プリンタ';
      case 'hard':
        return 'ハードウェア';
      case 'cdr':
        return 'CD-R,DVD';
      case 'software':
        return 'ソフトウェア';
      case 'mobile':
        return 'モバイル';
      case 'bsoft':
        return 'ビジネスsoft';
      case 'unix':
        return 'UNIX';
      case 'db':
        return 'データベース';
      case 'linux':
        return 'Linux';
      case 'prog':
        return 'プログラマー';
      case 'tech':
        return 'プログラム';
      case 'cg':
        return 'ＣＧ';
      case 'dtm':
        return 'DTM';
      case 'avi':
        return 'DTV';
      case 'swf':
        return 'FLASH';
      case 'gamedev':
        return 'ゲ製作技術';
      case 'i4004':
        return '昔のPC';
      case 'internet':
        return 'インターネット';
      case 'download':
        return 'Download';
      case 'hp':
        return 'Web制作';
      case 'affiliate':
        return 'Web収入';
      case 'hosting':
        return 'レンタル鯖';
      case 'mysv':
        return '自宅サーバ';
      case 'php':
        return 'WebProg';
      case 'hack':
        return 'ネットワーク';
      case 'sec':
        return 'セキュリティ';
      case 'network':
        return '通信技術';
      case 'cryptocoin':
        return '仮想通貨板';
      case 'friend':
        return 'ポスペ・irc';
      case 'isp':
        return 'プロバイダー';
      case 'netspot':
        return 'ネットカフェ';
      // case 'telework':
      //   return 'テレワーク';
      case 'nifty':
        return 'Nifty';
      case 'google':
        return 'Google';
      case 'mmag':
        return 'メルマガ';
      case 'nanmin':
        return '難民';
      case 'ad':
        return '宣伝掲示板';
      case 'esite':
        return 'ネットサービス';
      case 'streaming':
        return 'YouTube';
      case 'mstreaming':
        return '携帯動画';
      case 'mdis':
        return '音楽配信';
      case 'netradio':
        return 'ネットラジオ等';
      case 'blog':
        return 'ブログ';
      case 'sns':
        return 'ソーシャルネット';
      case 'net':
        return 'ネットwatch';
      case 'twwatch':
        return 'ツイッター観察';
      case 'watchbakusai':
        return '爆サイ';
      case 'yahoo':
        return 'オークション';
      case 'nntp':
        return 'nntp';
      case 'starwars':
        return 'STARWARS';
      case 'bobby':
        return 'おいらロビー';
      case 'lobby':
        return 'ロビー';
      case 'maru':
        return '●';
      case 'mog2':
        return 'なんでもあり';
      case 'mukashi':
        return '昔';
      case 'kitchen':
        return '厨房！';
      case 'tubo':
        return '最悪';
      case 'joke':
        return '学歴';
      case 'shugi':
        return '主義・主張';
      case 'rights':
        return '人権問題';
      case 'anarchy':
        return 'Anarchy';
      case 'accuse':
        return '批判要望';
      // case 'morningcoffee':
      //   return 'モ娘（狼）';
      case 'ranking':
        return '格付け';
      case 'record':
        return '新記録・珍記録';
      case 'siberia':
        return 'シベリア超速報';
      // case 'news4vip':
      //   return 'ニュー速VIP';
      case 'news4viptasu':
        return 'ニュー速VIP+';
      // case 'poverty':
      //   return 'ニュー速(嫌儲)';
      case 'poverlution':
        return 'POVERLUTION';
      case 'news4anarchy':
        return 'ニュー速(Anarchy)';
      case 'heaven4vip':
        return '天国';
      case 'neet4vip':
        return 'ニー速';
      case 'aniki':
        return 'ガチホモ';
      case 'frenchfry':
        return 'ふれんちふらい';
      case 'anime8':
        return 'Anime & Manga';
      case 'book8':
        return 'Books';
      case 'carcom8':
        return 'Comics & Cartoons';
      case 'comp8':
        return 'Computers';
      case 'food8':
        return 'Food';
      case 'games8':
        return 'Video Games';
      case 'img8':
        return 'Imageboard Discussion';
      case 'lang8':
        return 'Foreign Language';
      case 'lounge8':
        return 'Lounge';
      case 'music8':
        return 'Music';
      case 'neet4vip8':
        return 'NEET';
      case 'vip8':
        return 'News for VIP';
      case 'newnew8':
        return 'World News';
      case 'newpol8':
        return 'Politics';
      case 'prog8':
        return 'Programming';
      case 'poverty8':
        return 'Revolution News';
      case 'sci8':
        return 'Science & Math';
      case 'sjis8':
        return 'SJIS Room';
      case 'sports8':
        return 'Sports';
      case 'tech8':
        return 'Technology';
      case 'tele8':
        return 'Television & Film';
      case 'bbyanarchy':
        return '荒野ヘッドライン';
      // case 'news4anarchy':
      //   return 'ニュー速(Anarchy)';
      case 'sugiuraayano':
        return 'ニュース速報(杉浦綾乃)';
      // case 'liveanarchy':
      //   return 'Anarchy実況';
      // case 'livesangyou':
      //   return '三行実況';
      // case 'anarchy':
      //   return 'Anarchy';
      case 'akari':
        return 'あかり';
      case 'hayabusa8tr':
        return '船見結衣';
      case 'matsumotorise':
        return '松本りせ';
      case 'gorakubu':
        return 'ごらく部';
      // case 'liveyonmoji':
      //   return '四字実況';
      // case 'oekaki':
      //   return 'お絵描き';
      case 'himawari':
        return '古谷向日葵';
      case 'hayabusa9tr':
        return '歳納京子';
      case 'mango':
        return 'MANGO';
      //  case 'NONE':
      // return 'TOPページ';
      case 'RONIN':
        return 'RONIN';
      case 'bbypinkH0':
        return '速報 | 実況ヘッドライン';
      case 'bbypinkH1':
        return '総合ヘッドライン';
      case 'bbypinkH2':
        return '二次ヘッドライン';
      case 'bbypinkH3':
        return '三次ヘッドライン';
      case 'bbypinkH4':
        return 'エロヘッドライン';
      case 'bbypinkH5':
        return '風俗ヘッドライン';
      case 'pinkplus':
        return 'PINKニュース+';
      case 'avplus':
        return 'AV+';
      case 'hnews':
        return 'ピンクニュース';
      case 'pinkj':
        return 'ピンクJ';
      case 'news4pink':
        return 'ニュース速報ピンク';
      case 'pinkqa':
        return 'pink初心者';
      case 'sureh':
        return 'スレH・エロ会話';
      case 'erolive':
        return '大人の実況';
      case 'xvideos':
        return 'XVIDEOS';
      case 'dmm':
        return 'DMM';
      case 'hneta':
        return 'えっちねた';
      case 'pinkcafe':
        return 'PINKのおいらロ';
      case 'eromog2':
        return 'PINKのなんでも';
      case 'ogefin':
        return 'お下品';
      case 'bishojo':
        return '美少女';
      case 'dere':
        return 'デレ全般';
      case '801saloon':
        return '801サロン';
      case 'pinknanmin':
        return 'ぴんく難民';
      case 'erobbs':
        return 'PINK運用情報';
      case 'housekeeping':
        return 'PINK削除依頼';
      case 'ccc':
        return 'PINK規制議論';
      case 'yama':
        return 'くノ一の山';
      case 'pinkkbkc':
        return 'PINK歌舞伎町';
      case 'pinksskn':
        return 'PINKすすきの';
      case 'pinkhkd':
        return 'PINK北海道';
      case 'pinkthk':
        return 'PINK東北';
      case 'pinkknt':
        return 'PINK関東';
      case 'pinktka':
        return 'PINK東海';
      case 'pinkkns':
        return 'PINK関西';
      case 'pinkhkr':
        return 'PINK北陸';
      case 'pinkcgk':
        return 'PINK中国';
      case 'pinkskk':
        return 'PINK四国';
      case 'pinkkys':
        return 'PINK九州';
      case 'pinkokn':
        return 'PINK沖縄';
      case '21oversea2':
        return '大人の海外';
      case 'hgame':
        return 'エロゲー';
      case 'hgame2':
        return 'エロゲー作品別';
      case 'erog':
        return 'エロゲネタ';
      case 'hgamechara':
        return 'エロゲキャラ個別';
      case 'leaf':
        return 'Leaf・key';
      case 'gagame':
        return '女向ゲー大人';
      case 'adultsite':
        return 'アダルトサイト';
      case 'webmaster':
        return 'ウェブマスター';
      case 'avideo':
        return 'AV総合';
      case 'avideo2':
        return 'AV女優';
      case 'debut':
        return 'AV新人';
      case 'nude':
        return 'ヌード・エロ本';
      case 'eroanime':
        return 'エロアニメ等';
      case 'erocomic':
        return 'エロ漫画小説';
      case 'erodoujin':
        return 'エロ同人';
      case 'natuero':
        return '懐かしエロ';
      case 'kgirls':
        return '韓国美人';
      case 'erocosp':
        return 'エロコスプレ';
      case 'butler':
        return '執事萌え';
      case 'maid':
        return 'メイド';
      case 'eroacademy':
        return 'PINKな学問';
      case 'mcheck':
        return '健康相談(大人)';
      case 'couple':
        return '夫婦生活';
      case 'kageki':
        return '過激な恋愛';
      case 'kageki2':
        return '大人の恋愛';
      case 'onatech':
        return 'オナテク';
      case 'loveho':
        return 'ラブホテル';
      case 'adultgoods':
        return 'アダルトグッズ';
      case 'adultaccessory':
        return '大人の飾り';
      case 'lovedoll':
        return 'ラブドール';
      case 'sm':
        return 'ＳＭ';
      case 'feti':
        return 'フェチ';
      case 'feet':
        return '足萌え';
      case 'armpits':
        return '腋下萌え';
      case 'uniform':
        return '制服';
      case 'eyes':
        return '目萌え';
      case 'glasses':
        return '眼鏡萌え';
      case 'swimsuit':
        return '水着・スク水';
      case 'hitozuma':
        return '人妻';
      case 'mature':
        return '熟女';
      case 'cougar':
        return '痴女';
      case 'pregnant':
        return '妊婦萌え';
      case 'senpai':
        return '先輩萌え';
      case 'sensei':
        return '教師萌え';
      case 'mom':
        return 'ママ熟女';
      case 'okama':
        return 'おかま・おなべ';
      case 'gaypink':
        return '大人の同性愛';
      case 'lesbian':
        return 'レズ・百合萌え';
      case 'brocon':
        return '兄萌え';
      case 'siscon':
        return '妹萌え';
      case 'eroaa':
        return 'エロAA';
      case 'erochara':
        return 'キャラサロン';
      case 'erochara2':
        return 'オリキャラ';
      case '801':
        return '801';
      case 'futanari':
        return 'ふたなり';
      case 'erocg':
        return 'お絵描き・創作';
      case 'eroparo':
        return 'エロパロ';
      case 'makeup':
        return '化粧';
      case 'plastic':
        return '整形・豊胸';
      case 'club':
        return '風俗全般';
      case 'pub':
        return 'お水出会い系';
      case 'host':
        return 'ホストクラブ';
      case 'nuki':
        return 'へるす';
      case 'soap':
        return 'ソープ';
      case 'neet4pink':
        return 'ニー速(pink)';
      case 'cherryboy':
        return '童貞';
      case 'megami':
        return '女神';
      case 'livemegami':
        return '女神実況';
      case 'meow':
        return 'にゃあ';
      case 'mobpink':
        return '大人のモバイル';
      case '3shuchaku':
        return 'ニュー速Ｆ';
      case 'scat':
        return '排泄・汚物';
      case 'bukkake':
        return 'ぶっかけ';
      case 'tentacle':
        return '触手';
      case 'bbbb':
        return 'English';
      case '21oversea':
        return '危ない海外';
      case 'cat':
        return '生き物苦手';
      case 'worldskb':
        return '世界のスケベ';
      case 'healing':
        return '癒し';
      default:
        return '';
    }
  }
}
