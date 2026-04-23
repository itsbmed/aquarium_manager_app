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
  final _key = GlobalKey<FormState>();
  final name = TextEditingController();

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

            // Formular
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    // Namenseingabe
                    _card(
                      'Aquarium Name',
                      null,
                      TextFormField(
                        controller: name,
                        style: const TextStyle(color: AppColors.text),
                        decoration: _input('e.g. Liebaqua'),
                        validator: (v) => v == null || v.trim().isEmpty
                            ? 'Bitte einen Namen eingeben'
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Wiederverwendbare Karte
  Widget _card(String label, IconData? icon, Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 14, color: AppColors.muted),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  // Eingabefeld-Stil
  InputDecoration _input(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: AppColors.muted, fontSize: 14),
      filled: true,
      fillColor: AppColors.input,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      errorStyle: const TextStyle(fontSize: 11),
    );
  }
}
