import 'package:flutter/material.dart';
import 'package:assad_app/services/auth_service.dart';

class LoginController {
  final AuthService _authService = AuthService();

  Future<bool> submitLogin({
    required GlobalKey<FormState> formKey,
  }) async {
    if (formKey.currentState!.validate()) {
      return await _authService.login();
    }
    return false;
  }
}