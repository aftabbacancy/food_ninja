import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/utils/custom_colors.dart';
import 'package:food_ninja/utils/font_sizes.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPress,
    this.isValid = true,
  });

  final String title;
  final Function onPress;
  final bool isValid;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.isValid ? widget.onPress() : null;
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: CustomColors.primaryGreen,
        padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(60),
          ScreenUtil().setHeight(15),
          ScreenUtil().setWidth(60),
          ScreenUtil().setHeight(15),
        ),
      ),
      child: Text(
        widget.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: FontSizes.responsiveSize(16),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
