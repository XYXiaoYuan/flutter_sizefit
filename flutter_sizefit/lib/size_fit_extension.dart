import 'size_fit.dart';

extension SizeFitExtension on num {
  // num get px => SizeFit.setPx(this);

  num get rpx => SizeFit.setRpx(this);

  num get sp => SizeFit.setSp(this);

  num get ssp => SizeFit.setSp(this, allowFontScaleSelf: true);
}
