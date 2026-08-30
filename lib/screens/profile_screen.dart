import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            'y gestionar productos favoritos.',
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

  Future<void> abrirFlutter(BuildContext context) async {
    final Uri url = Uri.parse('https://flutter.dev');

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No se pudo abrir el enlace'),
          ),
        );
      }
    }
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
              subtitle: Text('Consulta de productos y stock'),
            ),
            const ListTile(
              leading: Icon(
                Icons.swap_vert,
                color: Colors.green,
              ),
              title: Text('Movimientos'),
              subtitle: Text('Registro de entradas y salidas'),
            ),
            const ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: Text('Favoritos'),
              subtitle: Text(
                'Selección de productos mediante setState()',
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => abrirFlutter(context),
                icon: const Icon(Icons.open_in_new),
                label: const Text('Visitar Flutter'),
              ),
            ),
            const SizedBox(height: 10),
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