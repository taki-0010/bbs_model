import 'package:model/src/importer.dart';
import 'package:test/test.dart';

void main() {
  group('test futaba', () {
    const top = 'https://www.2chan.net';
    const board = 'https://dec.2chan.net/58/futaba.htm';
    const boardCatalog = 'https://may.2chan.net/id/futaba.php?mode=cat';
    const boardGuid = 'https://jun.2chan.net/v.php?jun&guid=on';
    const thread = 'https://may.2chan.net/b/res/24276309.htm';
    const threadV = 'https://jun.2chan.net/v.php?jun.24276309';
    const boardJson = 'https://may.2chan.net/b/futaba.php?mode=json';
    const threadJson =
        'https://may.2chan.net/b/futaba.php?mode=json&res=1139641087';
    late Uri topUri;
    late Uri boardUri;
    late Uri boardCatUri;
    late Uri boardGuidUri;
    late Uri threadUri;
    late Uri threadVUri;
    late Uri boardJsonUri;
    late Uri threadJsonUri;

    setUp(() {
      topUri = Uri.parse(top);
      boardUri = Uri.parse(board);
      boardCatUri = Uri.parse(boardCatalog);
      boardGuidUri = Uri.parse(boardGuid);
      threadUri = Uri.parse(thread);
      threadVUri = Uri.parse(threadV);
      threadJsonUri = Uri.parse(threadJson);
      boardJsonUri = Uri.parse(boardJson);
    });

    test('thread or board', () {
      expect(FutabaData.uriIsThreadOrBoard(topUri), null);
      expect(FutabaData.uriIsThreadOrBoard(boardUri), false);
      expect(FutabaData.uriIsThreadOrBoard(boardCatUri), false);
      expect(FutabaData.uriIsThreadOrBoard(boardGuidUri), false);
      expect(FutabaData.uriIsThreadOrBoard(boardJsonUri), false);
      expect(FutabaData.uriIsThreadOrBoard(threadUri), true);
      expect(FutabaData.uriIsThreadOrBoard(threadVUri), true);
      expect(FutabaData.uriIsThreadOrBoard(threadJsonUri), true);
    });
    test('get board id', () {
      expect(FutabaData.getBoardIdFromUri(topUri), null);
      expect(FutabaData.getBoardIdFromUri(boardUri), '58');
      expect(FutabaData.getBoardIdFromUri(boardCatUri), 'id');
      expect(FutabaData.getBoardIdFromUri(boardGuidUri), 'jun');
      expect(FutabaData.getBoardIdFromUri(boardJsonUri), 'b');
      expect(FutabaData.getBoardIdFromUri(threadUri), 'jun');
      expect(FutabaData.getBoardIdFromUri(threadVUri), 'jun');
      expect(FutabaData.getBoardIdFromUri(threadJsonUri), 'b');
    });
    test('get thread id', () {
      expect(FutabaData.getThreadIdFromUri(topUri), null);
      expect(FutabaData.getThreadIdFromUri(boardUri), null);
      expect(FutabaData.getThreadIdFromUri(boardCatUri), null);
      expect(FutabaData.getThreadIdFromUri(boardGuidUri), null);
      expect(FutabaData.getThreadIdFromUri(boardJsonUri), null);
      expect(FutabaData.getThreadIdFromUri(threadUri), '24276309');
      expect(FutabaData.getThreadIdFromUri(threadVUri), '24276309');
      expect(FutabaData.getThreadIdFromUri(threadJsonUri), '1139641087');
    });
    test('get directory id', () {
      expect(FutabaData.getDirectoryFromUri(topUri), null);
      expect(FutabaData.getDirectoryFromUri(boardUri), 'dec');
      expect(FutabaData.getDirectoryFromUri(boardCatUri), 'may');
      expect(FutabaData.getDirectoryFromUri(boardGuidUri), 'jun');
      expect(FutabaData.getDirectoryFromUri(boardJsonUri), 'may');
      expect(FutabaData.getDirectoryFromUri(threadUri), 'may');
      expect(FutabaData.getDirectoryFromUri(threadVUri), 'jun');
      expect(FutabaData.getDirectoryFromUri(threadJsonUri), 'may');
    });
  });
}
