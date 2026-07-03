import 'package:flutter/material.dart';

class ObjectiveCounterCard extends StatelessWidget {

  final String titulo;
  final IconData icono;
  final String unidad;
  final int valor;

  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ObjectiveCounterCard({
    super.key,
    required this.titulo,
    required this.icono,
    required this.unidad,
    required this.valor,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(

          children: [

            Icon(
              icono,
              size: 32,
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "$valor $unidad",
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: onDecrement,
              icon: const Icon(Icons.remove),
            ),

            IconButton(
              onPressed: onIncrement,
              icon: const Icon(Icons.add),
            ),

          ],
        ),
      ),
    );
  }
}