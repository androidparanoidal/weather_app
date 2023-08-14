import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text controllers
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  late bool _passwordVisible = false;

  late String email;
  late String password;

  Future logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim(),
      );
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return LocationScreen();
        },
      ));
    } catch (e) {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Внимание!'),
          content: const Text('Введенные данные неверные'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text(
                'OK',
                style: TextStyle(color: Color(0xFF0700FF)),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 26.0),
                Text(
                  'Вход',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Color(0xFF2B2D33),
                    fontFamily: 'Ubuntu Light',
                  ),
                ),
                const SizedBox(height: 12.0),
                Text(
                  'Введите данные для входа',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xFF8799A5),
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 48.0),

                // email text field
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 17.0),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: 'Email',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE4E6EC))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kBlueColor, width: 2)),
                  ),
                ),
                const SizedBox(height: 48.0),

                // password text field
                TextField(
                  controller: _passController,
                  obscureText: !_passwordVisible,
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 17.0),
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintText: 'Пароль',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: kBlueColor,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFE4E6EC))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kBlueColor, width: 2)),
                  ),
                ),
                const SizedBox(height: 48.0),
                LoginButton(onTapMethod: logIn),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
