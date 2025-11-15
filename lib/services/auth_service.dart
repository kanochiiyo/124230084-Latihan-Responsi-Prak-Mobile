import 'package:hive/hive.dart';
import 'package:latres/models/user_model.dart';

class AuthService {
  // Akses box
  final Box<UserModel> _userBox = Hive.box<UserModel>('users');

  void register(String username, String password, String confirmPassword) {
    if (username.isEmpty || password.isEmpty) {
      throw Exception("Username atau password tidak boleh kosong.");
    }

    if (password.length < 6) {
      throw Exception("Password harus lebih dari 6 karakter.");
    }

    if (_userBox.containsKey(username)) {
      throw Exception("Username telah terdaftar.");
    }

    if (password != confirmPassword) {
      throw Exception("Password dan konfirmasi password tidak sama.");
    }

    final newUser = UserModel(username: username, password: password);
    _userBox.put(username, newUser);
  }

  void login(String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      throw Exception("Username atau password tidak boleh kosong.");
    }

    final user = _userBox.get(username);
    if (user == null) {
      throw Exception("User tidak terdaftar.");
    }

    if (password != user.password) {
      throw Exception("Password salah.");
    }
  }
}
