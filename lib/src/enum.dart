enum Communities {
  fiveCh(label: '5ch'),
  girlsCh(label: 'Girls Ch'),
  futabaCh(label: 'Futaba Ch');

  const Communities({required this.label});
  final String label;
}

enum ThemeList { m3Purple, rosewood, sanJuanBlue, espresso }

enum CacheExpire {
  oneDay(days: 1),
  oneWeek(days:7),
  twoWeeks(days: 14),
  oneMonth(days: 30),
  indefinite(days: null);

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
