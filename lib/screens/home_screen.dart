import 'package:flutter/material.dart';
import 'inventory_screen.dart';
import 'movements_screen.dart';
import 'profile_screen.dart';
import '../widgets/summary_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestor de Bodega'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Panel de control',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Resumen general del inventario',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InventoryScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.inventory_2),
                label: const Text('Ver inventario'),
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MovementsScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.swap_vert),
                label: const Text('Ver movimientos'),
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.person),
                label: const Text('Perfil y aplicación'),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  SummaryCard(
                    title: 'Productos',
                    value: '25',
                    icon: Icons.inventory_2,
                  ),
                  SummaryCard(
                    title: 'Stock total',
                    value: '350',
                    icon: Icons.warehouse,
                  ),
                  SummaryCard(
                    title: 'Entradas',
                    value: '48',
                    icon: Icons.arrow_downward,
                  ),
                  SummaryCard(
                    title: 'Salidas',
                    value: '32',
                    icon: Icons.arrow_upward,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}