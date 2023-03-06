class InputType {
  InputType({
    required this.hintText,
    required this.labelText,
    this.obscureText = false,
  });

  String hintText;
  String labelText;
  bool obscureText;
}

class InputTypes {
  static final password = InputType(
    labelText: 'Hasło',
    hintText: 'Podaj swoje hasło',
    obscureText: true,
  );
  static final email = InputType(
    labelText: 'Email',
    hintText: 'Podaj swój adres email',
  );
  static final fullName = InputType(
    labelText: 'Imię',
    hintText: 'Podaj swoje pełne imię',
  );
}
