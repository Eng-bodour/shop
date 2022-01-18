import 'package:flutter/material.dart';
import 'package:shop/utils/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: const Center(
        child: Text('LoginScreen'),
      ),
    );
  }
}
