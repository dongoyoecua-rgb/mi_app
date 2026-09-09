import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/inventory_provider.dart';

class MovementsScreen extends StatelessWidget {
  const MovementsScreen({super.key});

  void mostrarConfirmacionSalida(
    BuildContext context,
    InventoryProvider inventoryProvider,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar salida'),
          content: const Text(
            '¿Deseas registrar una nueva salida de inventario?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                inventoryProvider.registrarSalida();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Salida registrada correctamente',
                    ),
                  ),
                );
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movimientos'),
      ),
      body: Consumer<InventoryProvider>(
        builder: (context, inventoryProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFDCEFC7),
                      child: Icon(
                        Icons.arrow_downward,
                        color: Colors.green,
                      ),
                    ),
                    title: const Text('Entradas'),
                    subtitle: const Text('Productos recibidos'),
                    trailing: Text(
                      '${inventoryProvider.entradas}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFDCEFC7),
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                      ),
                    ),
                    title: const Text('Salidas'),
                    subtitle: const Text('Productos despachados'),
                    trailing: Text(
                      '${inventoryProvider.salidas}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      inventoryProvider.registrarEntrada();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Entrada registrada correctamente',
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Registrar entrada'),
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      mostrarConfirmacionSalida(
                        context,
                        inventoryProvider,
                      );
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text('Registrar salida'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}