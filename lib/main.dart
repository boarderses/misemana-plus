import 'package:flutter/material.dart';

import 'data/models/usuario_model.dart';
import 'data/repositories/usuario_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MiSemana+',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {

  final UsuarioRepository repository =
      UsuarioRepository();

  List<UsuarioModel> usuarios = [];

  @override
  void initState() {
    super.initState();
    cargarUsuarios();
  }

  Future<void> cargarUsuarios() async {
    usuarios =
        await repository.obtenerUsuarios();

    setState(() {});
  }

  Future<void> agregarUsuario() async {

    await repository.insertarUsuario(
      UsuarioModel(
        nombre: "Alejandro",
        email:
            "alejandro${DateTime.now().millisecondsSinceEpoch}@gmail.com",
      ),
    );

    await cargarUsuarios();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("MiSemana+"),
      ),
      body: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) {

          final usuario =
              usuarios[index];

          return ListTile(
            title:
                Text(usuario.nombre),
            subtitle:
                Text(usuario.email),
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton(
        onPressed: agregarUsuario,
        child: const Icon(Icons.add),
      ),
    );
  }
}
