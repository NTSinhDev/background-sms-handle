import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: "Tên đăng nhập...",
                border: OutlineInputBorder(),
                labelText: "Tên đăng nhập",
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: "Mật khẩu...",
                border: OutlineInputBorder(),
                labelText: "Mật khẩu",
              ),
            ),
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 36),
              child: ElevatedButton(
                onPressed: login,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                child: Container(
                  height: 44,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void login() async {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      // todo: login at here
    }
  }
}
