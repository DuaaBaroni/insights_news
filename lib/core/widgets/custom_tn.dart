import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    required String style,
  });
  final String text;
  final Function() onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 45,
        width: width ?? 250,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cardColor,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: onPressed,
            child: Text(
              text,
              style: getBodyStyle(),
            )));
  }
}
