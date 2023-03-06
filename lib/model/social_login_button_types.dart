class LoginWithButtonType {
  String imgUrl;

  LoginWithButtonType({required this.imgUrl});
}

class LoginWithButtonTypes {
  static final facebook = LoginWithButtonType(imgUrl: 'assets/Facebook.png');
  static final apple = LoginWithButtonType(imgUrl: 'assets/Apple.png');
  static final google = LoginWithButtonType(imgUrl: 'assets/Google.png');
}
