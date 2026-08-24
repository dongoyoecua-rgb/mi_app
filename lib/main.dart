import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MiPerfilApp());
}

class MiPerfilApp extends StatelessWidget {
  const MiPerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Perfil Profesional',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const PerfilPage(),
    );
  }
}

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool mostrarObjetivo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil Profesional'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Encabezado
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF3949AB),
                    Color(0xFF5C6BC0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 55,
                      color: Color(0xFF3949AB),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Gregorio Garzón',
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Estudiante de Sistemas Inteligentes',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Información profesional
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const InfoRow(
                      icon: Icons.work,
                      title: 'Experiencia',
                      description:
                          'Bodega, logística, producción y administración',
                    ),
                    const Divider(),
                    const InfoRow(
                      icon: Icons.school,
                      title: 'Formación',
                      description: 'Sistemas Inteligentes',
                    ),
                    const Divider(),
                    const InfoRow(
                      icon: Icons.computer,
                      title: 'Habilidades',
                      description:
                          'Excel, Power BI, Windows, Linux y Flutter',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Título de habilidades
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mis habilidades',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Fila de habilidades
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SkillCard(
                  icon: Icons.table_chart,
                  text: 'Excel',
                ),
                SkillCard(
                  icon: Icons.analytics,
                  text: 'Power BI',
                ),
                SkillCard(
                  icon: Icons.code,
                  text: 'Flutter',
                ),
              ],
            ),

            const SizedBox(height: 25),

            // Botón interactivo
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    mostrarObjetivo = !mostrarObjetivo;
                  });
                },
                icon: Icon(
                  mostrarObjetivo
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                label: Text(
                  mostrarObjetivo
                      ? 'Ocultar mi objetivo'
                      : 'Mostrar mi objetivo',
                ),
              ),
            ),

            // Información que aparece al presionar el botón
            if (mostrarObjetivo) ...[
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.indigo.shade200,
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.rocket_launch,
                      size: 40,
                      color: Colors.indigo,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Mi objetivo profesional',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Desarrollarme profesionalmente hasta alcanzar '
                      'posiciones de liderazgo y dirección empresarial.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const InfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.indigo,
          size: 30,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SkillCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const SkillCard({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.indigo,
              size: 30,
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}