import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/utils/resposive_sizes.dart';

class FontSizes {
  static double responsiveSize(double size) {
    if (ScreenUtil().screenWidth >= ResponsiveSizes.desktop) {
      return ScreenUtil().setSp(size) * 0.4;
    } else if (ScreenUtil().screenWidth >= ResponsiveSizes.tablet) {
      return ScreenUtil().setSp(size) * 0.6;
    }
    return ScreenUtil().setSp(size);
  }
}
