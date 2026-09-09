import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void mostrarInformacion(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Acerca de Gestor de Bodega'),
          content: const Text(
            'Gestor de Bodega es una aplicación desarrollada en Flutter '
            'para consultar inventario, controlar entradas y salidas '
            'y gestionar productos favoritos mediante Provider.\n\n'
            'La aplicación funciona de forma local y no requiere conexión '
            'a Internet para sus funciones principales.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cerrar'),
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
        title: const Text('Perfil y aplicación'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 105,
              height: 105,
              decoration: const BoxDecoration(
                color: Color(0xFF8BC34A),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.warehouse,
                size: 58,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Gestor de Bodega',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Control de inventario y movimientos',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),

            const ListTile(
              leading: Icon(
                Icons.inventory_2,
                color: Colors.green,
              ),
              title: Text('Inventario'),
              subtitle: Text(
                'Consulta de productos, precios y stock',
              ),
            ),

            const ListTile(
              leading: Icon(
                Icons.swap_vert,
                color: Colors.green,
              ),
              title: Text('Movimientos'),
              subtitle: Text(
                'Registro de entradas y salidas mediante Provider',
              ),
            ),

            const ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: Text('Favoritos'),
              subtitle: Text(
                'Selección de productos administrada con Provider',
              ),
            ),

            const ListTile(
              leading: Icon(
                Icons.offline_bolt,
                color: Colors.green,
              ),
              title: Text('Modo local'),
              subtitle: Text(
                'La aplicación funciona sin conexión a Internet',
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => mostrarInformacion(context),
                icon: const Icon(Icons.info_outline),
                label: const Text('Acerca de la aplicación'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}