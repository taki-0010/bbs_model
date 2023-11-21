import 'package:model/src/importer.dart';
import 'package:test/test.dart';

void main() {
  group('test hatena', () {
    const https =
        'https://b.hatena.ne.jp/entry/s/somethingorange.jp/entry/otakusabetu';
    const http =
        'https://b.hatena.ne.jp/entry/somethingorange.jp/entry/otakusabetu';
    const rss = 'https://b.hatena.ne.jp/hotentry.rss';
    const gen = 'https://b.hatena.ne.jp/hotentry/general';
    const cate = 'https://b.hatena.ne.jp/hotentry/game.rss';
    const count =
        'https://bookmark.hatenaapis.com/count/entry?url=http%3A%2F%2Fwww.hatena.ne.jp%2F';
    const entry =
        'https://b.hatena.ne.jp/entry/s/pc.watch.impress.co.jp/docs/column/hothot/1540490.html';
    const board = 'https://b.hatena.ne.jp/hotentry/it';
    const json =
        'https://b.hatena.ne.jp/entry/jsonlite/?url=http%3A%2F%2Fwww.hatena.ne.jp%2F';
    const comment =
        'https://b.hatena.ne.jp/entry/4743822195490264335/comment/wittro';
    const search =
        'https://b.hatena.ne.jp/q/flutter?target=all&users=20&safe=on&sort=recent&date_range=5y';

    late Uri httpsUri;
    late Uri httpUri;
    late Uri boardUri;
    late Uri entryUri;
    late Uri rssUri;
    late Uri genUri;
    late Uri cateUri;
    late Uri countUri;
    late Uri jsonUri;
    late Uri commentUri;
    late Uri searchUri;

    setUp(() {
      httpsUri = Uri.parse(https);
      httpUri = Uri.parse(http);
      boardUri = Uri.parse(board);
      entryUri = Uri.parse(entry);
      rssUri = Uri.parse(rss);
      genUri = Uri.parse(gen);
      cateUri = Uri.parse(cate);
      countUri = Uri.parse(count);
      jsonUri = Uri.parse(json);
      commentUri = Uri.parse(comment);
      searchUri = Uri.parse(search);
    });

    test('thread or board', () {
      expect(HatenaData.uriIsThreadOrBoard(httpsUri), true);
      expect(HatenaData.uriIsThreadOrBoard(httpUri), true);
      expect(HatenaData.uriIsThreadOrBoard(entryUri), true);
      expect(HatenaData.uriIsThreadOrBoard(boardUri), false);
      expect(HatenaData.uriIsThreadOrBoard(rssUri), null);
      expect(HatenaData.uriIsThreadOrBoard(genUri), false);
      expect(HatenaData.uriIsThreadOrBoard(cateUri), null);
      expect(HatenaData.uriIsThreadOrBoard(countUri), null);
      expect(HatenaData.uriIsThreadOrBoard(jsonUri), true);
      expect(HatenaData.uriIsThreadOrBoard(commentUri), null);
      expect(HatenaData.uriIsThreadOrBoard(searchUri), null);
    });

    test('get board id', () {
      expect(HatenaData.boardIdFromUri(httpsUri), null);
      expect(HatenaData.boardIdFromUri(httpUri), null);
      expect(HatenaData.boardIdFromUri(entryUri), null);
      expect(HatenaData.boardIdFromUri(boardUri), 'it');
      expect(HatenaData.boardIdFromUri(rssUri), null);
      expect(HatenaData.boardIdFromUri(genUri), 'general');
      expect(HatenaData.boardIdFromUri(cateUri), null);
      expect(HatenaData.boardIdFromUri(countUri), null);
      expect(HatenaData.boardIdFromUri(jsonUri), null);
      expect(HatenaData.boardIdFromUri(commentUri), null);
      expect(HatenaData.boardIdFromUri(searchUri), null);
    });
    test('get thread id', () {
      expect(HatenaData.getThreadIdFromUri(httpsUri),
          'https://somethingorange.jp/entry/otakusabetu');
      expect(HatenaData.getThreadIdFromUri(httpUri),
          'http://somethingorange.jp/entry/otakusabetu');
      expect(HatenaData.getThreadIdFromUri(entryUri),
          'https://pc.watch.impress.co.jp/docs/column/hothot/1540490.html');
      expect(HatenaData.getThreadIdFromUri(boardUri), null);
      expect(HatenaData.getThreadIdFromUri(rssUri), null);
      expect(HatenaData.getThreadIdFromUri(genUri), null);
      expect(HatenaData.getThreadIdFromUri(cateUri), null);
      expect(HatenaData.getThreadIdFromUri(countUri), null);
      expect(
          HatenaData.getThreadIdFromUri(jsonUri), 'http://www.hatena.ne.jp/');
      expect(HatenaData.getThreadIdFromUri(commentUri), null);
      expect(HatenaData.getThreadIdFromUri(searchUri), null);
    });
  });
}
