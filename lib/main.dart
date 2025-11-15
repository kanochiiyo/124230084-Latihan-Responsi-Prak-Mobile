import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:latres/models/user_model.dart';
import 'package:latres/views/auth/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('users');

  // Jalankan build runner abis ini di terminal
  // flutter pub run build_runner build
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginView());
  }
}
