import 'package:my_flutter/shared/size_fit.dart';

extension IntFit on int {
  double get px{
    return SizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return SizeFit.setPx(this.toDouble());
  }
}