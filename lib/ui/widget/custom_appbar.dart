import 'package:flutter/material.dart';
import 'package:atw_ltd_task/ui/utils/styles.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.arrow_back_rounded, size: 24, color: Colors.black),
          const SizedBox(height: 16),
          Text(
            "Let's Sign you in",
            style: Styles.font40BlackBold(),
          ),
          const SizedBox(height: 8),
          Text(
            "Welcome back",
            style: Styles.font25SecondaryNormal(),
          ),
          const SizedBox(height: 4),
          Text(
            "You've been missed!",
            style: Styles.font25SecondaryNormal(),
          ),
        ],
      ),
    );
  }
}
