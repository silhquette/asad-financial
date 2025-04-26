import 'package:assad_app/pages/finance/deposit_method.dart';
import 'package:assad_app/pages/profile/qr_code.dart';
import 'package:assad_app/layout/base.dart';
import 'package:flutter/material.dart';

import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
      routes: {
        'login': (context) => const LoginPage(),
        'home': (context) => const BaseLayout(pageIndex: 0),
        'qr_code': (context) => const QrCode(),
        'deposit_method': (context) => const DepositMethod(),
      },
    );
  }
}