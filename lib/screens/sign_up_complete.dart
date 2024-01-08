import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/utils/custom_colors.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:food_ninja/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';

class SignUpComplete extends StatefulWidget {
  const SignUpComplete({super.key});

  @override
  State<SignUpComplete> createState() => _SignUpCompleteState();
}

class _SignUpCompleteState extends State<SignUpComplete> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;

    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(
              Images.bg,
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight * 0.48,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                0,
                ScreenUtil().setHeight(200),
                0,
                0,
              ),
              child: Container(
                height: ScreenUtil().screenHeight * 0.52,
                width: ScreenUtil().screenWidth,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.01,
                      0.1,
                    ],
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.6),
                      Colors.white,
                    ],
                    tileMode: TileMode.mirror,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.17,
                    ),
                    SvgPicture.asset(
                      Images.success,
                      width: ScreenUtil().setWidth(172),
                      height: ScreenUtil().setHeight(162),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(33),
                    ),
                    Text(
                      'Congrats!',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        color: CustomColors.primaryGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    Text(
                      'Your Profile Is Ready To Use',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(23),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    PrimaryButton(
                      title: "Try order",
                      onPress: () {
                        context.go('/dashboard');
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
