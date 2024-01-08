import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/utils/images.dart';

class GlobalBg extends StatelessWidget {
  const GlobalBg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(90),
      child: SvgPicture.asset(
        Images.tiltBg,
        width: ScreenUtil().screenWidth,
        fit: BoxFit.cover,
      ),
    );
  }
}
