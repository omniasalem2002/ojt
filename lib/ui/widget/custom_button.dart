import 'package:atw_ltd_task/ui/utils/app_colors.dart';
import 'package:atw_ltd_task/ui/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  Function()? onPressed;
  CustomButton({required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryPurple,
        padding: const EdgeInsets.symmetric(vertical: 22),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed,
      child: Text(title, style: Styles.font16WhiteNormal()),
    );
  }
}
