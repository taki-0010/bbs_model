enum Communities {
  fiveCh(label: '5ch', host: '5ch.net'),
  girlsCh(label: 'Girls Ch', host: 'girlschannel.net'),
  futabaCh(label: 'Futaba Ch', host: '2chan.net');

  const Communities({required this.label, required this.host});
  final String label;
  final String host;
}

enum ThemeList { m3Purple, rosewood, sanJuanBlue, espresso }

enum LangList {
  ja,
  en,
  zhCN;
}

enum CacheExpire {
  byPostPace(days: 0),
  oneDay(days: 1),
  oneWeek(days: 7),
  twoWeeks(days: 14),
  oneMonth(days: 30);
  // indefinite(days: null);

  const CacheExpire({this.days});
  final int? days;
}

enum ThreadsOrder {
  newOrder,
  oldOrder,
  ikioi,
  biggerResCount,
  catalog;
}

enum PositionToGet {
  first(label: 'First 1000 Comments'),
  last(label: 'Last 1000 Comments');

  const PositionToGet({required this.label});
  final String label;
}

enum MarkIcon {
  self,
  edit,
  hot;
}

enum CommentLevel {
  one(level:'veryUnimportant'),
  two(level:'unimportant'),
  three(level:'medium'),
  four(level:'important'),
  five(level:'veryImportant');

  const CommentLevel({required this.level});
  final String level;
}
