enum Communities {
  fiveCh(label: '5ch', host: '5ch.net'),
  girlsCh(label: 'Girls Ch', host: 'girlschannel.net'),
  futabaCh(label: 'ふたば Ch', host: '2chan.net'),
  pinkCh(label: 'Pink Ch', host: 'bbspink.com'),
  shitaraba(label: 'したらば', host: 'shitaraba.net'),
  open2Ch(label: 'Open 2ch', host: 'open2ch.net'),
  machi(label: 'まち BBS', host: 'machi.to'),
  hatena(label: 'はてなB', host: 'hatena.ne.jp'),
  mal(label: 'MAL', host: 'myanimelist.net'),
  youtube(label: 'YouTube', host: 'youtube.com'),
  chan4(label: '4chan', host: '4chan.org');

  const Communities({required this.label, required this.host});
  final String label;
  final String host;
}

// 直感的で誰でも簡単に

// リンク先のプレビュー表示
// 画像のサムネイル表示
// 履歴の自動削除
// 多彩なテーマ
// ダークモード
// PDF閲覧
// 動画再生
// 画像保存

enum ThemeList {
  m3Purple,
  espresso,
  greenForest,
  goldSunset,
  sanJuanBlue,
  barossa,
  pinkSakura,
  indigoNights,
  verdunLime,
  brandBlues,
  rosewood,
  redTornado,
  hippieBlue,
  ebonyClay,
  damaskAndLunar,
  greyLaw
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

// enum ThreadsOrder {
//   newOrder,
//   oldOrder,
//   hot,
//   // biggerResCount,
//   resCountAsc,
//   resCountDesc,
//   newerThread,
//   olderThread,
//   newerResponce,
//   importance,

//   catalog;
// }

enum ThreadsOrderType {
  hot,
  resCountAsc,
  resCountDesc,
  newerThread,
  olderThread,
  newerResponce,
  importance,

  catalog;
}

// enum PositionToGet {
//   first(label: 'First 1000 Comments'),
//   last(label: 'Last 1000 Comments');

//   const PositionToGet({required this.label});
//   final String label;
// }

enum MarkIcon {
  edit,
  star,
  exclamation,
  hot;
}

enum ImportanceList {
  veryImportant(level: 'veryImportant', label: 'Very Important'),
  important(level: 'important', label: 'Important'),
  // three(level: 'medium'),
  unimportant(level: 'unimportant', label: 'Unimportant'),
  veryUnimportant(level: 'veryUnimportant', label: 'Very Unimportant');

  const ImportanceList({required this.level, required this.label});
  final String level;
  final String label;
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

enum OpenLinkList {
  dialog,
  browser,
  embed,
  copy,
  addToFav,
  removeFromFav,
  addToHistory,
  removeFromHistory,
  name,
  openBoard,
  openRes;
}

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

enum MovedToLastThreads {
  none,
  over1000;
}

enum AutoDownloadableSizeLimit {
  doNot(label: 'doNot', value: 0),
  to200000(label: '100kb', value: 100000),
  to500000(label: '500kb', value: 500000),
  to1000000(label: '1000kb', value: 1000000),
  to1500000(label: '1500kb', value: 1500000),
  noLimit(label: 'noLimit', value: 0);

  const AutoDownloadableSizeLimit({required this.label, required this.value});
  final String label;
  final int value;
}

enum TimeagoList {
  disable,
  disableWhenHotIsOver2000,
  disableSeconds,
  disableSecondsAndMinutes,
  enable;
}

enum MediaTypeList { image, video, pdf }

enum InputCommentFields {
  body(label: 'Body'),
  name(label: 'Name'),
  email(label: 'Email'),
  media(label: 'Media'),
  subject(label: 'Title');

  const InputCommentFields({required this.label});
  final String label;
}

enum BoardTileLeading{
  imageSrc,
  playListIcon,
  none
}