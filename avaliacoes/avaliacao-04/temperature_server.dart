import 'dart:io';
import 'dart:async';
import 'dart:math';

Future<void> main() async {
  const host = '127.0.0.1';
  const port = 4040;

  final random = Random();

  try {
    final socket = await Socket.connect(host, port);
    print('Conectado ao servidor');

    // Timer periódico (assíncrono)
    Timer.periodic(Duration(seconds: 10), (timer) {
      final temperature = (20 + random.nextDouble() * 15).toStringAsFixed(2);
      
      print('Enviando temperatura: $temperature °C');
      socket.write(temperature);
    });

  } catch (e) {
    print('Erro ao conectar: $e');
  }
}