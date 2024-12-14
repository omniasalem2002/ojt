import 'package:atw_ltd_task/ui/utils/styles.dart';
import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  String label;
  FormLabel({required this.label});
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Styles.font18BlackMedium(),
    );
  }
}
