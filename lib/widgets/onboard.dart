import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/resposive_sizes.dart';

import 'primary_button.dart';

class Onboard extends StatelessWidget {
  const Onboard(
    this.title,
    this.description,
    this.image,
    this.onNextPress, {
    super.key,
  });

  final String title;
  final String description;
  final String image;
  final Function onNextPress;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        width: screenSize.width >= ResponsiveSizes.desktop
            ? 1024
            : screenSize.width,
        child: Column(
          children: [
            SizedBox(
              width: screenSize.width,
              height: ScreenUtil().screenHeight * 0.07,
            ),
            SvgPicture.asset(
              image,
              width: screenSize.width,
              height: ScreenUtil().screenHeight * 0.6,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: FontSizes.responsiveSize(22),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: FontSizes.responsiveSize(12),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryButton(
              title: "Next",
              onPress: () {
                onNextPress();
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
