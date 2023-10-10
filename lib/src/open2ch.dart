import 'package:model/model.dart';

class Open2ChData {
  static final host = Communities.open2Ch.host;
  static final bbsMenuHost = 'menu.$host';
  static final bbsMenuPath = 'bbsmenu.html';
  static final searchHost = 'find.$host';
  // https://find.open2ch.net/?bbs=&t=&q=%E9%9B%91%E8%AB%87&wh=&kako=checked&d=

  static String boardIdFromUrl(final String url) {
    final uri = Uri.parse(url);
    return uri.pathSegments.first;
  }
}
