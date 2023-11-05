import 'importer.dart';

part 'futaba_ch.g.dart';

class FutabaChBoardNames {
  static String? getById(final String? id) {
    switch (id) {
      case 'dec':
        return '二次元裏(dec)';
      case 'jun':
        return '二次元裏(jun)';
      case 'b':
        return '二次元裏(b)';
      case '58':
        return '転載不可';
      case '59':
        return '転載可';
      case 'id':
        return '二次元ID';
      case '23':
        return 'スピグラ';
      case '16':
        return '二次元ネタ';
      case '43':
        return '二次元業界';
      case '74':
        return 'FGO';
      case '75':
        return 'アイマス';
      case '86':
        return 'ZOIDS';
      case '78':
        return 'ウメハラ総合';
      case '31':
        return 'ゲーム';
      case '28':
        return 'ネトゲ';
      case '56':
        return 'ソシャゲ';
      case '60':
        return '艦これ';
      case '69':
        return 'モアイ';
      case '65':
        return '刀剣乱舞';
      case '64':
        return '占い';
      case '66':
        return 'ファッション';
      case '67':
        return '旅行';
      case '68':
        return '子育て';
      case 'webm':
        return 'webm';
      case '71':
        return 'そうだね';
      case '82':
        return '任天堂';
      case '61':
        return 'ソニー';
      case '10':
        return 'ネットキャラ';
      case '34':
        return 'なりきり';
      case '11':
        return '自作絵';
      case '14':
        return '自作絵裏';
      case '32':
        return '女装';
      case '15':
        return 'ばら';
      case '7':
        return 'ゆり';
      case '8':
        return 'やおい';
      case '3':
        return '自作PC';
      case 'g':
        return '特撮';
      case '2':
        return 'ろぼ';
      case '63':
        return '映画';
      case '44':
        return 'おもちゃ';
      case 'v':
        return '模型';
      case 'y':
        return '模型裏';
      case '47':
        return '模型裏';
      case '73':
        return 'VTuber';
      case '84':
        return 'ホロライブ';
      case '81':
        return '合成音声';
      case 'x':
        return '3DCG';
      case '85':
        return '人工知能';
      case '35':
        return '政治';
      case '36':
        return '経済';
      case '38':
        return '尹錫悦';
      case '80':
        return '岸田文雄';
      case '79':
        return '宗教';
      case '50':
        return '三次実況';
      case 'f':
        return '軍';
      case '39':
        return '軍事';
      case 'm':
        return '数学';
      case 'i':
        return 'flash';
      case 'k':
        return '壁紙';
      case 'l':
        return '壁紙二';
      case '40':
        return '東方';
      case '55':
        return '東方裏';
      case 'p':
        return 'お絵かき';
      case 'q':
        return '落書き';
      case 'u':
        return '落書き裏';
      case 'oe':
        return 'お絵sql';
      case '72':
        return 'お絵sqlip';
      case '6':
        return 'ニュース表';
      case '76':
        return '昭和';
      case '77':
        return '平成';
      case '53':
        return '発電';
      case '52':
        return '自然災害';
      case '83':
        return 'コロナ';
      case '9':
        return '雑談';
      case '70':
        return '新板提案';
      case '54':
        return 'IPv6';
      case 'layout':
        return 'レイアウト';
      case 't':
        return '料理';
      case '20':
        return '甘味';
      case '21':
        return 'ラーメン';
      case 'e':
        return 'のりもの';
      case 'j':
        return '二輪';
      case '37':
        return '自転車';
      case '45':
        return 'カメラ';
      case '48':
        return '家電';
      case 'r':
        return '鉄道';
      case 'img2':
        return '二次元';
      case 'hinan':
        return '避難所';
      case '1':
        return '野球';
      case '12':
        return 'サッカー';
      case '25':
        return '麻雀';
      case '26':
        return 'うま';
      case '27':
        return 'ねこ';
      case 'd':
        return 'どうぶつ';
      case 'z':
        return 'しょくぶつ';
      case 'w':
        return '虫';
      case '49':
        return 'アクア';
      case '62':
        return 'アウトドア';
      default:
        return '';
    }
  }
}

class FutabaData {
  static final host = Communities.futabaCh.host;
  // static final bbemenu = 'www.$host/bbsmenu.html';
  static final bbsmenuSp = 'www.$host/i.htm';
  static const catalog = '?mode=cat';
  static const sort = '&sort=';
  static const index2 = 'index2.html';
  static const sp = 'i.htm';
  static const spv = 'v.php';

