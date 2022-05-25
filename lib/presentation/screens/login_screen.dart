import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import '../../utils/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/logoDarkLogin.png"),
                  const SizedBox(
                    height: 80,
                  ),
                  const Text(
                    "SIGN IN",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "SegoeUI",
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your number';
                      }
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      filled: true,
                      hintText: "number",
                      prefixIcon: const Icon(
                        Icons.person,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }

                      return null;
                    },
                    maxLines: 1,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      filled: true,
                      hintText: "password",
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                          color: _isObscure ? Colors.grey : Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      primary: Color(0xff155079),
                      minimumSize: const Size.fromHeight(55), // NEW
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            appMainScreen, (Route<dynamic> route) => false);
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
