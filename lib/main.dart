import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'screens/aquarium_form.dart';
import 'screens/aquarium_list.dart';

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
  int tab = 1;
  List<Map<String, dynamic>> aquariums = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Wechsel zwischen Liste und Formular
      body: tab == 0
          ? AquariumList(
              aquariums: aquariums,
              onDelete: (i) => setState(() => aquariums.removeAt(i)),
              onCreateTap: () => setState(() => tab = 1),
            )
          : AquariumForm(
              onSave: (aq) => setState(() {
                aquariums.insert(0, aq);
                tab = 0;
              }),
            ),
      // Untere Navigationsleiste
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppColors.border, width: 0.5)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SafeArea(
          child: Row(
            children: [
              _tab(Icons.grid_view_rounded, 'MY AQUARIUMS', 0),
              _tab(Icons.add_circle_outline, 'CREATE', 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tab(IconData icon, String label, int index) {
    final active = tab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => tab = index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: active ? AppColors.primary : AppColors.muted,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: active ? AppColors.primary : AppColors.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
