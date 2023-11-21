import 'package:model/src/importer.dart';
import 'package:test/test.dart';

void main() {
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
