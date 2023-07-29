enum Communities {
  fiveCh(label: '5ch'),
  girlsCh(label: 'Girls Ch'),
  futabaCh(label: 'Futaba Ch');

  const Communities({required this.label});
  final String label;
}

enum ThemeList{
  m3Purple,
  rosewood,
  sanJuanBlue,
  espresso
}

enum CacheExpire{
  oneDay,
  oneWeek,
  twoWeeks,
  oneMonth,
  indefinite
}

enum ThreadsOrder {
  newOrder,
  oldOrder,
  ikioi,
  biggerResCount,
  catalog;
}

enum PositionToGet{
  first,
  last
}