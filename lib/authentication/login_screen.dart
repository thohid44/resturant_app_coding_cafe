import 'package:flutter/material.dart';
import 'package:fooderlich/widgets/custom_text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: [
          Form(
              child: Column(
            children: [
              CustomTextField(
                data: Icons.lock,
                controller: _emailController,
                hinText: "Enter you valid email",
                isObscure: false,
              ),
              CustomTextField(
                data: Icons.lock,
                controller: _passwordController,
                hinText: "Password",
                isObscure: true,
              )
            ],
          ))
        ],
      ),
    ));
  }
}
