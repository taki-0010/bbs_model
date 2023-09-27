enum Communities {
  fiveCh(label: '5ch', host: '5ch.net'),
  girlsCh(label: 'Girls Ch', host: 'girlschannel.net'),
  futabaCh(label: 'Futaba Ch', host: '2chan.net'),
  pinkCh(label: 'Pink Ch', host: 'bbspink.com');

  const Communities({required this.label, required this.host});
  final String label;
  final String host;
}

enum ThemeList {
  m3Purple,
  rosewood,
  sanJuanBlue,
  espresso,
  greenForest,
  goldSunset,
  barossa,
  pinkSakura,
  indigoNights,
  verdunLime
}

enum LangList {
  ja(label: '日本語'),
  en(label: 'English');

  // zhCN;
  const LangList({required this.label});
  final String label;
}

enum RetentionPeriodList {
  byPostPace(days: 0),
  oneDay(days: 1),
  oneWeek(days: 7),
  twoWeeks(days: 14),
  oneMonth(days: 30);
  // indefinite(days: null);

  const RetentionPeriodList({required this.days});
  final int days;
}

enum ThreadsOrder {
  newOrder,
  oldOrder,
  hot,
  // biggerResCount,
  resCountAsc,
  resCountDesc,
  newerThread,
  olderThread,
  newerResponce,
  importance,

  catalog;
}

enum PositionToGet {
  first(label: 'First 1000 Comments'),
  last(label: 'Last 1000 Comments');

  const PositionToGet({required this.label});
  final String label;
}

enum MarkIcon {
  edit,
  star,
  exclamation,
  hot;
}

enum ImportanceList {
  veryImportant(level: 'veryImportant'),
  important(level: 'important'),
  // three(level: 'medium'),
  unimportant(level: 'unimportant'),
  veryUnimportant(level: 'veryUnimportant');

  const ImportanceList({required this.level});
  final String level;
}

enum ImportanceTarget {
  userName,
  userId,
  postId,
  title,
  body;
}

// enum GoogleFontsList {
//   kosugi(label: 'Kosugi'),
//   shipporiMincho(label: 'Shippori Mincho'),
//   zenMaruGothic(label: 'Zen Maru Gothic'),
//   zenKurenaido(label: 'Zen Kurenaido'),
//   kaiseiDecol(label: 'Kaisei Decol'),
//   dotGothic16(label: 'DotGothic16');

//   const GoogleFontsList({required this.label});
//   final String label;
// }

enum OpenLinkList { dialog, browser, embed, copy }

enum EmbedSite { xCom, youtube }

// enum SortHistory { hot, history, deletionDate, boards }
enum SortHistoryList { history, boards }

enum PostDraftTarget {
  thread,
  comment;
}

enum ListViewStyle {
  list(maxCrossAxisExtent: 0, maxLines: 4),
  gridSmall(maxCrossAxisExtent: 90, maxLines: 1),
  gridMedium(maxCrossAxisExtent: 140, maxLines: 2),
  gridLarge(maxCrossAxisExtent: 190, maxLines: 3);

  const ListViewStyle(
      {required this.maxCrossAxisExtent, required this.maxLines});
  final double maxCrossAxisExtent;
  final int maxLines;
}

enum FetchResult {
  error,
  networkError,
  deleted,
  archived,
  success;
}
