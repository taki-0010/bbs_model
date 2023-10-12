import 'package:model/model.dart';

class Open2ChData {
  static final host = Communities.open2Ch.host;
  static final bbsMenuHost = 'menu.$host';
  static final bbsMenuPath = 'bbsmenu.html';
  static final searchHost = 'find.$host';
  static const threadPath = 'test/read.cgi';
  // sp top
  // https://open2ch.net/sp/
  // board
  // https://hayabusa.open2ch.net/livejupiter/
  // thread
  // https://hayabusa.open2ch.net/test/read.cgi/livejupiter/1697086118/l10
  // https://find.open2ch.net/?bbs=&t=&q=%E9%9B%91%E8%AB%87&wh=&kako=checked&d=

  static bool? uriIsThreadOrBoard(final Uri uri) {
    if (!uri.host.contains(host)) {
      return null;
    }
    if (uri.path.contains(threadPath)) {
      return true;
    }
    final path = uri.pathSegments;
    if (path.isNotEmpty) {
      final name = FiveChBoardNames.getById(path.first);
      if (name != null && name.isNotEmpty) {
        return false;
      }
    }
    return null;
  }

  static String? getThreadIdFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null || !tob) {
      return null;
    }
    final path = uri.path;
    final mached = FiveChData.idReg.firstMatch(path);
    if (mached != null) {
      return mached.group(0);
    }
    return null;
  }

  static String? getBoardIdFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null) {
      return null;
    }
    final seg = uri.pathSegments;
    if (tob) {
      if (seg.length >= 3) {
        return seg[2];
      }
    }
    if (seg.isNotEmpty) {
      return seg.first;
    }
    return null;
  }

  static String boardIdFromUrl(final String url) {
    final uri = Uri.parse(url);
    return uri.pathSegments.first;
  }
}
