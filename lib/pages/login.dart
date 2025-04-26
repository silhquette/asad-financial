import 'package:flutter/material.dart';

import 'package:assad_app/widget/primary_button.dart';
import 'package:assad_app/widget/custom_text_form_field.dart';

import 'package:assad_app/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'fadhlimuhammad@gmail.com');
  final _passwordController = TextEditingController();
  final _loginController = LoginController();
  bool _obscureText = true;
  bool _isLoading = false;

  // Toggle Password Visibility
  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // Simple Validation
  String? emailValidator(String? value) => value != 'fadhlimuhammad@gmail.com'
      ? 'Email harus fadhlimuhammad@gmail.com'
      : null;
  String? passwordValidator(String? value) =>
      (value == null || value.isEmpty) ? 'Password tidak boleh kosong' : null;

  // Handle Submit Form
  void submitForm() async {
    bool success = false;
    try {
      setState(() => _isLoading = true);
      success = await _loginController.submitLogin(formKey: _formKey);
    } catch (e) {
      print(e);
    } finally {
      setState(() => _isLoading = false);
    }

    if (!mounted) return;
    if (success) {
      Navigator.pushReplacementNamed(context, 'home');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            color: Color(0xff050B79),
            child: Image.asset('assets/images/hero.png',
                fit: BoxFit.cover,
                width: double.infinity,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              margin: const EdgeInsets.only(top: 200),
              height: 590,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(height: 24),
                  const Text(
                    "Masuk",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 24),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: 'Email atau Username',
                          validator: emailValidator,
                        ),
                        const SizedBox(height: 16),
                        CustomTextFormField(
                          controller: _passwordController,
                          hintText: 'Kata Sandi',
                          validator: passwordValidator,
                          obscureText: _obscureText,
                          suffixIcon: IconButton(
                            onPressed: togglePasswordVisibility,
                            icon: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 150),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(onPressed: submitForm, text: _isLoading ? 'Menyimpan...' : 'Masuk')
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
