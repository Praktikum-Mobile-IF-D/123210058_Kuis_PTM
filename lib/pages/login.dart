import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Dulu Boss'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey ,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _login(context);
              },
              child: Text('Login'),   //btn login
            ),
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) {   //validasi login
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (!_isValidEmail(username)) {
      _showErrorDialog(context, 'Invalid Email', 'Masukkan alamat email yang sesuai !.');
      return;
    }

    if (!_isValidPassword(password)) {
      _showErrorDialog(context, 'Invalid Password', 'Password harus terdiri dari minimal 8 karakter !.');
      return;
    }

    if (username == 'admin@mail.com' && password == 'admin123') {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      _showErrorDialog(context, 'Login Failed', 'username atau password salah !.');
    }
  }

  bool _isValidEmail(String email) {
    String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  bool _isValidPassword(String password) {
    return password.length >= 8;
  }

  void _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
