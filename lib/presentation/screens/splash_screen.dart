import 'package:flutter/material.dart';

import '../../data/repositories/usuario_repository.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  final UsuarioRepository repository =
      UsuarioRepository();

  @override
  void initState() {
    super.initState();
    comprobarUsuario();
  }

  Future<void> comprobarUsuario() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    final usuario =
        await repository.obtenerPrimerUsuario();
      print("Usuario encontrado al iniciar: $usuario");

      final usuarios = await repository.obtenerUsuarios();
      print("Usuarios en BD: ${usuarios.length}");

    if (!mounted) return;

    if (usuario == null) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              const OnboardingScreen(),
        ),
      );

    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(
            nombre: usuario.nombre,
            horaDormir:
                usuario.horaDormir,
            horaDespertar:
                usuario.horaDespertar,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}