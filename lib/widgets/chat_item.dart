import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/images.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
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
                  Images.demoUser,
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
                      "Anamwp",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: FontSizes.responsiveSize(15),
                      ),
                    ),
                    Text(
                      "Your Order Just Arrived!",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: FontSizes.responsiveSize(14),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "20:00",
                style: TextStyle(
                  fontSize: FontSizes.responsiveSize(12),
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
