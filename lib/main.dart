import 'package:flutter/material.dart';

void main() => runApp(const AppLecturasRoldan());

class AppLecturasRoldan extends StatelessWidget {
  const AppLecturasRoldan({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lecturas Roldan",
      home: Libros(),
    );
  }
}

// Extracted the reusable UI component into its own StatelessWidget
class GenreSquare extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;

  const GenreSquare({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 145,
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.black),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class Libros extends StatelessWidget {
  const Libros({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: const Text(
          "Lecturas Roldan",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.book, color: Color(0xFF4169E1)),
          SizedBox(width: 15),
          Icon(Icons.person, color: Color(0xFF4169E1)),
          SizedBox(width: 15),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Fila 1: Romance y Acción
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Replaced non-existent Icons.local_flower with Icons.local_florist
                  GenreSquare(
                      color: Colors.lightBlue.shade300,
                      icon: Icons.local_florist,
                      text: "Romance"),
                  // Replaced non-existent Icons.crossed_arms_indicator with Icons.bolt
                  GenreSquare(
                      color: Colors.blue.shade700,
                      icon: Icons.bolt,
                      text: "Acción"),
                ],
              ),
              // Fila 2: Comedia y Aventura
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icons.theater_comedy exists
                  GenreSquare(
                      color: Colors.blueAccent,
                      icon: Icons.theater_comedy,
                      text: "Comedia"),
                  // Icons.scuba_diving exists
                  GenreSquare(
                      color: Colors.cyan.shade600,
                      icon: Icons.scuba_diving,
                      text: "Aventura"),
                ],
              ),
              // Fila 3: Fantasía y Misterio
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icons.auto_awesome exists (corrected casing)
                  GenreSquare(
                      color: Colors.indigo.shade400,
                      icon: Icons.auto_awesome,
                      text: "Fantasía"),
                  GenreSquare(
                      color: Colors.blue.shade900,
                      icon: Icons.search,
                      text: "Misterio"),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}