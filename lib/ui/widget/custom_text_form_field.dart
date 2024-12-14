import 'package:flutter/material.dart';
import 'package:atw_ltd_task/ui/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType type;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.validator,
    required this.type,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword; // Initialize for password fields only
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.blackColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.blackColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
        ),
        fillColor: AppColors.whiteColor,
        filled: true,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.titleSmall,
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.blackColor,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
      ),
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: AppColors.blackColor,
      ),
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.type,
      obscureText: widget.isPassword ? _obscureText : false, // Fix here
    );
  }
}
