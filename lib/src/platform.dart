class PlatformData {
  // PlatformData(
  //     {required this.isIOS,
  //     required this.isAndroid,
  //     required this.isWindows,
  //     required this.isMacOS,
  //     required this.isWeb,
  //     required this.isLinux});
  late bool _isIOS;
  late bool _isAndroid;
  late bool _isWindows;
  late bool _isMacOS;
  late bool _isWeb;
  late bool _isLinux;
  late bool _isDebugMode;

  PlatformData._internal();
  static final PlatformData instance = PlatformData._internal();
  factory PlatformData() => instance;

  void setData(
      {required final bool iOS,
      required final bool android,
      required final bool windows,
      required final bool mac,
      required final bool web,
      required final bool linux,
      required final bool debug}) {
    _isIOS = iOS;
    _isAndroid = android;
    _isWindows = windows;
    _isMacOS = mac;
    _isWeb = web;
    _isLinux = linux;
    _isDebugMode = debug;
  }

  bool get isIOS => _isIOS;
  bool get isAndroid => _isAndroid;
  bool get isWindows => _isWindows;
  bool get isMacOS => _isMacOS;
  bool get isLinux => _isLinux;
  bool get isWeb => _isWeb;
  bool get isDebugMode => _isDebugMode;

  static const windowWidth = 'windowWidth';
  static const windowHeight = 'windowHeight';
  static const windowOffsetX = 'windowOffsetX';
  static const windowOffsetY = 'windowOffsetY';

  static const ageedTerms = 'ageedTerms';
}