import 'package:flutter/material.dart';
import 'package:todo/model/input_types.dart';
import 'package:todo/views/widgets/input.dart';
import 'package:todo/colors.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({
    Key? key,
  }) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<bool> _emailIsFocused = ValueNotifier(false);
  late final FocusNode _emailFocus = FocusNode()
    ..addListener(() {
      _emailIsFocused.value = _emailFocus.hasFocus;
    });

  final ValueNotifier<bool> _passwordIsFocused = ValueNotifier(false);
  late final FocusNode _passwordFocus = FocusNode()
    ..addListener(() {
      _passwordIsFocused.value = _passwordFocus.hasFocus;
    });

  final ValueNotifier<bool> _fullNameIsFocused = ValueNotifier(false);
  late final FocusNode _fullNameFocus = FocusNode()
    ..addListener(() {
      _fullNameIsFocused.value = _fullNameFocus.hasFocus;
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Lub użyj adresu email i hasła',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ValueListenableBuilder<bool>(
                valueListenable: _fullNameIsFocused,
                builder: (context, isFocused, child) => Input(
                  type: InputTypes.fullName,
                  controller: _fullNameController,
                  isFocused: isFocused,
                  focusNode: _fullNameFocus,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ValueListenableBuilder<bool>(
                valueListenable: _emailIsFocused,
                builder: (context, isFocused, child) => Input(
                  type: InputTypes.email,
                  controller: _emailController,
                  focusNode: _emailFocus,
                  isFocused: isFocused,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ValueListenableBuilder<bool>(
                valueListenable: _passwordIsFocused,
                builder: (context, isFocused, child) => Input(
                  type: InputTypes.password,
                  controller: _passwordController,
                  isFocused: isFocused,
                  focusNode: _passwordFocus,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              minimumSize: const Size(double.infinity, 60),
            ),
            onPressed: () {
              // TODO: Login function
            },
            child: const Text(
              'Zarejestruj się',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Masz już konto?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.gray5,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'Zaloguj się',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
