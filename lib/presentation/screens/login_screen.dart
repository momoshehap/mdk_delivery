import 'package:MDKDelivery/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/api_cubit/api_states.dart';
import 'package:MDKDelivery/presentation/widgets/login_componants.dart';
import 'package:MDKDelivery/utils/strings.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
  Widget build(BuildContext contextt) {
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
                  SvgPicture.asset("assets/icons/logoDark.svg"),
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
                    keyboardType: TextInputType.number,
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
                    keyboardType: TextInputType.number,
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
                  BlocConsumer<ApiAppCubit, ApiStates>(
                    listener: (context, state) {
                      if (state is GetLoginDataSuccessState) {
                        Navigator.of(context).pushReplacementNamed(
                          appMainScreen,
                        );
                      }
                      if (state is GetwrongAccountState) {
                        buildWrongAccountDialog(context);
                      }
                      if (state is GetLoginDataErorrState) {
                        buildCheckInternetAlert(context);
                      }
                    },
                    builder: (context, state) {
                      var cubit = ApiAppCubit.get(context);
                      return ConditionalBuilder(
                        condition: state is! NewLoginLoadingState,
                        builder: (context) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            primary: Color(0xff155079),
                            minimumSize: const Size.fromHeight(55), // NEW
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await cubit.getLoginData(
                                context: contextt,
                                number: usernameController.text.toString(),
                                password: passwordController.text.toString(),
                              );
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        fallback: (context) => const Center(
                            child: CircularProgressIndicator(
                          color: Color(0xff155079),
                        )),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "V 2.3",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "SegoeUI",
                      color: Color(0xff004067),
                      fontWeight: FontWeight.bold,
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
