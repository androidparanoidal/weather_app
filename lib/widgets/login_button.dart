import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginButton extends StatelessWidget {
  LoginButton({@required this.onTapMethod});
  final VoidCallback? onTapMethod;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ElevatedButton(
          onPressed: onTapMethod,
          style: ElevatedButton.styleFrom(
            backgroundColor: kBlueColor,
            shape: const StadiumBorder(),
            minimumSize: const Size.fromHeight(48.0),
          ),
          child: Text(
            'Войти',
            style: TextStyle(
              fontSize: 17.0,
              fontFamily: 'Roboto',
            ),
          )),
    );
  }
}
