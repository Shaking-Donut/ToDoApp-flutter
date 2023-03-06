import 'package:flutter/material.dart';
import 'package:todo/model/social_login_button_types.dart';
import 'package:todo/colors.dart';

class LoginWithButton extends StatelessWidget {
  // const LoginWithButton({
  //   Key? key,
  //   required LoginWithButtonTypes type,
  // }) : super(key: key);
  const LoginWithButton({
    super.key,
    required this.type,
  });

  final LoginWithButtonType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.background3,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: AppColors.background2,
      ),
      child: Image(image: AssetImage(type.imgUrl)),
    );
  }
}
