import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/images.dart';

import '../utils/custom_colors.dart';

class FavItem extends StatelessWidget {
  const FavItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Image.asset(
                Images.meuImage,
                width: ScreenUtil().setWidth(64),
                height: ScreenUtil().setHeight(64),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Spacy fresh crab",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: FontSizes.responsiveSize(15),
                    ),
                  ),
                  Text(
                    "Waroenk kita",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: FontSizes.responsiveSize(14),
                    ),
                  ),
                  Text(
                    "\$ 35",
                    style: TextStyle(
                      color: CustomColors.primaryGreen,
                      fontSize: FontSizes.responsiveSize(19),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  CustomColors.primaryGreen,
                ),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              child: Text(
                "Buy Again",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FontSizes.responsiveSize(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