  // board
  // https://jun.2chan.net/jun/futaba.htm
  // https://jun.2chan.net/jun/futaba.php?mode=cat
  // https://jun.2chan.net/v.php?jun&guid=on

  // thread
  //pc https://jun.2chan.net/jun/res/24276309.htm
  //pc https://jun.2chan.net/v.php?jun.24276309

  static bool? uriIsThreadOrBoard(final Uri uri) {
    if (!uri.host.contains(host)) {
      return null;
    }
    if (uri.path.contains('futaba.htm') || uri.path.contains('futaba.php')) {
      return false;
    }
    final path = uri.path;

    if (path.isNotEmpty && path.contains('/res/')) {
      return true;
    }
    if (path.contains(spv)) {
      final parm = uri.queryParameters;
      if (parm.keys.contains('guid')) {
        return false;
      }
      return true;
    }
    return null;
  }

  static String? getBoardIdFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null) {
      return null;
    }
    final path = uri.path;
    final seg = uri.pathSegments;
    if (path.contains(spv)) {
      final prm = uri.queryParameters;
      if (prm.keys.isNotEmpty) {
        final prmKey = prm.keys.first;
        final dot = prmKey.indexOf('.');
        final id = dot == -1 ? prmKey : prmKey.substring(0, dot);
        final name = FutabaChBoardNames.getById(id);
        if (name != null) {
          return id;
        }
      }
    }
    if (seg.length >= 2) {
      return seg.first;
    }
    return null;
  }

