import 'package:flutter/material.dart';
import '../app_colors.dart';

// Formular zum Erstellen eines neuen Aquariums
class AquariumForm extends StatefulWidget {
  final void Function(Map<String, dynamic>) onSave;
  const AquariumForm({super.key, required this.onSave});

  @override
  State<AquariumForm> createState() => _AquariumFormState();
}

class _AquariumFormState extends State<AquariumForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Kopfbereich
            Container(
              height: 180,
              width: double.infinity,
              color: AppColors.primary,
              child: const Center(
                child: Text(
                  'ATI',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    letterSpacing: 4,
                  ),
                ),
              ),
            ),
            // Seitentitel
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'NEW AQUARIUM',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
