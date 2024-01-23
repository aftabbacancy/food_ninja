import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/utils/custom_colors.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/images.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        0,
        0,
        0,
        15,
      ),
      child: Container(
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
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Image.asset(
                  Images.meuImage,
                  width: ScreenUtil().setWidth(64),
                  height: ScreenUtil().setHeight(64),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Spacy fresh crab",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: FontSizes.responsiveSize(13),
                      ),
                    ),
                    Text(
                      "Waroenk kita",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: FontSizes.responsiveSize(11),
                      ),
                    ),
                    Text(
                      "\$35",
                      style: TextStyle(
                        color: CustomColors.primaryGreen,
                        fontSize: FontSizes.responsiveSize(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        color: CustomColors.secondaryGreen,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Icon(
                      Icons.horizontal_rule_rounded,
                      size: FontSizes.responsiveSize(14),
                      color: CustomColors.primaryGreen,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: Text(
                      "1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: FontSizes.responsiveSize(13),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        color: CustomColors.primaryGreen,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Icon(
                      Icons.add,
                      size: FontSizes.responsiveSize(14),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
