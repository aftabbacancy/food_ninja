import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:food_ninja/utils/resposive_sizes.dart';

class NearRestaurantItem extends StatelessWidget {
  const NearRestaurantItem({
    super.key,
    this.title,
    this.distance,
  });

  final String? title;
  final String? distance;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Container(
        width: width * 0.40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0.09,
              blurRadius: 9,
              offset: const Offset(0, 9),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Images.veganLover,
                width: ScreenUtil().setWidth(96),
                height: ResponsiveSizes.responsiveHeight(
                  65,
                ),
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(17),
              ),
              Text(
                title ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(16),
                ),
              ),
              Text("$distance Mins"),
            ],
          ),
        ),
      ),
    );
  }
}
