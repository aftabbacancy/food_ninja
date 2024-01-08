import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/utils/authentication.dart';
import 'package:food_ninja/utils/custom_colors.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:food_ninja/utils/resposive_sizes.dart';
import 'package:food_ninja/widgets/custom_input.dart';
import 'package:food_ninja/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      if (_nameController.text.trim().isNotEmpty &&
          _emailController.text.trim().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty) {
        setState(() {
          _isValid = true;
        });
      } else {
        setState(() {
          _isValid = false;
        });
      }
    });
    _emailController.addListener(() {
      if (_emailController.text.trim().isNotEmpty &&
          _nameController.text.trim().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty) {
        setState(() {
          _isValid = true;
        });
      } else {
        setState(() {
          _isValid = false;
        });
      }
    });
    _passwordController.addListener(() {
      if (_passwordController.text.trim().isNotEmpty &&
          _emailController.text.trim().isNotEmpty &&
          _nameController.text.trim().isNotEmpty) {
        setState(() {
          _isValid = true;
        });
      } else {
        setState(() {
          _isValid = false;
        });
      }
    });
  }

  void onSubmit() async {
    var dialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: Container(
          alignment: Alignment.center,
          width: 30,
          height: 30,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (context) => dialog,
      barrierDismissible: false,
    );
    String result = await Authentication().signUpUser(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
    if (result != 'success') {
      // ignore: use_build_context_synchronously
      Navigator.of(context, rootNavigator: true).pop('dialog');
      var dialog = AlertDialog(
        title: const Text("Validation Error"),
        content: Text(result),
        actions: [
          TextButton(
            child: const Text("Ok"),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop('dialog');
            },
          ),
        ],
      );
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => dialog,
        barrierDismissible: false,
      );
    } else {
      // ignore: use_build_context_synchronously
      context.go('/signupUserDetails');
    }
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
              height: height * 0.48,
              fit: BoxFit.cover,
            ),
            Center(
              child: SizedBox(
                width: ResponsiveSizes.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: ResponsiveSizes.responsiveHeight(47),
                    ),
                    Center(
                      child: Image.asset(
                        Images.foodLogo,
                        width: ResponsiveSizes.responsiveWidth(175, width),
                        height: ResponsiveSizes.responsiveHeight(139),
                      ),
                    ),
                    Text(
                      "FoodNinja",
                      style: TextStyle(
                        fontSize: FontSizes.responsiveSize(40),
                        fontWeight: FontWeight.bold,
                        color: CustomColors.primaryGreen,
                      ),
                    ),
                    Text(
                      "Deliever Favorite Food",
                      style: TextStyle(
                        fontSize: FontSizes.responsiveSize(13),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveSizes.responsiveHeight(60),
                    ),
                    Text(
                      "Sign Up For Free",
                      style: TextStyle(
                        fontSize: FontSizes.responsiveSize(20),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        ResponsiveSizes.responsiveWidth(25, width),
                        ResponsiveSizes.responsiveHeight(40),
                        ResponsiveSizes.responsiveWidth(25, width),
                        ResponsiveSizes.responsiveHeight(25),
                      ),
                      child: Column(
                        children: [
                          CustomInput(
                            labelText: "Name",
                            prefixIcon: Images.user,
                            controller: _nameController,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomInput(
                            labelText: "Email",
                            prefixIcon: Images.email,
                            controller: _emailController,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomInput(
                            labelText: "Password",
                            prefixIcon: Images.lock,
                            controller: _passwordController,
                            password: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Center(
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: CustomColors.primaryGreen,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: SvgPicture.asset(
                                        Images.check,
                                        width: 17,
                                        height: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Keep Me Signed In",
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Center(
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: CustomColors.primaryGreen,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: SvgPicture.asset(
                                        Images.check,
                                        width: 17,
                                        height: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Email Me About Special Pricing",
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          PrimaryButton(
                            title: "Create Account",
                            isValid: _isValid,
                            onPress: () {
                              onSubmit();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1,
                                  color: CustomColors.primaryGreen,
                                ),
                              ),
                            ),
                            child: InkWell(
                              onTap: () => context.go('/signin'),
                              child: Text(
                                "Already have an account?",
                                style: TextStyle(
                                  fontSize: FontSizes.responsiveSize(12),
                                  fontWeight: FontWeight.w600,
                                  color: CustomColors.primaryGreen,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.09,
                          )
                        ],
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
