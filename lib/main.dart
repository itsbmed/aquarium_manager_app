import 'package:flutter/material.dart';
import 'app_colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aquarium Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
      home: const HomeScreen(),
    );
  }
}

// Hauptbildschirm – verwaltet die Navigation und die Aquarienliste
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tab = 1; // 0 = Liste, 1 = Erstellen
  List<Map<String, dynamic>> aquariums = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(tab == 0 ? 'Liste' : 'Formular')));
  }
}