// https://may.2chan.net/b/res/1147290458.htm
  static String? getThreadIdFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null || !tob) {
      return null;
    }
    final path = uri.path;
    final seg = uri.pathSegments;
    if (path.contains('/res/') && seg.length >= 3) {
      final id = seg[2];
      final dot = id.indexOf('.');
      if (dot != -1) {
        return id.substring(0, dot);
      }
    }
    if (path.contains(spv)) {
      final prm = uri.queryParameters;
      if (prm.keys.isNotEmpty) {
        final ptmKey = prm.keys.first;
        final dot = ptmKey.indexOf('.');
        if (dot != -1) {
          return ptmKey.substring(dot + 1);
        }
      }
    }
    return null;
  }

  static String? getDirectoryFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null) {
      return null;
    }
    final hostPath = uri.host;
    final splited = hostPath.split('.');
    if (splited.length == 3) {
      return splited.first;
    }
    return null;
  }

  static String getBoardPath(
      {required final String directory,
      required final String boardId,
      required final ThreadsOrderType order}) {
    final path = '$directory.$host/$boardId';

    switch (order) {
      case ThreadsOrderType.catalog:
        return '$path/futaba.php$catalog';
      case ThreadsOrderType.resCountDesc:
        return '$path/futaba.php$catalog${sort}3';
      case ThreadsOrderType.newerResponce:
        return '$path/futaba.php$catalog${sort}1';
      default:
    }
    return '';
  }

  // static String? getIdFromUrl(final String value) {
  //   final data = value.substring(value.lastIndexOf('/') + 1);
  //   return data.replaceAll('.htm', '');
  // }

  // static String? getDirectory(final Uri value) {
  //   final origin = value.host;
  //   final index = origin.indexOf('.');
  //   return origin.substring(0, index);
  // }

  // static String? getBoardIdFromUrl(final String value) {
  //   try {
  //     final uri = Uri.parse(value);
  //     final seg = uri.pathSegments[0];
  //     return seg;
  //   } catch (e) {
  //     logger.e(e);
  //   }
  //   return null;
  // }

  static String getUrlByPath(
      final String directory, final String boardId, final String threadId) {
    return '$directory.$host/$boardId/res/$threadId.htm';
  }

  static String getHost(final String directory) {
    return '$directory.$host';
  }

  static String threadPath(final String boardId, final String threadId) {
    return '$boardId/res/$threadId.htm';
  }

  static FutabaChThread? parseFromJson(
      final int resCount, final ThreadMarkData markData) {
    if (markData.getSubdomain != null) {
      return FutabaChThread(
          id: markData.id,
          title: markData.title,
          resCount: resCount,
          directory: markData.getSubdomain!,
          boardId: markData.boardId,
          type: markData.type,
          url: markData.url);
    }
    return null;
  }
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class FutabaBoardFromJson {
  const FutabaBoardFromJson(
      {required this.old,
      required this.dispname,
      required this.dispsod,
      required this.die,
      required this.dielong,
      required this.nowtime,
      required this.maxres,
      required this.res,
      this.sd = const []});
  final int old;
  final int dispname;
  final int dispsod;
  final String die;
  final String dielong;
  final int nowtime;
  final String maxres;
  final Map<String, FutabaThreadFromJson?> res;
  final List<dynamic> sd;

  factory FutabaBoardFromJson.fromJson(Map<String, dynamic> json) =>
      _$FutabaBoardFromJsonFromJson(json);

  Map<String, dynamic> toJson() => _$FutabaBoardFromJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class FutabaThreadFromJson {
  const FutabaThreadFromJson(
      {required this.now,
      required this.name,
      required this.email,
      required this.sub,
      required this.com,
      required this.ext,
      required this.w,
      required this.h,
      required this.tim,
      required this.fsize,
      required this.del,
      required this.host,
      required this.id,
      required this.rsc,
      required this.src,
      required this.thumb});
  final String now;
  final String name;
  final String email;
  final String sub;
  final String com;
  final String ext;
  final int w;
  final int h;
  final String tim;
  final int fsize;
  final String del;
  final String host;
  final String id;
  final int rsc;
  final String src;
  final String thumb;

  factory FutabaThreadFromJson.fromJson(Map<String, dynamic> json) =>
      _$FutabaThreadFromJsonFromJson(json);

  Map<String, dynamic> toJson() => _$FutabaThreadFromJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class FutabaContentBaseFromJson {
  const FutabaContentBaseFromJson(
      {required this.old,
      required this.dispname,
      required this.dispsod,
      required this.die,
      required this.dielong,
      required this.nowtime,
      required this.maxres,
      required this.res});
  final int old;
  final int dispname;
  final int dispsod;
  final String die;
  final String dielong;
  final int nowtime;
  final String maxres;
  final Map<String, FutabaContentFromJson> res;

  int get resCount => res.entries.length + 1;

  factory FutabaContentBaseFromJson.fromJson(Map<String, dynamic> json) =>
      _$FutabaContentBaseFromJsonFromJson(json);

  Map<String, dynamic> toJson() => _$FutabaContentBaseFromJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class FutabaContentFromJson {
  const FutabaContentFromJson({
    required this.now,
    required this.name,
    required this.email,
    required this.sub,
    required this.com,
    required this.ext,
    required this.w,
    required this.h,
    required this.tim,
    required this.fsize,
    required this.del,
    required this.host,
    required this.id,
    required this.rsc,
    required this.src,
    required this.thumb,
  });
  final String now;
  final String name;
  final String email;
  final String sub;
  final String com;
  final String ext;
  final int w;
  final int h;
  final String tim;
  final int fsize;
  final String del;
  final String host;
  final String id;
  final int rsc;
  final String src;
  final String thumb;

  factory FutabaContentFromJson.fromJson(Map<String, dynamic> json) =>
      _$FutabaContentFromJsonFromJson(json);

  Map<String, dynamic> toJson() => _$FutabaContentFromJsonToJson(this);
}

@JsonSerializable(explicitToJson: true)
@CopyWith()
@immutable
class FutabaChBoard extends BoardData {
  const FutabaChBoard(
      {required super.id,
      required super.name,
      required super.forum,
      required this.directory,
      required this.path});
  final String directory;
  final String path;
  // final String name;
  String get catalog => '?mode=cat';
  String get sort => '&sort=';
  // String get path => '//$directory.2chan.net/$id';
  String get url => '$path/futaba.htm';
  String get catalogUrl => '$path/futaba.php$catalog';
  String get newListUrl => '$path/futaba.php$catalog${sort}1';
  String get oldListUrl => '$path/futaba.php$catalog${sort}2';
  String get hugListUrl => '$path/futaba.php$catalog${sort}3';
  String get ikioiListUrl => '$path/futaba.php$catalog${sort}6';

  factory FutabaChBoard.fromJson(Map<String, dynamic> json) =>
      _$FutabaChBoardFromJson(json);

  Map<String, dynamic> toJson() => _$FutabaChBoardToJson(this);
}

@CopyWith()
@immutable
class FutabaChThread extends ThreadData with WithDateTime {
  const FutabaChThread({
    required super.id,
    required super.title,
    required super.resCount,
    // required super.lastIndex,
    super.thumbnailStr,
    // super.thumbnail,
    required this.directory,
    required super.boardId,
    required super.type,
    required super.url,
    super.thumbnailFullUrl,
    // super.difference,
    super.isNewPost,
    super.updateAtStr,
    super.catalog,
  });
  // final String boardId;
  final String directory;

  @override
  bool get locked => resCount >= 1000;

  SrcData? get thumbnail => thumbnailStr != null
      ? SrcData.fromJson(stringToJson(thumbnailStr!))
      : null;

  // String get url => '$directory.2chan.net/$boardId/res/$id.htm';
  @override
  String get thumbnailUrl => thumbnailFullUrl != null
      ? thumbnailFullUrl!
      : thumbnail?.thumbnailUri != null
          ? Uri.tryParse(thumbnail!.thumbnailUri!).toString()
          : '';
  // 'https://$directory.2chan.net${thumbnail?.thumbnailUri}';
  // @override
  // String get thumbnailUrl => Uri.https(
  //         '$directory.${Communities.futabaCh.host}',
  //         '${thumbnail?.thumbnailUri}')
  //     .toString();
  // // 'https://$directory.2chan.net${thumbnail?.thumbnailUri}';

  @override
  DateTime? get dateTime => DateTime.fromMillisecondsSinceEpoch(
      int.tryParse(updateAtStr ?? '0') ?? 0);

  @override
  double get ikioi {
    if (resCount == -1) {
      return -1.0;
    }
    return getIkioi(int.tryParse(updateAtStr ?? '0') ?? 0, resCount);
  }
}

@JsonSerializable()
@CopyWith()
@immutable
class FutabaChContent extends ContentData with WithDateTime {
  const FutabaChContent(
      {required super.forum,
      required super.index,
      // this.thumbnail,
      super.src,
      required super.body,
      required this.number,
      required this.created,
      required this.agree,
      required super.name,
      required this.directory,
      super.title,
      super.threadThumbnail,
      super.srcUrl,
      super.thumbUrl,
      this.resto,
      this.hash,
      this.limit,
      this.quotes = const []});
  // final String? thumbnail;
  // final String? src;
  final int number;
  final String created;
  final int? agree;
  // final String? title;
  // final String name;
  final String directory;
  final List<String?> quotes;
  final String? resto;
  final String? hash;
  final String? limit;

  @override
  String? get srcThumbnail =>
      thumbUrl ??
      (src?.thumbnailUri != null
          ? Uri.https('$directory.${Communities.futabaCh.host}',
                  '${src?.thumbnailUri}')
              .toString()
          : null);

  @override
  String? get srcContent =>
      srcUrl ??
      (src?.srcUri != null
          ? Uri.https(
                  '$directory.${Communities.futabaCh.host}', '${src?.srcUri}')
              .toString()
          : null);

  @override
  DateTime get createdAt {
    final datetime = created.substring(0, created.indexOf('('));
    final daytime = created.substring(created.indexOf(')') + 1);
    // logger.d('createdAt: $datetime, daytime: $daytime');
    // if (daytime == null) {
    //   return DateTime.now();
    // }

    return getDateTime(datetime, daytime);
  }

  @override
  String? get getUserName => name;

  @override
  String? get getPostId {
    final idIndex = created.indexOf('ID:');
    return idIndex == -1 ? null : created.substring(idIndex + 3);
  }

  String? get getIp {
    final ipIndex = created.indexOf('IP:');
    return ipIndex == -1 ? null : created.substring(ipIndex + 3);
  }

  @override
  String? get getUserId => getIp;

  @override
  Set<String?> get anchorList {
    final line = quotes.map((e) {
      final i = e?.replaceAll(RegExp(r'^>+'), '');
      return i?.replaceAll(RegExp(r'$\R'), '');
    }).toSet();
    return line;
  }

  //   @override
  // Uri? get avatarUri {
  //   if (email == null) {
  //     return null;
  //   }
  //   final data = Uri.tryParse(email!);
  //   if (data == null) {
  //     return null;
  //   }
  //   if (UrlParser.getType(email) == MediaTypeList.image) {
  //     return data;
  //   }
  //   return null;
  // }

  factory FutabaChContent.fromJson(Map<String, dynamic> json) =>
      _$FutabaChContentFromJson(json);
  Map<String, dynamic> toJson() => _$FutabaChContentToJson(this);
}
