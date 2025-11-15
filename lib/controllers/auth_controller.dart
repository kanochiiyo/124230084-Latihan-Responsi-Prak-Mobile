import 'package:flutter/material.dart';
import 'package:latres/services/auth_service.dart';

class AuthController {
  final AuthService authService = AuthService();

  // Ambil dari UI
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 1));

    // Panggil service
    authService.login(usernameController.text, passwordController.text);
  }

  Future<void> register() async {
    await Future.delayed(const Duration(seconds: 1));

    // Panggil service
    authService.register(
      usernameController.text,
      passwordController.text,
      confirmPasswordController.text,
    );
  }
}
