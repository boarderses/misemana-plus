import 'package:flutter/material.dart';
import '../../data/models/usuario_model.dart';
import '../../data/repositories/usuario_repository.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {

  final nombreController =
      TextEditingController();

  final dormirController =
      TextEditingController();

  final despertarController =
      TextEditingController();

  final UsuarioRepository repository =
    UsuarioRepository();

  @override
  void dispose() {
    nombreController.dispose();
    dormirController.dispose();
    despertarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("MiSemana+"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: "Nombre",
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: dormirController,
              decoration: const InputDecoration(
                labelText: "Hora de dormir",
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: despertarController,
              decoration: const InputDecoration(
                labelText: "Hora de despertar",
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {

              if (nombreController.text.isEmpty ||
                  dormirController.text.isEmpty ||
                  despertarController.text.isEmpty) {
                return;
              }
              final usuario = UsuarioModel(
                  nombre: nombreController.text,
                  horaDormir: dormirController.text,
                  horaDespertar: despertarController.text,
              );
              await repository.insertarUsuario(usuario,);

              final id = await repository.insertarUsuario(usuario);

                print("ID insertado: $id");

                final usuarios = await repository.obtenerUsuarios();

                print("Usuarios después de guardar: ${usuarios.length}");

                for (final u in usuarios) {
                  print("Usuario: ${u.nombre}");
                }
              if (!mounted) return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeScreen(
                    nombre: usuario.nombre,
                    horaDormir: usuario.horaDormir,
                    horaDespertar: usuario.horaDespertar,
                  ),
                ),
              );
  },
  child: const Text("Guardar"),
),
          ],
        ),
      ),
    );
  }
}