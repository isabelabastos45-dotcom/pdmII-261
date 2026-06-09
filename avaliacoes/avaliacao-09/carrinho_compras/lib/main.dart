import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/carrinho_provider.dart';
import 'screens/produtos_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CarrinhoProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrinho de Compras',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: const ProdutosScreen(),
    );
  }
}