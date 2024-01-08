import 'package:flutter/material.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:food_ninja/widgets/onboard.dart';
import 'package:go_router/go_router.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<OnboardModal> onBoardData = [
    OnboardModal(
      "_234",
      "Find your Comfort\nFood here",
      "Here You Can find a chef or dish for every\ntaste and color. Enjoy!",
      Images.onboardOne,
    ),
    OnboardModal(
      "_224",
      "Food Ninja is Where Your\nComfort Food Lives",
      "Enjoy a fast and smooth food delivery at\nyour doorstep",
      Images.onboardTwo,
    )
  ];

  var currentScreen = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: SingleChildScrollView(
          child: Onboard(
            onBoardData[currentScreen].title,
            onBoardData[currentScreen].description,
            onBoardData[currentScreen].image,
            () {
              if (currentScreen == 0) {
                setState(() {
                  currentScreen = 1;
                });
              } else {
                context.go('/signin');
              }
            },
          ),
        ),
      ),
    );
  }
}

class OnboardModal {
  OnboardModal(this.id, this.title, this.description, this.image);
  String id;
  String title;
  String description;
  String image;
}
