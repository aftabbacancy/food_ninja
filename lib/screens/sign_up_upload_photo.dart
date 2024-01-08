import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:food_ninja/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';

class SignUpUploadPhoto extends StatefulWidget {
  const SignUpUploadPhoto({super.key});

  @override
  State<SignUpUploadPhoto> createState() => _SignUpUploadPhotoState();
}

class _SignUpUploadPhotoState extends State<SignUpUploadPhoto> {
  bool showPhoto = false;

  @override
  void initState() {
    super.initState();
    showPhoto = false;
  }

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
                      "Upload Your Profile Photo",
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
                    !showPhoto
                        ? Container(
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
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: Column(children: [
                                SvgPicture.asset(Images.photos),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "From Gallery",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSizes.responsiveSize(12),
                                  ),
                                ),
                              ]),
                            ),
                          )
                        : Center(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(22),
                              ),
                              child: Image.asset(
                                Images.demoUser,
                                width: width * 0.6,
                                height: width * 0.6,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    !showPhoto
                        ? Container(
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
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: Column(children: [
                                SvgPicture.asset(Images.camera),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Take Photo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSizes.responsiveSize(12),
                                  ),
                                ),
                              ]),
                            ),
                          )
                        : const SizedBox(
                            width: 0,
                          ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: PrimaryButton(
                        title: "Next",
                        onPress: () {
                          if (!showPhoto) {
                            setState(() {
                              showPhoto = true;
                            });
                          } else {
                            context.go('/setLocation');
                          }
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
