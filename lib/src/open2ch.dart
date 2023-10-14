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
  // https://hayabusa.open2ch.net/livejupiter/dat/1697086118.dat
  // https://find.open2ch.net/?bbs=&t=&q=%E9%9B%91%E8%AB%87&wh=&kako=checked&d=

  static Uri? htmlToDatUri(final Uri uri) {
    final threadId = getThreadIdFromUri(uri);
    final directory = getDirectoryFromUri(uri);
    final boardId = getBoardIdFromUri(uri);
    if (threadId != null && directory != null && boardId != null) {
      return Uri.https('$directory.$host', '$boardId/dat/$threadId.dat');
    }
    return null;
  }

  static bool? uriIsThreadOrBoard(final Uri uri) {
    if (!uri.host.contains(host)) {
      return null;
    }
    if (uri.host.split('.').length == 2) {
      return null;
    }
    if (uri.path.contains(threadPath)) {
      return true;
    }
    if (uri.path.endsWith('.dat')) {
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
      if (seg.length >= 4) {
        return seg[2];
      }
      if (seg.length == 3) {
        return seg[0];
      }
    }
    if (seg.isNotEmpty) {
      return seg.first;
    }
    return null;
  }

  static String? getDirectoryFromUri(final Uri uri) {
    final tob = uriIsThreadOrBoard(uri);
    if (tob == null) {
      return null;
    }
    final splited = uri.host.split('.');
    if (splited.length == 3 && splited.first != 'find') {
      return splited.first;
    }
    return null;
  }

  static String boardIdFromUrl(final String url) {
    final uri = Uri.parse(url);
    return uri.pathSegments.first;
  }
}
