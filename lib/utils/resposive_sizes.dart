import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveSizes {
  static const double tablet = 768;
  static const double desktop = 1024;
  static double width = ScreenUtil().screenWidth >= desktop
      ? desktop
      : ScreenUtil().screenWidth >= tablet
          ? tablet
          : ScreenUtil().screenWidth;
  static double responsiveWidth(double size, double screenSize) {
    if (ScreenUtil().screenWidth >= ResponsiveSizes.desktop) {
      return ScreenUtil().setWidth(size) * 0.4;
    } else if (ScreenUtil().screenWidth >= ResponsiveSizes.tablet) {
      return ScreenUtil().setWidth(size) * 0.6;
    }
    return ScreenUtil().setWidth(size);
  }

  static double responsiveHeight(double size) {
    if (ScreenUtil().screenWidth >= ResponsiveSizes.desktop) {
      return ScreenUtil().setHeight(size) * 0.8;
    } else if (ScreenUtil().screenWidth >= ResponsiveSizes.tablet) {
      return ScreenUtil().setHeight(size) * 1;
    }
    return ScreenUtil().setHeight(size);
  }
}
