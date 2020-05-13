import 'dart:ui';

class SizeFit {
  // 1.基本信息
  /// 像素密度
  static double _dpr;
  static double get dpr => _dpr;

  static double _rpx;
  static double _px;

  /// 像素宽度/高度
  static double _physicalWidth;
  static double get physicalWidth => _physicalWidth;
  /// 像素高度
  static double _physicalHeight;
  static double get physicalHeight => _physicalHeight;

  /// 屏幕宽度/高度
  static double _screenWidth;
  static double get screenWidth => _screenWidth;
  static double _screenHeight;
  static double get screenHeight => _screenHeight;

  /// 文字缩放系数
  static double _textScaleFactor;
  static double get textScaleFactor => _textScaleFactor;

  /// 状态栏高度
  static double _statusBarHeight;
  static double get statusBarHeight => _statusBarHeight;

  /// 底部安全区高度
  static double _bottomBarHeight;
  static double get bottomBarHeight => _bottomBarHeight;

  /// 控制字体是否要根据系统的“字体大小”辅助选项来进行缩放。默认值为false。
  /// allowFontScale Specifies whether fonts should scale to respect Text Size accessibility settings. The default is false.
  static bool _allowFontScale;

  static void initialize({double standardSize = 750, 
                          bool allowFontScale = false}) {
    _allowFontScale = allowFontScale;

    // 1.手机的物理分辨率
    _physicalWidth = window.physicalSize.width;
    _physicalHeight = window.physicalSize.height;

    // 2.获取dpr
    _dpr = window.devicePixelRatio;

    // 3.宽度和高度
    _screenWidth = _physicalWidth / _dpr;
    _screenHeight = _physicalHeight / _dpr;

    // 4.文字缩放系数
    _textScaleFactor = window.textScaleFactor;

    // 5.状态栏高度和底部安全区域高度
    _statusBarHeight = window.padding.top / _dpr;
    _bottomBarHeight = window.padding.bottom / dpr;

    // 6.1.计算rpx的大小(参考微信小程序rpx的设计 https://developers.weixin.qq.com/miniprogram/dev/framework/view/wxss.html)
    _rpx = _screenWidth / standardSize;
    _px = _rpx * 2;
  }

  static num setRpx(num size) {
    return _rpx * size;
  }

  static num setPx(num size) {
    return _px * size;
  }

  static num setSp(num fontSize, {bool allowFontScaleSelf}) {
    final scale = _rpx;
    return allowFontScaleSelf == null
          ? (_allowFontScale
              ? (fontSize * scale)
              : ((fontSize * scale) / _textScaleFactor)
            )
          : (allowFontScaleSelf
              ? (fontSize * scale)
              : ((fontSize * scale) / _textScaleFactor)
            );
  } 
}
