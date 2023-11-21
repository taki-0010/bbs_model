import 'package:model/src/importer.dart';
import 'package:test/test.dart';

void main() {
  group('test five ch', () {
    // thread pc
    const threadHtml = 'https://egg.5ch.net/test/read.cgi/software/1690261572/';
    const threadHtmlLast50 =
        'https://egg.5ch.net/test/read.cgi/software/1690261572/l50';
    const threadHtmlWithRes =
        'https://egg.5ch.net/test/read.cgi/software/1690261572/658';
    const threadDat = 'https://egg.5ch.net/software/dat/1690261572.dat';
    // thread mb
    const threadSp =
        'https://itest.5ch.net/asahi/test/read.cgi/newsplus/1697080449';
    const threadSpLast50 =
        'https://itest.5ch.net/asahi/test/read.cgi/newsplus/1697080449/l50';
    const threadSpWithRes =
        'https://itest.5ch.net/asahi/test/read.cgi/newsplus/1697080449/55';

    // board
    const boardSp = 'https://itest.5ch.net/subback/covid19';
    const boardPc = 'https://krsw.5ch.net/covid19';

    const top = 'https://5ch.net';
    const top2 = 'https://www2.5ch.net/5ch.html';

    late Uri threadHtmlUri;
    late Uri threadHtmlL50Uri;
    late Uri threadHtmlResUri;
    late Uri threadDatUri;
    late Uri threadSpUri;
    late Uri threadSpL50Uri;
    late Uri threadSpResUri;
    late Uri boardSpUri;
    late Uri boardPcUri;
    late Uri topUri;
    late Uri top2Uri;
    setUp(() {
      threadHtmlUri = Uri.parse(threadHtml);
      threadHtmlL50Uri = Uri.parse(threadHtmlLast50);
      threadHtmlResUri = Uri.parse(threadHtmlWithRes);
      threadDatUri = Uri.parse(threadDat);
      threadSpUri = Uri.parse(threadSp);
      threadSpL50Uri = Uri.parse(threadSpLast50);
      threadSpResUri = Uri.parse(threadSpWithRes);
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
          FiveChData.uriIsThreadOrBoard(threadHtmlL50Uri, Communities.fiveCh),
          true);
      expect(
          FiveChData.uriIsThreadOrBoard(threadHtmlResUri, Communities.fiveCh),
          true);
      expect(
          FiveChData.uriIsThreadOrBoard(threadSpUri, Communities.fiveCh), true);
      expect(FiveChData.uriIsThreadOrBoard(threadSpL50Uri, Communities.fiveCh),
          true);
      expect(FiveChData.uriIsThreadOrBoard(threadSpResUri, Communities.fiveCh),
          true);
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
      expect(FiveChData.getThreadIdFromUri(threadHtmlL50Uri, Communities.fiveCh),
          '1690261572');
      expect(FiveChData.getThreadIdFromUri(threadHtmlResUri, Communities.fiveCh),
          '1690261572');
      expect(FiveChData.getThreadIdFromUri(threadSpUri, Communities.fiveCh),
          '1697080449');
      expect(FiveChData.getThreadIdFromUri(threadSpL50Uri, Communities.fiveCh),
          '1697080449');
      expect(FiveChData.getThreadIdFromUri(threadSpResUri, Communities.fiveCh),
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
      expect(FiveChData.getBoardIdFromUri(threadHtmlL50Uri, Communities.fiveCh),
          'software');
      expect(FiveChData.getBoardIdFromUri(threadHtmlResUri, Communities.fiveCh),
          'software');
      expect(FiveChData.getBoardIdFromUri(threadSpUri, Communities.fiveCh),
          'newsplus');
      expect(FiveChData.getBoardIdFromUri(threadSpL50Uri, Communities.fiveCh),
          'newsplus');
      expect(FiveChData.getBoardIdFromUri(threadSpResUri, Communities.fiveCh),
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
      expect(FiveChData.getDirectoryFromUri(threadHtmlL50Uri, Communities.fiveCh),
          'egg');
      expect(FiveChData.getDirectoryFromUri(threadHtmlResUri, Communities.fiveCh),
          'egg');
      expect(FiveChData.getDirectoryFromUri(threadSpUri, Communities.fiveCh),
          'asahi');
      expect(FiveChData.getDirectoryFromUri(threadSpL50Uri, Communities.fiveCh),
          'asahi');
      expect(FiveChData.getDirectoryFromUri(threadSpResUri, Communities.fiveCh),
          'asahi');
      expect(
          FiveChData.getDirectoryFromUri(boardSpUri, Communities.fiveCh), null);
      expect(FiveChData.getDirectoryFromUri(boardPcUri, Communities.fiveCh),
          'krsw');
    });
    test('get res num', () {
      expect(FiveChData.getResNumFromUri(topUri, Communities.fiveCh), null);
      expect(FiveChData.getResNumFromUri(top2Uri, Communities.fiveCh), null);
      expect(
          FiveChData.getResNumFromUri(threadDatUri, Communities.fiveCh), null);
      expect(
          FiveChData.getResNumFromUri(threadHtmlUri, Communities.fiveCh), null);
      expect(
          FiveChData.getResNumFromUri(threadHtmlL50Uri, Communities.fiveCh), null);
      expect(
          FiveChData.getResNumFromUri(threadHtmlResUri, Communities.fiveCh), 658);
      expect(FiveChData.getResNumFromUri(threadSpUri, Communities.fiveCh), null);
      expect(FiveChData.getResNumFromUri(threadSpL50Uri, Communities.fiveCh), null);
      expect(FiveChData.getResNumFromUri(threadSpResUri, Communities.fiveCh), 55);
      expect(FiveChData.getResNumFromUri(boardSpUri, Communities.fiveCh), null);
      expect(FiveChData.getResNumFromUri(boardPcUri, Communities.fiveCh), null);
    });
  });
}
