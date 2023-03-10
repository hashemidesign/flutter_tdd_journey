import 'package:flutter/material.dart';
import 'package:tdd_journey/home_screen.dart';
import 'package:tdd_journey/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  key: const ValueKey("email"),
                  decoration:
                      const InputDecoration(hintText: "Enter Email Address"),
                  validator: (value) => Validator.validateEmail(value ?? ""),
                ),
                TextFormField(
                  controller: _passwordController,
                  key: const ValueKey("password"),
                  decoration: const InputDecoration(hintText: "Enter Password"),
                  validator: (value) => Validator.validatePassword(value ?? ""),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      }
                    },
                    child: const Text("Log In")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
