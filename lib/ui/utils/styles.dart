import 'package:flutter/material.dart';
import 'package:atw_ltd_task/ui/utils/app_colors.dart';

abstract class Styles {
  static TextStyle font22WhiteMedium() =>const TextStyle(
    fontWeight: FontWeight.w500, // Medium weight
    fontSize: 22,
    color: AppColors.whiteColor,
  );

  static TextStyle font18BlackMedium() => const TextStyle(
    fontWeight: FontWeight.w500, // Medium weight
    fontSize: 18,
    color: AppColors.blackColor,
  );

  static TextStyle font16WhiteNormal() => const TextStyle(
    fontWeight: FontWeight.normal, // Normal weight
    fontSize: 16,
    color: AppColors.whiteColor,
  );

  static TextStyle font15WhiteNormal() =>const TextStyle(
    fontWeight: FontWeight.normal, // Normal weight
    fontSize: 15,
    color: AppColors.whiteColor,
  );

  static TextStyle font15WhiteBold() => const TextStyle(
    fontWeight: FontWeight.bold, // Bold weight
    fontSize: 30,
    color: AppColors.whiteColor,
  );

  static TextStyle font40BlackBold() =>const TextStyle(
    fontWeight: FontWeight.bold, // Bold weight
    fontSize: 40,
    color: AppColors.blackColor,
  );

  static TextStyle font18SecondaryNormal() =>const TextStyle(
    fontWeight: FontWeight.normal, // Normal weight
    fontSize: 18,
    color: AppColors.blackColor,
  );
  static TextStyle font25SecondaryNormal() =>const TextStyle(
    fontWeight: FontWeight.normal, // Normal weight
    fontSize: 25,
    color: AppColors.blackColor,
  );

}
