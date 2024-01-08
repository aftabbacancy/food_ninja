import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:food_ninja/widgets/custom_input.dart';
import 'package:food_ninja/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';

class SignUpUserDetails extends StatefulWidget {
  const SignUpUserDetails({super.key});

  @override
  State<SignUpUserDetails> createState() => _SignUpUserDetailsState();
}

class _SignUpUserDetailsState extends State<SignUpUserDetails> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;

    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(
              Images.bg,
              width: width,
              height: height * 0.38,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, height * 0.1, 0, 0),
              child: Container(
                height: height * 0.9,
                width: width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.01,
                      0.1,
                    ],
                    colors: [Color.fromRGBO(255, 255, 255, 0.6), Colors.white],
                    tileMode: TileMode.mirror,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          color: Colors.white,
                          child: TextButton.icon(
                            onPressed: () {
                              context.pop();
                            },
                            icon: SvgPicture.asset(
                              Images.back,
                              width: width * 0.14,
                              height: width * 0.14,
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            label: const Text(""),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Fill in your bio to get started",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: FontSizes.responsiveSize(25),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "This data will be displayed in your account profile for security",
                      style: TextStyle(
                        fontSize: FontSizes.responsiveSize(12),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomInput(
                      labelText: "First Name",
                      controller: controller,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomInput(labelText: "Last Name", controller: controller),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomInput(
                        labelText: "Mobile Number", controller: controller),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: PrimaryButton(
                        title: "Next",
                        onPress: () {
                          context.go('signupOtp');
                        },
                      ),
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
