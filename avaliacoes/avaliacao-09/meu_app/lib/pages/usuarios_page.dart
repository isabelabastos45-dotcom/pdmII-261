import 'package:flutter/material.dart';
import 'package:meu_app/services/api_service.dart';
import 'package:meu_app/models/usuario.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  late Future<List<Usuario>> usuariosFuture;

  @override
  void initState() {
    super.initState();
    usuariosFuture = ApiService.buscarUsuarios();
  }

  Future<void> atualizarLista() async {
    setState(() {
      usuariosFuture = ApiService.buscarUsuarios();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
      ),

      body: RefreshIndicator(

        onRefresh: atualizarLista,

        child: FutureBuilder<List<Usuario>>(

          future: usuariosFuture,

          builder: (context, snapshot) {

            if (snapshot.connectionState ==
                ConnectionState.waiting) {

              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {

              return Center(
                child: Text(
                  'Erro: ${snapshot.error}',
                ),
              );
            }

            if (!snapshot.hasData ||
                snapshot.data!.isEmpty) {

              return const Center(
                child: Text('Nenhum usuário encontrado'),
              );
            }

            final usuarios = snapshot.data!;

            return ListView.builder(

              itemCount: usuarios.length,

              itemBuilder: (context, index) {

                final usuario = usuarios[index];

                return Card(
                  margin: const EdgeInsets.all(8),

                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        usuario.nome[0],
                      ),
                    ),

                    title: Text(usuario.nome),

                    subtitle: Text(usuario.email),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

