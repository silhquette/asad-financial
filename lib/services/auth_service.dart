import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> login() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      return true;
    } catch (e) {
      print("error cuy : $e");
      return false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}