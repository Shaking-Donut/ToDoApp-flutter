import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:todo/views/widgets/login_form.dart';
import 'package:todo/views/widgets/social_login_buttons.dart';
import 'package:todo/views/widgets/welcome_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const WelcomeText(),
              const SocialLoginButtons(),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
