import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:food_ninja/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';

class SignupOtp extends StatefulWidget {
  const SignupOtp({super.key});

  @override
  State<SignupOtp> createState() => _SignupOtpState();
}

class _SignupOtpState extends State<SignupOtp> {
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
                      "Enter 4-digit\nVerification code",
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
                      "Code send to +6282045**** . This code will expired in 01:30",
                      style: TextStyle(
                        fontSize: FontSizes.responsiveSize(12),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: width - 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(22),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.center,
                                autofocus: true,
                                style: TextStyle(
                                  color: const Color.fromRGBO(59, 59, 59, 1),
                                  fontSize: width * 0.08,
                                ),
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(28, 22, 28, 22),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  labelStyle: TextStyle(
                                    color: Color.fromRGBO(59, 59, 59, 0.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "0",
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color.fromRGBO(59, 59, 59, 1),
                                  fontSize: width * 0.08,
                                ),
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(28, 22, 28, 22),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  labelStyle: TextStyle(
                                    color: Color.fromRGBO(59, 59, 59, 0.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "0",
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color.fromRGBO(59, 59, 59, 1),
                                  fontSize: width * 0.08,
                                ),
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(28, 22, 28, 22),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  labelStyle: TextStyle(
                                    color: Color.fromRGBO(59, 59, 59, 0.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "0",
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color.fromRGBO(59, 59, 59, 1),
                                  fontSize: width * 0.08,
                                ),
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(28, 22, 28, 22),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  labelStyle: TextStyle(
                                    color: Color.fromRGBO(59, 59, 59, 0.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "0",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: PrimaryButton(
                        title: "Next",
                        onPress: () {
                          context.go('/signupUploadPhoto');
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
