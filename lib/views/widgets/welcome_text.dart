import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, bottom: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: const <Widget>[
              Text(
                'Witaj w',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 24),
              ),
              Text(
                'ToDo',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 36),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
