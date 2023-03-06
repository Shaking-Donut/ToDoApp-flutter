import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:todo/views/widgets/register_form.dart';
import 'package:todo/views/widgets/social_register_buttons.dart';
import 'package:todo/views/widgets/welcome_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
              const SocialRegisterButtons(),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
