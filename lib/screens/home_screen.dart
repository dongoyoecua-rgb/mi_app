import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/inventory_provider.dart';
import '../widgets/summary_card.dart';
import 'favorites_screen.dart';
import 'inventory_screen.dart';
import 'movements_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestor de Bodega'),
      ),
      body: Consumer<InventoryProvider>(
        builder: (context, inventoryProvider, child) {
          return Padding(
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
                          builder: (context) =>
                              const InventoryScreen(),
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
                          builder: (context) =>
                              const FavoritesScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.favorite),
                    label: const Text('Ver favoritos'),
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
                          builder: (context) =>
                              const MovementsScreen(),
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
                          builder: (context) =>
                              const ProfileScreen(),
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
                    children: [
                      SummaryCard(
                        title: 'Productos',
                        value:
                            '${inventoryProvider.totalProductos}',
                        icon: Icons.inventory_2,
                      ),
                      SummaryCard(
                        title: 'Stock total',
                        value:
                            '${inventoryProvider.stockTotal}',
                        icon: Icons.warehouse,
                      ),
                      SummaryCard(
                        title: 'Entradas',
                        value:
                            '${inventoryProvider.entradas}',
                        icon: Icons.arrow_downward,
                      ),
                      SummaryCard(
                        title: 'Salidas',
                        value:
                            '${inventoryProvider.salidas}',
                        icon: Icons.arrow_upward,
                      ),
                    ],
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