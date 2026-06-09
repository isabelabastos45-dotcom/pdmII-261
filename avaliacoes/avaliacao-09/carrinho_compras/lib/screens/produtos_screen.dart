import 'package:flutter/material.dart';

import '../models/produto.dart';
import '../widgets/produto_card.dart';
import 'carrinho_screen.dart';

class ProdutosScreen extends StatelessWidget {
  const ProdutosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final produtos = [
      Produto(id: 1, nome: 'Notebook', preco: 3500),
      Produto(id: 2, nome: 'Mouse', preco: 80),
      Produto(id: 3, nome: 'Teclado', preco: 150),
      Produto(id: 4, nome: 'Monitor', preco: 1200),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CarrinhoScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return ProdutoCard(
            produto: produtos[index],
          );
        },
      ),
    );
  }
}