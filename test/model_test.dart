// import 'package:model/model.dart';
import 'package:model/src/importer.dart';
import 'package:test/test.dart';

void main() {
  group('test five ch', () {
    // thread pc
    const threadHtml =
        'https://egg.5ch.net/test/read.cgi/software/1690261572/l50';
    const threadDat = 'https://egg.5ch.net/software/dat/1690261572.dat';
    // thread mb
    const threadSp =
        'https://itest.5ch.net/asahi/test/read.cgi/newsplus/1697080449';

    // board
    const boardSp = 'https://itest.5ch.net/subback/covid19';
    const boardPc = 'https://krsw.5ch.net/covid19';

    const top = 'https://5ch.net';
    const top2 = 'https://www2.5ch.net/5ch.html';

    late Uri threadHtmlUri;
    late Uri threadDatUri;
    late Uri threadSpUri;
    late Uri boardSpUri;
    late Uri boardPcUri;
    late Uri topUri;
    late Uri top2Uri;
    setUp(() {
      threadHtmlUri = Uri.parse(threadHtml);
      threadDatUri = Uri.parse(threadDat);
      threadSpUri = Uri.parse(threadSp);
      boardSpUri = Uri.parse(boardSp);
      boardPcUri = Uri.parse(boardPc);
      topUri = Uri.parse(top);
      top2Uri = Uri.parse(top2);
    });

    test('thread or board', () {
      expect(FiveChData.uriIsThreadOrBoard(topUri, Communities.fiveCh), null);
      expect(FiveChData.uriIsThreadOrBoard(top2Uri, Communities.fiveCh), null);
      expect(FiveChData.uriIsThreadOrBoard(threadDatUri, Communities.fiveCh),
          true);
      expect(FiveChData.uriIsThreadOrBoard(threadHtmlUri, Communities.fiveCh),
          true);
      expect(
          FiveChData.uriIsThreadOrBoard(threadSpUri, Communities.fiveCh), true);
      expect(
          FiveChData.uriIsThreadOrBoard(boardSpUri, Communities.fiveCh), false);
      expect(
          FiveChData.uriIsThreadOrBoard(boardPcUri, Communities.fiveCh), false);
    });
    test('get threadId', () {
      expect(FiveChData.getThreadIdFromUri(topUri, Communities.fiveCh), null);
      expect(FiveChData.getThreadIdFromUri(top2Uri, Communities.fiveCh), null);
      expect(FiveChData.getThreadIdFromUri(threadDatUri, Communities.fiveCh),
          '1690261572');
      expect(FiveChData.getThreadIdFromUri(threadHtmlUri, Communities.fiveCh),
          '1690261572');
      expect(FiveChData.getThreadIdFromUri(threadSpUri, Communities.fiveCh),
          '1697080449');
      expect(
          FiveChData.getThreadIdFromUri(boardSpUri, Communities.fiveCh), null);
      expect(
          FiveChData.getThreadIdFromUri(boardPcUri, Communities.fiveCh), null);
    });
    test('get boardId', () {
      expect(FiveChData.getBoardIdFromUri(topUri, Communities.fiveCh), null);
      expect(FiveChData.getBoardIdFromUri(top2Uri, Communities.fiveCh), null);
      expect(FiveChData.getBoardIdFromUri(threadDatUri, Communities.fiveCh),
          'software');
      expect(FiveChData.getBoardIdFromUri(threadHtmlUri, Communities.fiveCh),
          'software');
      expect(FiveChData.getBoardIdFromUri(threadSpUri, Communities.fiveCh),
          'newsplus');
      expect(FiveChData.getBoardIdFromUri(boardSpUri, Communities.fiveCh),
          'covid19');
      expect(FiveChData.getBoardIdFromUri(boardPcUri, Communities.fiveCh),
          'covid19');
    });
    test('get directory', () {
      expect(FiveChData.getDirectoryFromUri(topUri, Communities.fiveCh), null);
      expect(FiveChData.getDirectoryFromUri(top2Uri, Communities.fiveCh), null);
      expect(FiveChData.getDirectoryFromUri(threadDatUri, Communities.fiveCh),
          'egg');
      expect(FiveChData.getDirectoryFromUri(threadHtmlUri, Communities.fiveCh),
          'egg');
      expect(FiveChData.getDirectoryFromUri(threadSpUri, Communities.fiveCh),
          'asahi');
      expect(
          FiveChData.getDirectoryFromUri(boardSpUri, Communities.fiveCh), null);
      expect(FiveChData.getDirectoryFromUri(boardPcUri, Communities.fiveCh),
          'krsw');
    });
  });
  group('test youtube', () {
    const shorts = 'https://www.youtube.com/shorts/GgjfAmq2mv8';
    // video
    const video = 'https://youtube.com/watch?v=Dpp1sIL1m5Q';
    //pl
    const pl =
        'https://www.youtube.com/playlist?list=PLIPIdmqWalEVfd_43DzOt6c1tE-9nYOnH';
    // cnannel
    const handle = 'https://www.youtube.com/@TheTRYChannel';
    const channel = 'https://www.youtube.com/channel/UCabq3No3wXbs6Ut-Pux6SzA';
    const sp = 'https://youtu.be/6kguaGI7aZg?feature=shared';

    late Uri shortsUri;
    late Uri videoUri;
    late Uri handleUri;
    late Uri channelUri;
    late Uri spUri;
    late Uri plUri;

    setUp(() {
      shortsUri = Uri.parse(shorts);
      videoUri = Uri.parse(video);
      handleUri = Uri.parse(handle);
      channelUri = Uri.parse(channel);
      spUri = Uri.parse(sp);
      plUri = Uri.parse(pl);
    });

    test('get thread or board', () {
      expect(YoutubeData.uriIsThreadOrBoard(shortsUri), equals(null));
      expect(YoutubeData.uriIsThreadOrBoard(videoUri), equals(true));
      expect(YoutubeData.uriIsThreadOrBoard(handleUri), equals(false));
      expect(YoutubeData.uriIsThreadOrBoard(channelUri), equals(false));
      expect(YoutubeData.uriIsThreadOrBoard(spUri), equals(true));
    });
    test('get board id', () {
      expect(YoutubeData.getBoardIdFromUri(shortsUri), equals(null));
      expect(YoutubeData.getBoardIdFromUri(videoUri), equals(null));
      expect(
          YoutubeData.getBoardIdFromUri(handleUri), equals('@TheTRYChannel'));
      expect(YoutubeData.getBoardIdFromUri(channelUri),
          equals('UCabq3No3wXbs6Ut-Pux6SzA'));
      expect(YoutubeData.getBoardIdFromUri(spUri), equals(null));
      expect(YoutubeData.getBoardIdFromUri(plUri),
          equals('PLIPIdmqWalEVfd_43DzOt6c1tE-9nYOnH'));
    });
    test('get thread id', () {
      expect(YoutubeData.getThreadIdFromUri(shortsUri), equals(null));
      expect(YoutubeData.getThreadIdFromUri(videoUri), equals('Dpp1sIL1m5Q'));
      expect(YoutubeData.getThreadIdFromUri(handleUri), equals(null));
      expect(YoutubeData.getThreadIdFromUri(channelUri), equals(null));
      expect(YoutubeData.getThreadIdFromUri(spUri), equals('6kguaGI7aZg'));
    });
    test('get fav board id', () {
      expect(
          YoutubeData.getFavStr('UCabq3No3wXbs6Ut-Pux6SzA', true,
              handle: '@TheTRYChannel'),
          equals('ch/UCabq3No3wXbs6Ut-Pux6SzA/@TheTRYChannel'));
      expect(YoutubeData.getFavStr('PLIPIdmqWalEVfd_43DzOt6c1tE-9nYOnH', false),
          equals('pl/PLIPIdmqWalEVfd_43DzOt6c1tE-9nYOnH'));
    });
  });
}
