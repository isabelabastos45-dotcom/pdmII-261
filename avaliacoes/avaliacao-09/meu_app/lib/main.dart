import 'package:flutter/material.dart';
import 'package:meu_app/pages/usuarios_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UsuariosPage(),
    );
  }
}