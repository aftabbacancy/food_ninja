import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/utils/authentication.dart';
import 'package:food_ninja/utils/custom_colors.dart';
import 'package:food_ninja/utils/font_sizes.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:food_ninja/utils/resposive_sizes.dart';
import 'package:food_ninja/widgets/custom_input.dart';
import 'package:food_ninja/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GoogleSignIn googleSignIn =
      GoogleSignIn(signInOption: SignInOption.standard);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      print(user);

      // Use the user object for further operations or navigate to a new screen.
    } catch (e) {
      print(e.toString());
    }
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
    String result = await Authentication().logInUser(
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
      context.go('/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
            Center(
              child: SizedBox(
                width: ResponsiveSizes.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(47),
                    ),
                    Center(
                      child: Image.asset(
                        Images.foodLogo,
                        width:
                            ResponsiveSizes.responsiveWidth(175, screenWidth),
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
                      "Login To Your Account",
                      style: TextStyle(
                        fontSize: FontSizes.responsiveSize(20),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        ResponsiveSizes.responsiveWidth(25, screenWidth),
                        ResponsiveSizes.responsiveHeight(40),
                        ResponsiveSizes.responsiveWidth(25, screenWidth),
                        ResponsiveSizes.responsiveHeight(25),
                      ),
                      child: Column(
                        children: [
                          CustomInput(
                            labelText: "Email",
                            controller: _emailController,
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(12),
                          ),
                          CustomInput(
                            labelText: "Password",
                            controller: _passwordController,
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(20),
                          ),
                          Text(
                            "Or Continue With",
                            style: TextStyle(
                              fontSize: FontSizes.responsiveSize(12),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(20),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                      ResponsiveSizes.responsiveWidth(
                                          22, screenWidth),
                                      ResponsiveSizes.responsiveHeight(16),
                                      ResponsiveSizes.responsiveWidth(
                                          22, screenWidth),
                                      ResponsiveSizes.responsiveHeight(16),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Images.fb,
                                          width:
                                              ResponsiveSizes.responsiveWidth(
                                                  25, screenWidth),
                                          height:
                                              ResponsiveSizes.responsiveWidth(
                                                  25, screenWidth),
                                          fit: BoxFit.contain,
                                        ),
                                        SizedBox(
                                          width:
                                              ResponsiveSizes.responsiveWidth(
                                                  10, screenWidth),
                                        ),
                                        Text(
                                          "Facebook",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize:
                                                FontSizes.responsiveSize(12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ResponsiveSizes.responsiveWidth(
                                    20, screenWidth),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    signInWithGoogle();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color.fromRGBO(
                                          255,
                                          255,
                                          255,
                                          1,
                                        ),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: const Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                        ResponsiveSizes.responsiveWidth(
                                            22, screenWidth),
                                        ResponsiveSizes.responsiveHeight(16),
                                        ResponsiveSizes.responsiveWidth(
                                            22, screenWidth),
                                        ResponsiveSizes.responsiveHeight(16),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            Images.google,
                                            width:
                                                ResponsiveSizes.responsiveWidth(
                                                    25, screenWidth),
                                            height:
                                                ResponsiveSizes.responsiveWidth(
                                                    25, screenWidth),
                                            fit: BoxFit.contain,
                                          ),
                                          SizedBox(
                                            width:
                                                ResponsiveSizes.responsiveWidth(
                                                    10, screenWidth),
                                          ),
                                          Text(
                                            "Google",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  FontSizes.responsiveSize(12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(20),
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
                            child: Text(
                              "Forgot Your Password?",
                              style: TextStyle(
                                fontSize: FontSizes.responsiveSize(12),
                                fontWeight: FontWeight.w600,
                                color: CustomColors.primaryGreen,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(26),
                          ),
                          PrimaryButton(
                            title: "Login",
                            onPress: () {
                              onSubmit();
                            },
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
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
                            child: TextButton(
                              onPressed: () {
                                context.go("/signup");
                              },
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                minimumSize: const Size(10, 5),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                "Don't have an account?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: FontSizes.responsiveSize(12),
                                  fontWeight: FontWeight.w600,
                                  color: CustomColors.primaryGreen,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(20),
                          ),
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
