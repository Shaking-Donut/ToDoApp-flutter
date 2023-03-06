import 'package:flutter/material.dart';
import 'package:todo/model/social_login_button_types.dart';
import 'package:todo/views/widgets/social_login_button.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: const <Widget>[
                Text(
                  'Zaloguj się za pomocą',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              LoginWithButton(type: LoginWithButtonTypes.facebook),
              LoginWithButton(type: LoginWithButtonTypes.apple),
              LoginWithButton(type: LoginWithButtonTypes.google),
            ],
          ),
        ],
      ),
    );
  }
}
