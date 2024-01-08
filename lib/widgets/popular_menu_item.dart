import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:go_router/go_router.dart';

import '../utils/custom_colors.dart';

class PopularMenuItem extends StatelessWidget {
  const PopularMenuItem({
    super.key,
    this.title,
    this.price,
    this.restaurant,
  });

  final String? title;
  final String? price;
  final String? restaurant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/product-details');
      },
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
                      title ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(restaurant ?? ""),
                  ],
                ),
              ),
              Text(
                "₹$price",
                style: TextStyle(
                  color: CustomColors.orange,
                  fontSize: ScreenUtil().setSp(22),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
