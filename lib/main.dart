// lib/main.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Login App',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  void _login(BuildContext context) {
    // Logika sederhana untuk validasi username dan password
    if (usernameController.text == '22552011062' && passwordController.text == '20030730') {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => DashboardPage(username: 'Fajar Firdaus'), // Mengubah username menjadi nama
        ),
      );
    } else {
      // Tampilkan pesan kesalahan
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Kesalahan'),
          content: const Text('Username atau Password salah'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menambahkan ikon gambar jaringan di atas username textfield
            Image.network(
              'https://direktori.lldikti4.id/uploads/logo_pt/041134.png', // Ganti dengan URL gambar yang sesuai
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 16),
            CupertinoTextField(
              controller: usernameController,
              placeholder: 'Username',
            ),
            const SizedBox(height: 16),
            CupertinoTextField(
              controller: passwordController,
              placeholder: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 20),
            CupertinoButton.filled(
              child: const Text('Login'),
              onPressed: () => _login(context),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final String username;

  const DashboardPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Dashboard'),
      ),
      child: Center(
        child: Text('Selamat datang, $username!'),
      ),
    );
  }
}