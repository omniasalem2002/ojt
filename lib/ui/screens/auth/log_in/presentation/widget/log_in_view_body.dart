import 'package:flutter/material.dart';
import 'package:atw_ltd_task/ui/screens/auth/log_in/logic/log_in_view_model.dart';
import 'package:atw_ltd_task/ui/utils/styles.dart';
import 'package:atw_ltd_task/ui/widget/custom_appbar.dart';
import 'package:atw_ltd_task/ui/widget/custom_button.dart';
import 'package:atw_ltd_task/ui/widget/custom_text_form_field.dart';
import 'package:atw_ltd_task/ui/widget/form_label.dart';

class LogInViewBody extends StatelessWidget {
  final LoginViewModel viewModel;

  const LogInViewBody({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: viewModel.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // AppBar takes 28% of the screen height
            const SizedBox(height: 20,),
            const Flexible(
              flex: 20,
              child: CustomAppbar(),
            ),
            const SizedBox(height: 10),

            // Email and Password fields grouped together in the same flex
            Flexible(
              flex: 35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormLabel(label: 'Email'),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    hintText: 'Your email',
                    controller: viewModel.emailController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter email';
                      }
                      final emailRegex = RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                      if (!emailRegex.hasMatch(text)) {
                        return 'Email format is not valid';
                      }
                      return null;
                    },
                    type: TextInputType.emailAddress,
                    isPassword: false,
                  ),
                  const SizedBox(height: 15),
                  FormLabel(label: 'Password'),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    hintText: 'Password',
                    controller: viewModel.passwordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter password';
                      }
                      if (text.length < 6) {
                        return 'Password should be at least 6 characters.';
                      }
                      return null;
                    },
                    type: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Spacer to push the button to the bottom
            const Spacer(),

            // Button positioned at the bottom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    title: "Sign in",
                    onPressed: () {
                      viewModel.login(context); // Pass context to login function
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: Styles.font18SecondaryNormal()),
                      const SizedBox(width: 8),
                      Text("Register", style: Styles.font18BlackMedium()),
                    ],
                  ),
                 const  SizedBox(height: 20,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
