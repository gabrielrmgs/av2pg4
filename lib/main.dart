import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistema_de_reservas/pages/auth_page.dart';
import 'package:sistema_de_reservas/pages/main_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Reservas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 27, 38, 44)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
  }
}
